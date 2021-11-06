package swp.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Company;
import swp.model.LotteryResult;
import swp.model.MyUser;
import swp.scheduler.AutoUpdate;
import swp.service.CompanyService;
import swp.service.LotteryResultService;
import swp.service.MailService;
import swp.service.MyUserService;

@Controller
public class AdminController {

	@Autowired
	private AutoUpdate autoUpdate;

	@Autowired
	private MyUserService myUserService;

	@Autowired
	private MailService mailService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private LotteryResultService lotteryResultService;

	@RequestMapping(value = "/admin/autoUpdate", method = RequestMethod.GET)
	public String AutoUpdate(Model model, HttpServletRequest request, HttpServletResponse response) {
		autoUpdate.autoUpdateResult();
		return "redirect:/admin/manager-lottery?success=true";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "admin-dashboard";
	}

	@RequestMapping(value = "/admin/manager-user", method = RequestMethod.GET)
	public String managerUser(Model model, HttpServletRequest request, HttpServletResponse response) {

		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		List<MyUser> userList = myUserService.getListPaging((index - 1) * 5);
		int count = myUserService.countUser();
		// Count number of page
		int endPage = count / 5;
		if (count % 5 != 0)
			endPage++;
		int pageGroup = 0;
		if (index % 5 == 0)
			pageGroup = index / 5 - 1;
		else
			pageGroup = index / 5;

		model.addAttribute("link", "/manager-user?");
		model.addAttribute("userList", userList);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);
		return "admin-user";
	}

	@RequestMapping(value = "/admin/edit-user", method = RequestMethod.POST)
	public String editUser(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String link = request.getParameter("link");

		myUserService.editUser(username, name, phone);

		String index = request.getParameter("index");
		String url = "redirect:/admin" + link + "index=" + index + "&success=true";
		return url;
	}

	@RequestMapping(value = "/admin/add-user", method = RequestMethod.POST)
	public String addUser(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String password = request.getParameter("password");
		String hashPassword = passwordEncoder.encode(password);
		String userMail = request.getParameter("usermail");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String role = request.getParameter("role");

		MyUser user = new MyUser(userMail, hashPassword, name, phone, role, 1);
		if (myUserService.addUser(user) == true) {
			return "redirect:/admin/manager-user?success=true";
		} else {
			return "redirect:/admin/manager-user?failed=add";
		}
	}

	@RequestMapping(value = "/admin/change-status", method = RequestMethod.POST)
	public String changeStatusUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		String enabled = request.getParameter("enabled");
		String username = request.getParameter("username");
		String index = request.getParameter("index");
		String link = request.getParameter("link");
		String url = "";
		if (myUserService.isAdmin(username) == false) {
			int status = 0;
			if (enabled.equals("1"))
				status = 0;
			if (enabled.equals("0"))
				status = 1;
			myUserService.changeUserStatus(status, username);
			url = "redirect:/admin" + link + "index=" + index + "&success=true";
		} else {
			url = "redirect:/admin" + link + "index=" + index + "&failed=reset";
		}
		return url;
	}

	@RequestMapping(value = "/admin/reset-password", method = RequestMethod.POST)
	public String resetPassword(Model model, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String index = request.getParameter("index");
		String link = request.getParameter("link");
		String url = "redirect:/admin" + link + "index=" + index + "&success=true";

		try {
			mailService.sendText(username);
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return url;
	}

	@RequestMapping(value = "/admin/search-user", method = RequestMethod.GET)
	public String searchUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		String username1 = request.getParameter("username");
		String name1 = request.getParameter("name");
		String phone1 = request.getParameter("phone");

		// Edit data to search
		String name = "%" + name1.trim().replace("%", " ") + "%";
		String username = "%" + username1.trim().replace("%", " ") + "%";
		String phone = "%" + phone1 + "%";

		List<MyUser> userList = myUserService.searchUser(username, name, phone, (index - 1) * 5);
		int count = myUserService.countSearchUser(username, name, phone);
		// Count number of page
		int endPage = count / 5;
		if (count % 5 != 0)
			endPage++;
		int pageGroup = 0;
		if (index % 5 == 0)
			pageGroup = index / 5 - 1;
		else
			pageGroup = index / 5;

		model.addAttribute("link", "/search-user?username=" + username1 + "&name=" + name1 + "&phone=" + phone1 + "&");
		model.addAttribute("userList", userList);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);
		return "admin-user";
	}

	@RequestMapping(value = "/admin/manager-lottery", method = RequestMethod.GET)
	public String managerLottery(Model model, HttpServletRequest request, HttpServletResponse response) {

		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		String province1 = request.getParameter("search-province");
		String openDate1 = request.getParameter("search-date");

		String province = province1;
		String openDate = openDate1;

		if (province1 == null || province1.length() == 0)
			province = "%";
		if (openDate1 == null || openDate1.length() == 0)
			openDate = "%";

		List<LotteryResult> listLottery = lotteryResultService.findResultByProvinceAndDatePaging(province, openDate,
				(index - 1) * 10);

		int count = lotteryResultService.countResultByProvinceAndDate(province, openDate);

		// Count number of page
		int endPage = count / 10;
		if (count % 10 != 0)
			endPage++;
		int pageGroup = 0;
		if (index % 10 == 0)
			pageGroup = index / 10 - 1;
		else
			pageGroup = index / 10;

		List<Company> listCompany = companyService.getAllCompany();

		model.addAttribute("listCompany", listCompany);
		model.addAttribute("listLottery", listLottery);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);

		String link = "/manager-lottery?";

		if (province1 != null || openDate1 != null)
			link = "/manager-lottery?search-province=" + province + "&search-date" + openDate + "&";

		model.addAttribute("link", link);

		long millis = System.currentTimeMillis();
		java.sql.Date currentDate = new java.sql.Date(millis);
		model.addAttribute("currentDate", currentDate);

		return "admin-lottery";
	}

	@RequestMapping(value = "/admin/delete-lottery", method = RequestMethod.POST)
	public String deleteLotteryResult(Model model, HttpServletRequest request, HttpServletResponse response) {
		String dateAndId = request.getParameter("date-and-id");
		String date = dateAndId.substring(0, dateAndId.indexOf("&"));
		String companyId = dateAndId.substring(dateAndId.indexOf("&") + 1);

		lotteryResultService.deleteByProvinceAndDate(companyId, date);

		String url = request.getParameter("url");

		if (url.indexOf("index") > 0) {
			url = url.substring(0, url.indexOf("index"));
		}
		if (url.indexOf("success") > 0) {
			url = url.substring(0, url.indexOf("success"));
		}
		if (url.indexOf("failed") > 0) {
			url = url.substring(0, url.indexOf("failed"));
		}
		return "redirect:manager-lottery?" + url + "&success=true";
	}

	@RequestMapping(value = "/admin/delete-many-lottery", method = RequestMethod.POST)
	public String deleteManyLotteryResult(Model model, HttpServletRequest request, HttpServletResponse response) {
		String[] dateAndId = request.getParameterValues("list-date-id");

		String date = "";
		String companyId = "";
		if (dateAndId != null) {
			for (String s : dateAndId) {
				date = s.substring(0, s.indexOf("&"));
				companyId = s.substring(s.indexOf("&") + 1);
				lotteryResultService.deleteByProvinceAndDate(companyId, date);
			}
		}

		String url = request.getParameter("url");

		if (url.indexOf("index") > 0) {
			url = url.substring(0, url.indexOf("index"));
		}
		if (url.indexOf("success") > 0) {
			url = url.substring(0, url.indexOf("success"));
		}
		if (url.indexOf("failed") > 0) {
			url = url.substring(0, url.indexOf("failed"));
		}
		return "redirect:manager-lottery?" + url + "&success=true";
	}

	@RequestMapping(value = "/admin/edit-lottery", method = RequestMethod.POST)
	public String editLotteryResult(Model model, HttpServletRequest request, HttpServletResponse response) {
		String date = request.getParameter("date");
		String companyId = request.getParameter("companyId");
		String g0 = request.getParameter("g0");
		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		String g3 = request.getParameter("g3");
		String g4 = request.getParameter("g4");
		String g5 = request.getParameter("g5");
		String g6 = request.getParameter("g6");
		String g7 = request.getParameter("g7");
		String g8 = request.getParameter("g8");

		String url = request.getParameter("url");

		if (url.indexOf("success") > 0) {
			url = url.substring(0, url.indexOf("success"));
		}
		if (url.indexOf("failed") > 0) {
			url = url.substring(0, url.indexOf("failed"));
		}

		lotteryResultService.updateByProvinceAndDate(g0, g1, g2, g3, g4, g5, g6, g7, g8, companyId, date);

		return "redirect:manager-lottery?" + url + "&success=true";
	}

	@RequestMapping(value = "/admin/add-lottery", method = RequestMethod.GET)
	public String addLotteryResult(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		String date = request.getParameter("date-lottery");
		String province = request.getParameter("province-lottery");

		String g0 = request.getParameter("g0");
		String g1 = request.getParameter("g1");
		String g2 = request.getParameter("g2");
		String g3 = request.getParameter("g3");
		String g4 = request.getParameter("g4");
		String g5 = request.getParameter("g5");
		String g6 = request.getParameter("g6");
		String g7 = request.getParameter("g7");
		String g8 = request.getParameter("g8");

		String url = request.getParameter("url");

		if (url.indexOf("success") > 0) {
			url = url.substring(0, url.indexOf("success"));
		}
		if (url.indexOf("failed") > 0) {
			url = url.substring(0, url.indexOf("failed"));
		}

		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date openDate = sdf1.parse(date);
		java.sql.Date sqlOpenDate = new java.sql.Date(openDate.getTime());

		Company c = companyService.findCompanyByProvince(province);

		String result = "";

		if (c != null) {
			LotteryResult lr = lotteryResultService.findResult(c.getId(), sqlOpenDate);
			LotteryResult rs = new LotteryResult(c.getId(), sqlOpenDate, g0, g1, g2, g3, g4, g5, g6, g7, g8);

			if (lr == null) {
				lotteryResultService.addResult(rs);
				result = "&success=true";
			} else {
				result = "&failed=exist";
			}
		} else
			result = "&failed=province";

		return "redirect:manager-lottery?" + url + result;
	}

}