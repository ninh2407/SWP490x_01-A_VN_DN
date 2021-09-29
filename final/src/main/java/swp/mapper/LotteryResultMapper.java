package swp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import swp.model.LotteryResult;

public class LotteryResultMapper implements RowMapper<LotteryResult> {
	public LotteryResult mapRow(ResultSet rs, int rowNum) throws SQLException {
		LotteryResult lotteryResult = new LotteryResult();
		lotteryResult.setCompanyId(rs.getString("company_id"));
		lotteryResult.setOpenDate(rs.getDate("open_date"));
		lotteryResult.setSpecialPrize(rs.getString("special_prize"));
		lotteryResult.setFirstPrize(rs.getString("first_prize"));
		lotteryResult.setSecondPrize(rs.getString("second_prize"));
		lotteryResult.setThirdPrize(rs.getString("third_prize"));
		lotteryResult.setFourthPrize(rs.getString("fourth_prize"));
		lotteryResult.setFifthPrize(rs.getString("fifth_prize"));
		lotteryResult.setSixthPrize(rs.getString("sixth_prize"));
		lotteryResult.setSeventhPrize(rs.getString("seventh_prize"));
		lotteryResult.setEighthPrize(rs.getString("eighth_prize"));
		lotteryResult.setProvince(rs.getString("province"));
		return lotteryResult;
	}
}
