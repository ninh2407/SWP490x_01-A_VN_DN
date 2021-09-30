package swp.model;

import java.sql.Date;

public class LotteryTicket {
	private String companyId;
	private Date openDate;
	private String ticketCode;
	private String userMail;

	public LotteryTicket() {

	}

	public LotteryTicket(String companyId, Date openDate, String ticketCode, String userMail) {
		super();
		this.companyId = companyId;
		this.openDate = openDate;
		this.ticketCode = ticketCode;
		this.userMail = userMail;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public String getTicketCode() {
		return ticketCode;
	}

	public void setTicketCode(String ticketCode) {
		this.ticketCode = ticketCode;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

}
