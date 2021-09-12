package swp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import swp.bean.Account;
import swp.context.DBContext;

public class AccountDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Account getAccount(String userMail, String password) {
		String query = "select * from Account where user_mail = ? and password = ?";
		Account acc = null;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, userMail);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while(rs.next()) {
				acc = new Account(
						rs.getString(1),
						rs.getString(2),
						rs.getString(5),
						rs.getString(4),
						rs.getString(6),
						rs.getInt(3)
						);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return acc;
	}
	
	public void addAccount(Account acc) {
		String query = "INSERT INTO [dbo].[Account]\r\n"
				+ "           ([user_mail]\r\n"
				+ "           ,[password]\r\n"
				+ "           ,[account_role]\r\n"
				+ "           ,[user_name]\r\n"
				+ "           ,[user_address]\r\n"
				+ "           ,[user_phone])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?,?)";
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, acc.getUserMail());
			ps.setString(2, acc.getPassword());
			ps.setInt(3, acc.getRole());
			ps.setString(4, acc.getUserName());
			ps.setString(5, acc.getAddress());
			ps.setString(6, acc.getUserPhone());
			ps.execute();

		} catch (Exception e) {
			// TODO: handle exception
		}	
	}
	
	public Account getAccountByEmail(String userMail) {
		String query = "select * from Account where user_mail = ?";
		Account acc = null;
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, userMail);
			rs = ps.executeQuery();
			while(rs.next()) {
				acc = new Account(
						rs.getString(1),
						rs.getString(2),
						rs.getString(5),
						rs.getString(4),
						rs.getString(6),
						rs.getInt(3)
						);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}		
		return acc;
	}	
	
}

