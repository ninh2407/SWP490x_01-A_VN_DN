package swp.DAO.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import swp.DAO.AccountDAO;
import swp.mapper.AccountMapper;
import swp.model.Account;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addAccount(Account acc) {
		// TODO Auto-generated method stub

	}

	@Override
	public Account findAccount(String userMail, String password) {
		Account acc = null;
		String sql = "select * from account where user_mail = ? and password = ?";
		try {
			acc = jdbcTemplate.queryForObject(sql, new Object[] { userMail, password }, new AccountMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return acc;
	}

	@Override
	public List<Account> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
