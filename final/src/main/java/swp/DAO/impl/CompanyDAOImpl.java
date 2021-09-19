package swp.DAO.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import swp.DAO.CompanyDAO;
import swp.mapper.CompanyMapper;
import swp.model.Company;

@Repository
public class CompanyDAOImpl implements CompanyDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addCompany(Company company) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Company findCompany(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Company> findByRegion(String region) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Company> getAll() {
		String sql = "select * from company";	
		return jdbcTemplate.query(sql, new CompanyMapper());
	}

	@Override
	public List<String> getAllLink() {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		for (Company c : getAll()) {
			list.add(c.getLinkRss());
		}
		return list;
	}

}
