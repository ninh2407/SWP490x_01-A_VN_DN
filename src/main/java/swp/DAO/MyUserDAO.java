package swp.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import swp.model.MyUser;
@Repository
public interface MyUserDAO {
	public void addUser(MyUser user);
	public MyUser findUser(String username, String password);
	public MyUser findUserByUsername(String username);
	public List<MyUser> getAll();
}
