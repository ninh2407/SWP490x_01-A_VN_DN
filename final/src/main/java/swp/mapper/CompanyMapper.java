package swp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import swp.model.Company;

public class CompanyMapper implements RowMapper<Company> {
	public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
		Company company = new Company();
		company.setId(rs.getString("id"));
		company.setName(rs.getString("name"));
		company.setRegion(rs.getString("region"));
		company.setLinkRss(rs.getString("link_rss"));
		return company;
	}
}
