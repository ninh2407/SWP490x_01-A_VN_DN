package swp.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import swp.model.LotteryTicket;

public class LotteryTicketMapper implements RowMapper<LotteryTicket> {
	public LotteryTicket mapRow(ResultSet rs, int rowNum) throws SQLException {
		LotteryTicket ticket = new LotteryTicket();
		ticket.setCompanyId(rs.getString("company_id"));
		ticket.setOpenDate(rs.getDate("open_date"));
		ticket.setTicketCode(rs.getString("ticket_code"));
		ticket.setUserMail(rs.getString("user_mail"));
		return ticket;
	}
}
