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
		String sql = "INSERT INTO [dbo].[lottery_result]\r\n" + "           ([company_id]\r\n"
				+ "           ,[open_date]\r\n" + "           ,[special_prize]\r\n" + "           ,[first_prize]\r\n"
				+ "           ,[second_prize]\r\n" + "           ,[third_prize]\r\n" + "           ,[fourth_prize]\r\n"
				+ "           ,[fifth_prize]\r\n" + "           ,[sixth_prize]\r\n" + "           ,[seventh_prize]\r\n"
				+ "           ,[eighth_prize])\r\n" + "     VALUES\r\n" + "           (?,?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, result.getCompanyId(), result.getOpenDate(), result.getSpecialPrize(),
				result.getFirstPrize(), result.getSecondPrize(), result.getThirdPrize(), result.getFourthPrize(),
				result.getFifthPrize(), result.getSixthPrize(), result.getSeventhPrize(), result.getEighthPrize());
	}

	@Override
	public LotteryResult findResult(String companyId, Date openDate) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE company_id = ? AND open_date = ? \r\n" + "ORDER BY open_date DESC";
		LotteryResult lt = null;
		try {
			lt = jdbcTemplate.queryForObject(sql, new Object[] { companyId, openDate }, new LotteryResultMapper());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return lt;
	}

	@Override
	public List<LotteryResult> findResultByCompany(String companyId) {
		String sql = "SELECT TOP(10) * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE company_id = ? \r\n" + "ORDER BY open_date DESC";
		return jdbcTemplate.query(sql, new Object[] { companyId }, new LotteryResultMapper());
	}

	public List<LotteryResult> findResultByCompanyPaging(String companyId, int index) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE c.id = ? \r\n" + "ORDER BY open_date DESC\r\n" + "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { companyId, index }, new LotteryResultMapper());
	}

	public int countResultByCompany(String companyId) {
		String sql = "SELECT COUNT(*) FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE c.id = ? ";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { companyId }, Integer.class);
	}

	@Override
	public List<LotteryResult> findResultByRegion(String region) {
		String sql = "SELECT TOP(10) * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE region = ? \r\n" + "ORDER BY open_date DESC";
		return jdbcTemplate.query(sql, new Object[] { region }, new LotteryResultMapper());
	}

	public List<LotteryResult> findResultByRegionPaging(String region, int index) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE region = ? \r\n" + "ORDER BY open_date DESC\r\n" + "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { region, index }, new LotteryResultMapper());
	}

	public int countResultByRegion(String region) {
		String sql = "SELECT COUNT(*) FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE region = ? ";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { region }, Integer.class);
	}

	@Override
	public List<LotteryResult> getTenLatestResult() {
		String sql = "SELECT TOP(10) * FROM lottery_result lr JOIN company c ON lr.company_id = c.id \r\n"
				+ "ORDER BY open_date DESC";
		return jdbcTemplate.query(sql, new LotteryResultMapper());
	}

	public LotteryResult findResultByProvince(String province, String openDate) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "where open_date = ? and province = ?";
		LotteryResult rl = null;
		try {
			rl = jdbcTemplate.queryForObject(sql, new Object[] { openDate, province }, new LotteryResultMapper());
		} catch (Exception e) {
			//
		}
		return rl;
	}

	// get all
	public List<LotteryResult> getAllPaging(int index) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id \r\n"
				+ "ORDER BY open_date DESC \r\n" + "OFFSET ? ROW FETCH NEXT 10 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { index }, new LotteryResultMapper());
	}

	public int countAll() {
		String sql = "SELECT COUNT(*) FROM lottery_result lr JOIN company c ON lr.company_id = c.id";
		return (Integer) jdbcTemplate.queryForObject(sql, Integer.class);
	}

	public List<LotteryResult> findResultByProvinceAndDatePaging(String province, String openDate, int index) {
		String sql = "SELECT * FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE province like ? AND open_date like ? \r\n" + "ORDER BY open_date DESC\r\n"
				+ "OFFSET ? ROW FETCH NEXT 10 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { province, openDate, index }, new LotteryResultMapper());
	}

	public int countResultByProvinceAndDate(String province, String openDate) {
		String sql = "SELECT COUNT(*) FROM lottery_result lr JOIN company c ON lr.company_id = c.id\r\n"
				+ "WHERE province like ? AND open_date like ? ";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { province, openDate, }, Integer.class);
	}

	public void deleteByProvinceAndDate(String companyID, String openDate) {
		String sql = "DELETE FROM lottery_result\r\n" + "WHERE company_id = ? AND open_date = ?";
		jdbcTemplate.update(sql, companyID, openDate);
	}

	public void updateByProvinceAndDate(String g0, String g1, String g2, String g3, String g4, String g5, String g6,
			String g7, String g8, String companyID, String openDate) {
		String sql = "UPDATE [dbo].[lottery_result]\r\n" + "   SET [special_prize] = ?\r\n"
				+ "      ,[first_prize] = ?\r\n" + "      ,[second_prize] = ?\r\n" + "      ,[third_prize] = ?\r\n"
				+ "      ,[fourth_prize] = ?\r\n" + "      ,[fifth_prize] = ?\r\n" + "      ,[sixth_prize] = ?\r\n"
				+ "      ,[seventh_prize] = ?\r\n" + "      ,[eighth_prize] = ?\r\n"
				+ " WHERE company_id = ? and open_date = ?";
		jdbcTemplate.update(sql, g0, g1, g2, g3, g4, g5, g6, g7, g8, companyID, openDate);
	}

}
