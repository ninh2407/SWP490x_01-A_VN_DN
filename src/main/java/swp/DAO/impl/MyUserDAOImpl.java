package swp.DAO.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import swp.DAO.MyUserDAO;
import swp.mapper.MyUserMapper;
import swp.model.MyUser;

@Repository
public class MyUserDAOImpl implements MyUserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addUser(MyUser user) {
		String sql = "INSERT INTO [dbo].[users]\r\n"
				+ "           ([username]\r\n"
				+ "           ,[password]\r\n"
				+ "           ,[name]\r\n"
				+ "           ,[phone]\r\n"
				+ "           ,[role]\r\n"
				+ "           ,[enabled])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?,?)";

		jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getName(), user.getPhone(), "ROLE_USER",
				1);
	}

	@Override
	public MyUser findUser(String username, String password) {
		MyUser user = null;
		String sql = "select * from users where username = ? and password = ?";
		try {
			user = jdbcTemplate.queryForObject(sql, new Object[] { username, password }, new MyUserMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	@Override
	public MyUser findUserByUsername(String username) {
		MyUser user = null;
		String sql = "select * from users where username = ?";
		try {
			user = jdbcTemplate.queryForObject(sql, new Object[] { username }, new MyUserMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}

	@Override
	public List<MyUser> getAll() {
		String sql = "select * from users";
		return jdbcTemplate.query(sql, new MyUserMapper());
	}
	
	public List<MyUser> getListPaging(int index) {
		String sql = "SELECT * FROM users \n"
				+ "ORDER BY username \r\n"
				+ "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { index }, new MyUserMapper());
	}
	
	public int countUser() {
		String sql = "SELECT COUNT(*) FROM users";
		return (Integer) jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	public void editUser(String username, String name, String phone) {
		String sql = "UPDATE users\r\n"
				+ "SET name = ? ,phone = ?\r\n"
				+ "WHERE username = ?";
		jdbcTemplate.update(sql, name, phone, username);
	}
	
	public void changeUserStatus(int status, String username) {
		String sql = "UPDATE users\r\n"
				+ "SET enabled = ?\r\n"
				+ "WHERE username = ?";
		jdbcTemplate.update(sql, status, username);
	}
	
	public void resetPasswordUser(String username, String password) {
		String sql = "UPDATE users\r\n"
				+ "SET password = ?\r\n"
				+ "WHERE username = ?";
		jdbcTemplate.update(sql, password, username);
	}
	
	public List<MyUser> searchUser(String username, String name, String phone, int index) {
		String sql = "select * from users\r\n"
				+ "where username like ? and name like ? and phone like ?\r\n"
				+ "ORDER BY username\r\n"
				+ "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { username, name, phone, index }, new MyUserMapper());
	}
	
	public int countSearchUser(String username, String name, String phone) {
		String sql = "select count(*) from users\r\n"
				+ "where username like ? and name like ? and phone like ?";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { username, name, phone }, Integer.class);
	}

}
