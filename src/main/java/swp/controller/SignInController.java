package swp.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.component.GoogleUtils;
import swp.model.GooglePojo;
import swp.model.MyUser;
import swp.service.MailService;
import swp.service.MyUserService;

@Controller
public class SignInController {

	@Autowired
	private MyUserService myUserService;

	@Autowired
	private MailService mailService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private GoogleUtils googleUtils;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "login";
	}

	@RequestMapping(value = "/doLogin", method = RequestMethod.GET)
	public String doLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
		Set<String> roles = AuthorityUtils
				.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		if (roles.contains("ROLE_ADMIN")) {
			return "redirect:/admin";
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(Model model, HttpServletRequest request, HttpServletResponse response) {

		return "register";
	}

	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public String doRegister(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String password = request.getParameter("password");
		String hashPassword = passwordEncoder.encode(password);
		String userMail = request.getParameter("usermail");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

		MyUser user = new MyUser(userMail, hashPassword, name, phone, "ROLE_USER", 1);
		if (myUserService.addUser(user) == true) {
			return "redirect:/register?success=true";
		} else {
			model.addAttribute("mess", "Email already exists");
			return "register";
		}
	}

	@RequestMapping(value = "/user-reset-password", method = RequestMethod.POST)
	public String resetPassword(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		String userMail = request.getParameter("usermail");

		MyUser user = myUserService.findUserByUsername(userMail);

		if (user != null) {
			try {
				mailService.sendText(userMail);
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "redirect:/login?success=true";
		} else {
			return "redirect:/login?failed=true";
		}
	}

	@RequestMapping("/login-google")
	public String loginGoogle(HttpServletRequest request) throws ClientProtocolException, IOException {
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			return "redirect:/login?message=google_error";
		}
		String accessToken = googleUtils.getToken(code);

		GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
		UserDetails userDetail = googleUtils.buildUser(googlePojo);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/home";
	}

}