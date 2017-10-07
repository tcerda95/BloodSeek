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

import laboratorioC.model.Grantee;

@Repository
public class GranteeJdbcDao implements GranteeDao {
	private final JdbcTemplate jdbcTemplate;
	private final SimpleJdbcInsert jdbcInsert;
	
	private RowMapper<Grantee> granteeMapper = new RowMapper<Grantee>() {

		@Override
		public Grantee mapRow(ResultSet rs, int rowNum) throws SQLException {
			return new Grantee(rs.getString("name"));
		}
		
	};
	
	@Autowired
	public GranteeJdbcDao(final DataSource ds) {
		jdbcTemplate = new JdbcTemplate(ds);
		
		jdbcInsert = new SimpleJdbcInsert(jdbcTemplate)
				.withTableName("grantees")
				.usingGeneratedKeyColumns("granteeid");
	}
	
	public Grantee getGranteeById(int id) {
		final Grantee grantee = (Grantee) jdbcTemplate.query("SELECT * FROM grantees WHERE id = " + id , granteeMapper);
		
		return grantee;
	}

	@Override
	public List<Grantee> getGrantees() {
		final List<Grantee> grantees = jdbcTemplate.query("SELECT * FROM grantees", granteeMapper);
		
		return grantees;
	}


}
