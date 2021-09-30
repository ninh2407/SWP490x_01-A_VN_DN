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
		String sql = "INSERT INTO [dbo].[account]\r\n"
				+ "           ([user_mail]\r\n"
				+ "           ,[password]\r\n"
				+ "           ,[user_name]\r\n"
				+ "           ,[user_phone]\r\n"
				+ "           ,[is_admin])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?)";
		jdbcTemplate.update(sql,acc.getUserMail(), acc.getPassword(), acc.getUserName(), acc.getUserPhone(), 0);
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

	@Override
	public Account findAccountByEmail(String userMail) {
		Account acc = null;
		String sql = "select * from account where user_mail = ?";
		try {
			acc = jdbcTemplate.queryForObject(sql, new Object[] {userMail}, new AccountMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return acc;
	}

}
