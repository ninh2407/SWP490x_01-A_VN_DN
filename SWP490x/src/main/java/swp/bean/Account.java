package swp.bean;

public class Account {
	private String userMail;
	private String password;
	private String address;
	private String userName;
	private String userPhone;
	private int role;
	
	public Account() {
		
	}

	public Account(String userMail, String password) {
		super();
		this.userMail = userMail;
		this.password = password;
	}

	public Account(String userMail, String password, String address, String userName, String userPhone, int role) {
		super();
		this.userMail = userMail;
		this.password = password;
		this.address = address;
		this.userName = userName;
		this.userPhone = userPhone;
		this.role = role;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}
	
}
