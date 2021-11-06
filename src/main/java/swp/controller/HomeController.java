package swp.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Company;
import swp.model.LotteryResult;
import swp.model.LotteryTicket;
import swp.model.MyUser;
import swp.service.CompanyService;
import swp.service.LotteryResultService;
import swp.service.LotteryTicketService;
import swp.service.MyUserService;

@Controller
public class HomeController {

	@Autowired
	private LotteryResultService lotteryResultService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private MyUserService myUserService;

	@Autowired
	private LotteryTicketService lotteryTicketService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model, Principal principal) {
		List<LotteryResult> listResult = lotteryResultService.getTenLatestResult();
		List<Company> listCompany = companyService.getAllCompany();
		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("name", user.getName());

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}
		}
		model.addAttribute("listResult", listResult);
		model.addAttribute("listCompany", listCompany);
		return "home";
	}

	@RequestMapping(value = "/home/{id}", method = RequestMethod.GET)
	public String province(Model model, @PathVariable String id, HttpServletRequest request,
			HttpServletResponse response, Principal principal) {
		List<LotteryResult> listResult = null;
		// Check index of paging
		String indexPage = request.getParameter("index");
		int index = 1;
		int count = 0;
		if (indexPage != null)
			index = Integer.parseInt(indexPage);

		// Find result by region
		if (id.equalsIgnoreCase("MB") || id.equalsIgnoreCase("MT") || id.equalsIgnoreCase("MN")) {
			String regionName = "";
			if (id.equalsIgnoreCase("MB"))
				regionName = "Miền Bắc";
			if (id.equalsIgnoreCase("MT"))
				regionName = "Miền Trung";
			if (id.equalsIgnoreCase("MN"))
				regionName = "Miền Nam";
			model.addAttribute("province", regionName);

			listResult = lotteryResultService.findResultByRegionPaging(id, (index - 1) * 5);
			count = lotteryResultService.countResultByRegion(id);

		} else {
			// Find result by company/province
			listResult = lotteryResultService.findResultByCompanyPaging(id, (index - 1) * 5);
			Company c = companyService.findCompany(id);
			model.addAttribute("province", c.getProvince());
			count = lotteryResultService.countResultByCompany(id);
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

		List<Company> listCompany = companyService.getAllCompany();
		model.addAttribute("listResult", listResult);
		model.addAttribute("listCompany", listCompany);
		model.addAttribute("pageId", id);
		model.addAttribute("pageGroup", pageGroup);
		model.addAttribute("endP", endPage);
		model.addAttribute("tag", index);

		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("name", user.getName());

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}
		}

		return "result-province";
	}

	@RequestMapping(value = "/search-lottery", method = RequestMethod.GET)
	public String searchLottery(Model model, Principal principal, HttpServletRequest request,
			HttpServletResponse response) throws ParseException, UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String province = request.getParameter("province");
		String code = request.getParameter("code");
		String dateSearch = request.getParameter("date");

		LotteryResult rl = lotteryResultService.findResultByProvince(province, dateSearch);

		if (rl == null) {
			model.addAttribute("province", province);
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date = sdf1.parse(dateSearch);
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy");
			String dateFormat = sdf2.format(date);
			model.addAttribute("date", dateFormat);
		}

		// check code
		String listPrize = "";
		String codePrize = "";
		if (rl != null) {
			if (code.equals(rl.getSpecialPrize())) {
				listPrize += "giải Đặc biệt, ";
				codePrize += rl.getSpecialPrize() + ", ";
			}

			if (code.substring(code.length() - rl.getFirstPrize().length()).equals(rl.getFirstPrize())) {
				listPrize += "giải Nhất, ";
				codePrize += rl.getSpecialPrize() + ", ";
			}

			if (code.substring(code.length() - rl.getEighthPrize().length()).equals(rl.getEighthPrize())
					&& rl.getEighthPrize().length() > 0) {
				listPrize += "giải Tám, ";
				codePrize += rl.getEighthPrize() + ", ";
			}

			String[] secondPrize = rl.getListPrize(rl.getSecondPrize());
			String[] thirdPrize = rl.getListPrize(rl.getThirdPrize());
			String[] fourthPrize = rl.getListPrize(rl.getFourthPrize());
			String[] fifthPrize = rl.getListPrize(rl.getFifthPrize());
			String[] sixthPrize = rl.getListPrize(rl.getSixthPrize());
			String[] seventhPrize = rl.getListPrize(rl.getSeventhPrize());

			for (String s : secondPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Nhì, ";
					codePrize += s + ", ";
				}
			}

			for (String s : thirdPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Ba, ";
					codePrize += s + ", ";
				}
			}

			for (String s : fourthPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Tư, ";
					codePrize += s + ", ";
				}
			}

			for (String s : fifthPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Năm, ";
					codePrize += s + ", ";
				}
			}

			for (String s : sixthPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Sáu, ";
					codePrize += s + ", ";
				}
			}

			for (String s : seventhPrize) {
				if (code.substring(code.length() - s.length()).equals(s)) {
					listPrize += "giải Bảy, ";
					codePrize += s + ", ";
				}
			}

			if (listPrize != "") {
				listPrize = listPrize.substring(0, listPrize.lastIndexOf(","));
				codePrize = codePrize.substring(0, codePrize.lastIndexOf(","));
				model.addAttribute("listPrize", listPrize);
				model.addAttribute("codePrize", codePrize);
			}
		}

		List<Company> listCompany = companyService.getAllCompany();
		model.addAttribute("rl", rl);
		model.addAttribute("listCompany", listCompany);

		// if user login
		if (principal != null) {
			String username = principal.getName();
			MyUser user = myUserService.findUserByUsername(username);
			model.addAttribute("name", user.getName());

			Set<String> roles = AuthorityUtils
					.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
			if (roles.contains("ROLE_ADMIN")) {
				model.addAttribute("isAdmin", "true");
			}

			if (listPrize.length() == 0) {
				listPrize = "không trúng";
			}

			if (rl != null) {

				List<LotteryTicket> listTicket = lotteryTicketService.searchTicketByDateAndProvincePaging(username,
						dateSearch, province, 0);

				if (listTicket.size() == 0) {
					LotteryTicket ticket = new LotteryTicket(rl.getCompanyId(), rl.getOpenDate(), code, username,
							listPrize, province);
					lotteryTicketService.addTicket(ticket);
				}
			}
		}

		return "search-lottery";
	}

}