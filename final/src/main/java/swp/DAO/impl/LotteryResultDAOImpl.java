package swp.DAO.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import swp.DAO.LotteryResultDAO;
import swp.mapper.LotteryResultMapper;
import swp.model.LotteryResult;

@Repository
public class LotteryResultDAOImpl implements LotteryResultDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addResult(LotteryResult result) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO [dbo].[lottery_result]\r\n"
				+ "           ([company_id]\r\n"
				+ "           ,[open_date]\r\n"
				+ "           ,[special_prize]\r\n"
				+ "           ,[first_prize]\r\n"
				+ "           ,[second_prize]\r\n"
				+ "           ,[third_prize]\r\n"
				+ "           ,[fourth_prize]\r\n"
				+ "           ,[fifth_prize]\r\n"
				+ "           ,[sixth_prize]\r\n"
				+ "           ,[seventh_prize]\r\n"
				+ "           ,[eighth_prize])\r\n"
				+ "     VALUES\r\n"
				+ "           (?,?,?,?,?,?,?,?,?,?,?)";		
		jdbcTemplate.update(sql, result.getCompanyId(), result.getOpenDate(), result.getSpecialPrize(),
				result.getFirstPrize(), result.getSecondPrize(), result.getThirdPrize(), result.getFourthPrize(),
				result.getFifthPrize(), result.getSixthPrize(), result.getSeventhPrize(), result.getEighthPrize());
	}

	@Override
	public LotteryResult findResult(String companyId, Date openDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LotteryResult> findResultByCompany(String companyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LotteryResult> findResultByRegion(String region) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LotteryResult> getLatestResult() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Date getLatestOpenDate(String companyId) {
		LotteryResult lr = null;
		String sql = "SELECT TOP(1) * FROM lottery_result WHERE company_id = ? ORDER BY open_date DESC";
		try {
			lr = jdbcTemplate.queryForObject(sql, new Object[] {companyId}, new LotteryResultMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (lr != null) return lr.getOpenDate();
		return null;
	}
	
}
