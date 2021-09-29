package swp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Account;
import swp.model.Company;
import swp.model.LotteryResult;
import swp.scheduler.AutoUpdate;
import swp.service.AccountService;
import swp.service.CompanyService;
import swp.service.LotteryResultService;

@Controller
public class HomeController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private AutoUpdate autoUpdate;

	@Autowired
	private LotteryResultService lotteryResultService;

	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {
		Account acc = accountService.findAccount("ninh2407@gmail.com", "aabb9087");
		model.addAttribute("name", acc.getUserName());
		autoUpdate.autoUpdateResult();
		return "login";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		List<LotteryResult> listResult = lotteryResultService.getTenLatestResult();
		List<Company> listCompany = companyService.getAllCompany();
		model.addAttribute("listResult", listResult);
		model.addAttribute("listCompany", listCompany);
		return "home";
	}

}