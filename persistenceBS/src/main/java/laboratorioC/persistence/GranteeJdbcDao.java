package laboratorioC.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import laboratorioC.model.BloodType;
import laboratorioC.model.Grantee;
import laboratorioC.model.Hospital;

@Repository
public class GranteeJdbcDao implements GranteeDao {
	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	private final SimpleJdbcInsert donationsInsert;
	
	@Autowired
	private HospitalDao hospitalDao;
	
	private static RowMapper<Grantee> granteeMapper = new RowMapper<Grantee>() {
		@Override
		public Grantee mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Grantee(rs.getInt("granteeId"), rs.getString("granteeName"), 
					rs.getString("description"), rs.getString("password"), BloodType.valueOf(rs.getString("bloodType")), 
					null, rs.getInt("age"), rs.getInt("donorsNeeded"), rs.getInt("actualDonated"));
		}
		
	};
	
	@Autowired
	public GranteeJdbcDao(final DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("grantees")
				.usingGeneratedKeyColumns("granteeid");
		
		donationsInsert = new SimpleJdbcInsert(jdbcTemplate).withTableName("donationPoints");
	}
	
	@Override
	@SuppressWarnings("boxing")
	public Grantee getGranteeById(int id) {
		final List<Hospital> hospitals = getGranteeHospitals(id); 
		final List<Grantee> granteeList = jdbcTemplate.query("SELECT * FROM grantees WHERE granteeId = ?", granteeMapper, id);
		
		if (granteeList.isEmpty())
			return null;
		
		final Grantee grantee = granteeList.get(0);
		
		grantee.setHospitals(hospitals);
		
		return granteeList.get(0);
	}

	@Override
	public List<Grantee> getGrantees() {
		final List<Grantee> grantees = jdbcTemplate.query("SELECT * FROM grantees", granteeMapper);
		
		for (final Grantee g : grantees)
			g.setHospitals(getGranteeHospitals(g.getId()));
		
		return grantees;
	}

	@SuppressWarnings("boxing")
	@Override
	public Grantee createGrantee(String name, String description, String password, BloodType bloodType,
			List<String> hospitalsAddress, int age, int donorsNeeded) {
		
		final Map<String, Object> args = new HashMap<>();
		
		args.put("granteeName", name);
		args.put("description", description);
		args.put("password", password);
		args.put("bloodType", bloodType.name());
		args.put("age", age);
		args.put("donorsNeeded", donorsNeeded);
		args.put("actualDonated", 0);
		
		final Number granteeId = jdbcInsert.executeAndReturnKey(args);
		
		for (final String address : hospitalsAddress) {
			final Map<String, Object> relationArgs = new HashMap<>();

			relationArgs.put("granteeId", granteeId.intValue());
			relationArgs.put("hospitalId", hospitalDao.getHospitalByAddress(address).getId());
			
			donationsInsert.execute(relationArgs);
		}
		
		return new Grantee(granteeId.intValue(), name, description, password, bloodType, getGranteeHospitals(granteeId.intValue()), age, donorsNeeded, 0);
	}

	
	@SuppressWarnings("boxing")
	private List<Hospital> getGranteeHospitals(int granteeId) {
		return jdbcTemplate.query("SELECT hospitalId, hospitalName, hospitalAddress, latitude, longitude FROM grantees NATURAL JOIN donationPoints NATURAL JOIN hospitals WHERE granteeId = ?", 
				HospitalJdbcDao.hospitalMapper, granteeId);
	}
}
