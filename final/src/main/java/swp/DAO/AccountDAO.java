package swp.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import swp.model.Account;

@Repository
public interface AccountDAO {
	public void addAccount(Account acc);
	public Account findAccount(String userMail, String password);
	public Account findAccountByEmail(String userMail);
	public List<Account> getAll();
}
