package swp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Account;
import swp.service.AccountService;



@Controller
public class Test {
	
	@Autowired
	private AccountService accountService;
	

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		Account acc = accountService.findAccount("ninh2407@gmail.com", "aabb9087");
		model.addAttribute("name", acc.getUserName());

		return "login";
	}
	
}
