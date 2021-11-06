package swp.DAO.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import swp.DAO.LotteryTicketDAO;
import swp.mapper.LotteryTicketMapper;
import swp.model.LotteryTicket;

@Repository
public class LotteryTicketDAOIpml implements LotteryTicketDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void addTicket(LotteryTicket ticket) {
		String sql = "INSERT INTO [dbo].[lottery_ticket]\r\n" + "           ([company_id]\r\n"
				+ "           ,[open_date]\r\n" + "           ,[ticket_code]\r\n" + "           ,[user_mail]\r\n"
				+ "           ,[result])\r\n" + "     VALUES\r\n" + "           (?,?,?,?,?)";
		jdbcTemplate.update(sql, ticket.getCompanyId(), ticket.getOpenDate(), ticket.getTicketCode(),
				ticket.getUserMail(), ticket.getResult());
	}

	@Override
	public List<LotteryTicket> getTicketByMailPaging(String userMail, int index) {
		String sql = "select * from lottery_ticket lt join company c on lt.company_id = c.id\r\n"
				+ "where user_mail = ?\r\n" + "order by open_date desc\r\n" + "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { userMail, index }, new LotteryTicketMapper());
	}

	public void deleteTicket(String userMail, String companyId, String openDate, String ticketCode) {
		String sql = "DELETE FROM [dbo].[lottery_ticket]\r\n"
				+ "WHERE user_mail = ? AND company_id = ? AND open_date = ? AND ticket_code= ?";
		jdbcTemplate.update(sql, userMail, companyId, openDate, ticketCode);
	}

	public int countTicketByMail(String userMail) {
		String sql = "SELECT COUNT(*) FROM lottery_ticket\r\n" + "where user_mail = ?";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { userMail }, Integer.class);
	}

	public List<LotteryTicket> searchTicketByDateAndProvincePaging(String userMail, String openDate, String province,
			int index) {
		String sql = "SELECT * FROM [dbo].[lottery_ticket] lt JOIN [dbo].[company] c ON lt.company_id = c.id\r\n"
				+ "WHERE user_mail = ? AND open_date like ? AND province like ?\r\n" + "ORDER BY open_date DESC\r\n"
				+ "OFFSET ? ROW FETCH NEXT 5 ROW ONLY";
		return jdbcTemplate.query(sql, new Object[] { userMail, openDate, province, index }, new LotteryTicketMapper());
	}

	public int countSearchTicketByDateAndProvince(String userMail, String openDate, String province) {
		String sql = "SELECT COUNT(*) FROM [dbo].[lottery_ticket] lt JOIN [dbo].[company] c ON lt.company_id = c.id\r\n"
				+ "WHERE user_mail = ? AND open_date like ? AND province like ?";
		return (Integer) jdbcTemplate.queryForObject(sql, new Object[] { userMail, openDate, province }, Integer.class);
	}

}
