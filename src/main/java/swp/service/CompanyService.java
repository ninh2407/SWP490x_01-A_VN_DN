package swp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp.DAO.impl.CompanyDAOImpl;
import swp.model.Company;

@Service
public class CompanyService {
	@Autowired
	private CompanyDAOImpl companyDAOImpl;

	public List<String> getAllProvince() {
		return companyDAOImpl.getAllProvince();
	}
	
	public List<Company> getAllCompany() {
		return companyDAOImpl.getAll();
	}
	
	public Company findCompany(String id) {
		return companyDAOImpl.findCompany(id);
	}
	
	public List<Company> findByRegion(String region) {
		return companyDAOImpl.findByRegion(region);
	}
	
	public Company findCompanyByProvince(String province) {
		return companyDAOImpl.findCompanyByProvince(province);
	}
}
