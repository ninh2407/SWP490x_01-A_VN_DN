package swp.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import swp.model.Company;

@Repository
public interface CompanyDAO {
	public void addCompany(Company company);
	public Company findCompany(String id);
	public List<Company> findByRegion(String region);
	public List<Company> getAll();
	public List<String> getAllLink();
}
