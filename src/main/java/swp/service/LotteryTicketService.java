package swp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import swp.DAO.impl.LotteryTicketDAOIpml;
import swp.model.LotteryTicket;

@Service
public class LotteryTicketService {
	
	@Autowired
	private LotteryTicketDAOIpml lotteryTicketDAOImpl;

	public void addTicket(LotteryTicket ticket) {
		lotteryTicketDAOImpl.addTicket(ticket);
	}
	
	public List<LotteryTicket> getTicketByMailPaging(String userMail, int index) {
		return lotteryTicketDAOImpl.getTicketByMailPaging(userMail, index);
	}
	
	public int countTicketByMail(String userMail) {
		return lotteryTicketDAOImpl.countTicketByMail(userMail);
	}
	
	public void deleteTicket(String userMail, String companyId, String openDate, String ticketCode) {
		lotteryTicketDAOImpl.deleteTicket(userMail, companyId, openDate, ticketCode);
	}
	
	public List<LotteryTicket> searchTicketByDateAndProvincePaging(String userMail, String openDate, String province,
			int index) {
		return lotteryTicketDAOImpl.searchTicketByDateAndProvincePaging(userMail, openDate, province, index);
	}
	
	public int countSearchTicketByDateAndProvince(String userMail, String openDate, String province) {
		return lotteryTicketDAOImpl.countSearchTicketByDateAndProvince(userMail, openDate, province);
	}
}
