package swp.model;

public class Account {
	private String userMail;
	private String password;
	private String userName;
	private String userPhone;
	private int isAdmin;
	
	public Account() {
		
	}
	
	public Account(String userMail, String password) {
		super();
		this.userMail = userMail;
		this.password = password;
	}

	public Account(String userMail, String password, String userName, String userPhone, int isAdmin) {
		super();
		this.userMail = userMail;
		this.password = password;
		this.userName = userName;
		this.userPhone = userPhone;
		this.isAdmin = isAdmin;
	}

	public int getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
}
