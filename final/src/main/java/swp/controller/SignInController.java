package swp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Account;
import swp.service.AccountService;

@Controller
public class SignInController {

	@Autowired
	private AccountService accountService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "login";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.POST)
	public String doLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		String userMail = request.getParameter("usermail");
		String password = request.getParameter("password");
		Account acc = accountService.findAccount(userMail, password);
		if (request.getParameterValues("remember") != null) {
			Cookie cookie1 = new Cookie("userMail", userMail);
			Cookie cookie2 = new Cookie("userPass", password);
			response.addCookie(cookie2);
			response.addCookie(cookie1);
		}
		if (acc != null) {
			HttpSession session = request.getSession();
			session.setAttribute("account", acc);
			return "redirect:/home";
		} else {
			model.addAttribute("mess", "Wrong username or password");
			return "login";
		}

	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model, HttpServletRequest request, HttpServletResponse response) {

		return "register";
	}

	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public String doRegister(Model model, HttpServletRequest request, HttpServletResponse response) {
		String password = request.getParameter("password");
		String userMail = request.getParameter("usermail");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		Account acc = new Account(userMail, password, name, phone, 0);
		if (accountService.addAccount(acc) == true) {
			model.addAttribute("mess", "Register success!");
			return "register";
		} else {
			model.addAttribute("mess", "Email already exists");
			return "register";
		}
	}

}