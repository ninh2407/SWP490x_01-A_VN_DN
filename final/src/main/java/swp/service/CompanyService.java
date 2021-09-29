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
}
