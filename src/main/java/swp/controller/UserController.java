package swp.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Company;
import swp.model.LotteryTicket;
import swp.model.MyUser;
import swp.service.CompanyService;
import swp.service.LotteryTicketService;
import swp.service.MyUserService;

@Controller
public class UserController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private MyUserService myUserService;

	@Autowired
	private LotteryTicketService lotteryTicketService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/user/profile", method = RequestMethod.GET)
	public String userProfile(Model model, HttpServletRequest request, HttpServletResponse response,
			Principal principal) {

		List<Company> listCompany = companyService.getAllCompany();
		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("user", user);
			model.addAttribute("name", user.getName());

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}
		}
		model.addAttribute("listCompany", listCompany);

		return "user-profile";
	}

	@RequestMapping(value = "/user/change-profile", method = RequestMethod.POST)
	public String changeProfile(Model model, HttpServletRequest request, HttpServletResponse response,
			Principal principal) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String username = request.getParameter("email");

		myUserService.editUser(username, name, phone);

		return "redirect:/user/profile?success=true";
	}

	@RequestMapping(value = "/user/change-password", method = RequestMethod.POST)
	public String changePassword(Model model, HttpServletRequest request, HttpServletResponse response,
			Principal principal) {

		String oldPass = request.getParameter("old-pass");
		String pass = request.getParameter("new-pass");
		String username = request.getParameter("email");

		MyUser user = myUserService.findUserByUsername(username);

		// Check old password
		if (passwordEncoder.matches(oldPass, user.getPassword())) {
			String passEncode = passwordEncoder.encode(pass);
			myUserService.resetPasswordUser(username, passEncode);
			
			return "redirect:/user/profile?success=true";
		}
		else
			return "redirect:/user/profile?failed=true";

	}

	@RequestMapping(value = "/user/history", method = RequestMethod.GET)
	public String userHistory(Model model, HttpServletRequest request, HttpServletResponse response,
			Principal principal) {

		List<Company> listCompany = companyService.getAllCompany();
		model.addAttribute("listCompany", listCompany);

		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		int count = 0;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("name", user.getName());

			List<LotteryTicket> listTicket = lotteryTicketService.getTicketByMailPaging(username, (index - 1) * 5);
			model.addAttribute("listTicket", listTicket);
			count = lotteryTicketService.countTicketByMail(username);

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}
		}

		// Count number of page
		int endPage = count / 5;
		if (count % 5 != 0)
			endPage++;
		int pageGroup = 0;
		if (index % 5 == 0)
			pageGroup = index / 5 - 1;
		else
			pageGroup = index / 5;

		model.addAttribute("link", "/history?");
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);

		return "user-history";
	}

	@RequestMapping(value = "/user/search-history", method = RequestMethod.GET)
	public String searchHistory(Model model, HttpServletRequest request, HttpServletResponse response,
			Principal principal) {

		List<Company> listCompany = companyService.getAllCompany();

		model.addAttribute("listCompany", listCompany);

		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		int count = 0;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		String searchDate = request.getParameter("search-date");
		String searchProvince = request.getParameter("search-province");

		model.addAttribute("link",
				"/search-history?search-date=" + searchDate + "&search-province=" + searchProvince + "&");

		if (searchDate.length() == 0)
			searchDate = "%";
		if (searchProvince.length() == 0)
			searchProvince = "%";

		// Check user and take list ticket
		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("name", user.getName());

			List<LotteryTicket> listTicket = lotteryTicketService.searchTicketByDateAndProvincePaging(username,
					searchDate, searchProvince, (index - 1) * 5);
			model.addAttribute("listTicket", listTicket);

			count = lotteryTicketService.countSearchTicketByDateAndProvince(username, searchDate, searchProvince);

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}
		}

		// Count number of page
		int endPage = count / 5;
		if (count % 5 != 0)
			endPage++;
		int pageGroup = 0;
		if (index % 5 == 0)
			pageGroup = index / 5 - 1;
		else
			pageGroup = index / 5;

		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);

		return "user-history";
	}

	@RequestMapping(value = "/user/delete-ticket", method = RequestMethod.POST)
	public String deleteTicket(Model model, HttpServletRequest request, HttpServletResponse response) {

		String dateAndId = request.getParameter("date-and-id");
		String[] dateAndIdArray = dateAndId.split("&");
		String userMail = request.getParameter("username");

		lotteryTicketService.deleteTicket(userMail, dateAndIdArray[0], dateAndIdArray[1], dateAndIdArray[2]);

		return "redirect:/user/history?success=true";
	}

	@RequestMapping(value = "/user/delete-many-ticket", method = RequestMethod.POST)
	public String deleteManyTicket(Model model, HttpServletRequest request, HttpServletResponse response) {

		String userMail = request.getParameter("username");
		String[] dateAndId = request.getParameterValues("list-date-id");

		for (String s : dateAndId) {
			String[] dateAndIdArray = s.split("&");
			lotteryTicketService.deleteTicket(userMail, dateAndIdArray[0], dateAndIdArray[1], dateAndIdArray[2]);
		}

		return "redirect:/user/history?success=true";
	}

}