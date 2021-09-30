package swp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import swp.model.Company;
import swp.model.LotteryResult;
import swp.service.CompanyService;
import swp.service.LotteryResultService;

@Controller
public class HomeController {

	@Autowired
	private LotteryResultService lotteryResultService;

	@Autowired
	private CompanyService companyService;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		List<LotteryResult> listResult = lotteryResultService.getTenLatestResult();
		List<Company> listCompany = companyService.getAllCompany();
		model.addAttribute("listResult", listResult);
		model.addAttribute("listCompany", listCompany);
		return "home";
	}

}