package swp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import swp.model.MyUser;

public class MyUserMapper implements RowMapper<MyUser> {

	@Override
	public MyUser mapRow(ResultSet rs, int rowNum) throws SQLException {
		MyUser user = new MyUser();
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setPhone(rs.getString("phone"));
		user.setRole(rs.getString("role"));
		user.setStatus(rs.getInt("enabled"));
		return user;
	}

}
