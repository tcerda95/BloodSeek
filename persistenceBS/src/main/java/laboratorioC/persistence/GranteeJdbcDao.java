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

@Repository
public class GranteeJdbcDao implements GranteeDao {
	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	@Autowired
	private HospitalDao hospitalDao;
	
	private static RowMapper<Grantee> granteeMapper = new RowMapper<Grantee>() {
		@Override
		public Grantee mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Grantee(rs.getInt("granteeId"), rs.getString("granteeName"), 
					rs.getString("description"), rs.getString("password"), BloodType.valueOf(rs.getString("bloodType")), 
					HospitalJdbcDao.hospitalMapper.mapRow(rs, rowNum), rs.getInt("age"), rs.getInt("donorsNeeded"), rs.getInt("actualDonated"));
		}
		
	};
	
	@Autowired
	public GranteeJdbcDao(final DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("grantees")
				.usingGeneratedKeyColumns("granteeid");
	}
	
	@Override
	@SuppressWarnings("boxing")
	public Grantee getGranteeById(int id) {
		final List<Grantee> granteeList = jdbcTemplate.query("SELECT * FROM grantees NATURAL JOIN hospitals WHERE granteeId = ?", granteeMapper, id);
		
		if (granteeList.isEmpty())
			return null;
		
		return granteeList.get(0);
	}

	@Override
	public List<Grantee> getGrantees() {
		final List<Grantee> grantees = jdbcTemplate.query("SELECT * FROM grantees", granteeMapper);
		
		return grantees;
	}

	@SuppressWarnings("boxing")
	@Override
	public Grantee createGrantee(int id, String name, String description, String password, BloodType bloodType,
			String hospitalAddress, int age, int donorsNeeded) {
		
		final Map<String, Object> args = new HashMap<>();
		
		args.put("granteeName", name);
		args.put("description", description);
		args.put("password", password);
		args.put("bloodType", bloodType.name());
		args.put("age", age);
		args.put("donorsNeeded", donorsNeeded);
		args.put("actualDonated", 0);
		args.put("hospitalAddress", hospitalAddress);
		
		final Number granteeId = jdbcInsert.executeAndReturnKey(args);		
		
		return new Grantee(granteeId.intValue(), name, description, password, bloodType, hospitalDao.getHospitalByAddress(hospitalAddress), age, donorsNeeded, 0);
	}

}
