package swp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp.DAO.impl.AccountDAOImpl;
import swp.model.Account;

@Service
public class AccountService {

	@Autowired
	private AccountDAOImpl accountDAOImpl;

	public Account findAccount(String userMail, String password) {
		Account acc = accountDAOImpl.findAccount(userMail, password);
		return acc;
	}
}
