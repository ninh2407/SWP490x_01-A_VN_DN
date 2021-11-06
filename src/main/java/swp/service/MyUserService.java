package swp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp.DAO.impl.MyUserDAOImpl;
import swp.model.MyUser;

@Service
public class MyUserService {

	@Autowired
	private MyUserDAOImpl myUserDAOImpl;

	public boolean addUser(MyUser user) {
		if (myUserDAOImpl.findUserByUsername(user.getUsername()) == null) {
			myUserDAOImpl.addUser(user);
			return true;
		}
		return false;

	}

	public MyUser findUser(String username, String password) {
		return myUserDAOImpl.findUser(username, password);
	}
	
	public MyUser findUserByUsername(String username) {
		return myUserDAOImpl.findUserByUsername(username);
	}

	public List<MyUser> getAll() {
		return myUserDAOImpl.getAll();
	}

	public List<MyUser> getListPaging(int index) {
		return myUserDAOImpl.getListPaging(index);
	}

	public int countUser() {
		return myUserDAOImpl.countUser();
	}

	public void editUser(String username, String name, String phone) {
		myUserDAOImpl.editUser(username, name, phone);
	}
	
	public void changeUserStatus(int status, String username) {
		myUserDAOImpl.changeUserStatus(status, username);
	}
	
	public boolean isAdmin(String username) {
		MyUser user = myUserDAOImpl.findUserByUsername(username);
		if (user.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
			return true;
		}
		return false;	
	}
	
	public List<MyUser> searchUser(String username, String name, String phone, int index) {
		return myUserDAOImpl.searchUser(username, name, phone, index);
	}
	
	public int countSearchUser(String username, String name, String phone) {
		return myUserDAOImpl.countSearchUser(username, name, phone);
	}
	
	public void resetPasswordUser(String username, String password) {
		myUserDAOImpl.resetPasswordUser(username, password);
	}

}
