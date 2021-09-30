package swp.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import swp.model.LotteryTicket;

@Repository
public interface LotteryTicketDAO {
	public void addTicket(LotteryTicket ticket);
	public List<LotteryTicket> findTicketByMail(String userMail);
}
