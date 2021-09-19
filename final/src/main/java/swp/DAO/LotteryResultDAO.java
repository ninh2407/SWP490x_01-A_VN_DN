package swp.DAO;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import swp.model.LotteryResult;

@Repository
public interface LotteryResultDAO {
	public void addResult(LotteryResult result);
	public LotteryResult findResult(String companyId, Date openDate);
	public List<LotteryResult> findResultByCompany(String companyId);
	public List<LotteryResult> findResultByRegion(String region);
	public List<LotteryResult> getLatestResult();
	public Date getLatestOpenDate(String companyId);
}
