package swp.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp.DAO.impl.LotteryResultDAOImpl;
import swp.model.LotteryResult;

@Service
public class LotteryResultService {
	@Autowired
	private LotteryResultDAOImpl lotteryResultDAOImpl;

	public void addResult(LotteryResult result) {
		lotteryResultDAOImpl.addResult(result);
	}

	public LotteryResult findResult(String companyId, Date openDate) {
		return lotteryResultDAOImpl.findResult(companyId, openDate);
	}

	public List<LotteryResult> findResultByCompany(String companyId) {
		return lotteryResultDAOImpl.findResultByCompany(companyId);
	}

	public List<LotteryResult> findResultByRegion(String region) {
		return lotteryResultDAOImpl.findResultByRegion(region);
	}

	public List<LotteryResult> getTenLatestResult() {
		return lotteryResultDAOImpl.getTenLatestResult();
	}

	public Date getLatestOpenDate(String companyId) {
		return lotteryResultDAOImpl.getLatestOpenDate(companyId);
	}

}
