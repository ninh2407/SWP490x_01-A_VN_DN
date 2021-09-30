package swp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import swp.model.Account;

public class AccountMapper implements RowMapper<Account> {
   public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
      Account acc = new Account();      
      acc.setUserMail(rs.getString("user_mail"));
      acc.setPassword(rs.getString("password"));
      acc.setUserName(rs.getString("user_name"));
      acc.setUserPhone(rs.getString("user_phone"));
      acc.setIsAdmin(rs.getInt("is_admin"));
      return acc;
   }
}