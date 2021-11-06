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

	public List<LotteryResult> findResultByCompanyPaging(String companyId, int index) {
		return lotteryResultDAOImpl.findResultByCompanyPaging(companyId, index);
	}

	public int countResultByCompany(String companyId) {
		return lotteryResultDAOImpl.countResultByCompany(companyId);
	}

	public List<LotteryResult> findResultByRegionPaging(String region, int index) {
		return lotteryResultDAOImpl.findResultByRegionPaging(region, index);
	}

	public int countResultByRegion(String region) {
		return lotteryResultDAOImpl.countResultByRegion(region);
	}

	public LotteryResult findResultByProvince(String province, String openDate) {
		return lotteryResultDAOImpl.findResultByProvince(province, openDate);
	}

	public List<LotteryResult> getAllPaging(int index) {
		return lotteryResultDAOImpl.getAllPaging(index);
	}

	public int countAll() {
		return lotteryResultDAOImpl.countAll();
	}

	public List<LotteryResult> findResultByProvinceAndDatePaging(String province, String openDate, int index) {
		return lotteryResultDAOImpl.findResultByProvinceAndDatePaging(province, openDate, index);
	}

	public int countResultByProvinceAndDate(String province, String openDate) {
		return lotteryResultDAOImpl.countResultByProvinceAndDate(province, openDate);
	}

	public void deleteByProvinceAndDate(String companyID, String openDate) {
		lotteryResultDAOImpl.deleteByProvinceAndDate(companyID, openDate);
	}

	public void updateByProvinceAndDate(String g0, String g1, String g2, String g3, String g4, String g5, String g6,
			String g7, String g8, String companyID, String openDate) {
		lotteryResultDAOImpl.updateByProvinceAndDate(g0, g1, g2, g3, g4, g5, g6, g7, g8, companyID, openDate);
	}

}
