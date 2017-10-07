package laboratorioC.persistence;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import laboratorioC.model.Hospital;

@Repository
public class HospitalJdbcDao implements HospitalDao {
	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	public static RowMapper<Hospital> hospitalMapper = new RowMapper<Hospital>() {

		@Override
		public Hospital mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Hospital(rs.getInt("hospitalId"), rs.getString("hospitalName"), rs.getString("hospitalAddress"), 
					rs.getDouble("latitude"), rs.getDouble("longitude"));
		}
		
	};
	
	@Autowired
	public HospitalJdbcDao(final DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("hospitals")
				.usingGeneratedKeyColumns("hospitalId");
	}
	
	@Override
	public List<Hospital> getHospitalsByName(final String name) {
		return jdbcTemplate.query("SELECT * FROM hospitals WHERE hospitalId = ?", hospitalMapper, name);
	}

	@Override
	public Hospital getHospitalByAddress(final String address) {
		final List<Hospital> hospitalList = jdbcTemplate.query("SELECT * FROM hospitals WHERE hospitalAddress = ?", hospitalMapper, address);
		
		if (hospitalList.isEmpty())
			return null;
		
		return hospitalList.get(0);
	}

	@Override
	public List<Hospital> getHospitals() {
		return jdbcTemplate.query("SELECT * FROM hospitals", hospitalMapper);
	}
}
