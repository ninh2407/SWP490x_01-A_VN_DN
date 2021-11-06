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
		String sql = "SELECT * FROM company WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id}, new CompanyMapper());
	}

	@Override
	public List<Company> findByRegion(String region) {
		String sql = "SELECT * FROM company WHERE region = ?";
		return jdbcTemplate.query(sql, new Object[] {region}, new CompanyMapper());
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
	
	public List<String> getAllProvince() {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		for (Company c : getAll()) {
			list.add(c.getProvince());
		}
		return list;
	}
	
	public Company findCompanyByProvince(String province) {
		String sql = "SELECT * FROM company WHERE province = ?";
		Company c = null;
		try {
			c= jdbcTemplate.queryForObject(sql, new Object[] {province}, new CompanyMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return c;
	}
		
}
