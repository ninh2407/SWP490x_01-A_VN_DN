package swp.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class LotteryTicket {
	private String companyId;
	private Date openDate;
	private String ticketCode;
	private String userMail;
	private String result;
	private String province;

	public LotteryTicket() {

	}

	public LotteryTicket(String companyId, Date openDate, String ticketCode, String userMail, String result,
			String province) {
		super();
		this.companyId = companyId;
		this.openDate = openDate;
		this.ticketCode = ticketCode;
		this.userMail = userMail;
		this.result = result;
		this.province = province;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
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

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	public String getOpenDateFormat() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		return dateFormat.format(openDate);
	}

}
