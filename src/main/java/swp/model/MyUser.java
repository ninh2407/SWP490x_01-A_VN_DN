package swp.model;

public class MyUser {
	private String username;
	private String password;
	private String name;
	private String phone;
	private String role;
	private int status;
	
	public MyUser() {
		
	}
	
	public MyUser(String username, String password, String name, String phone, String role, int status) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.role = role;
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
