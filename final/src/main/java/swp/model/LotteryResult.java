package swp.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class LotteryResult {
	private String companyId;
	private String specialPrize;
	private String firstPrize;
	private String secondPrize;
	private String thirdPrize;
	private String fourthPrize;
	private String fifthPrize;
	private String sixthPrize;
	private String seventhPrize;
	private String eighthPrize;
	private Date openDate;
	private String province;

	public LotteryResult() {

	}

	public LotteryResult(String companyId, Date openDate, String specialPrize, String firstPrize, String secondPrize,
			String thirdPrize, String fourthPrize, String fifthPrize, String sixthPrize, String seventhPrize,
			String eighthPrize) {
		super();
		this.companyId = companyId;
		this.specialPrize = specialPrize;
		this.firstPrize = firstPrize;
		this.secondPrize = secondPrize;
		this.thirdPrize = thirdPrize;
		this.fourthPrize = fourthPrize;
		this.fifthPrize = fifthPrize;
		this.sixthPrize = sixthPrize;
		this.seventhPrize = seventhPrize;
		this.eighthPrize = eighthPrize;
		this.openDate = openDate;
	}
	
	public LotteryResult(String companyId, Date openDate, String specialPrize, String firstPrize, String secondPrize,
			String thirdPrize, String fourthPrize, String fifthPrize, String sixthPrize, String seventhPrize,
			String eighthPrize, String province) {
		super();
		this.companyId = companyId;
		this.specialPrize = specialPrize;
		this.firstPrize = firstPrize;
		this.secondPrize = secondPrize;
		this.thirdPrize = thirdPrize;
		this.fourthPrize = fourthPrize;
		this.fifthPrize = fifthPrize;
		this.sixthPrize = sixthPrize;
		this.seventhPrize = seventhPrize;
		this.eighthPrize = eighthPrize;
		this.openDate = openDate;
		this.province = province;
	}
		

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getSpecialPrize() {
		return specialPrize;
	}

	public void setSpecialPrize(String specialPrize) {
		this.specialPrize = specialPrize;
	}

	public String getFirstPrize() {
		return firstPrize;
	}

	public void setFirstPrize(String firstPrize) {
		this.firstPrize = firstPrize;
	}

	public String getSecondPrize() {
		return secondPrize;
	}

	public void setSecondPrize(String secondPrize) {
		this.secondPrize = secondPrize;
	}

	public String getThirdPrize() {
		return thirdPrize;
	}

	public void setThirdPrize(String thirdPrize) {
		this.thirdPrize = thirdPrize;
	}

	public String getFourthPrize() {
		return fourthPrize;
	}

	public void setFourthPrize(String fourthPrize) {
		this.fourthPrize = fourthPrize;
	}

	public String getFifthPrize() {
		return fifthPrize;
	}

	public void setFifthPrize(String fifthPrize) {
		this.fifthPrize = fifthPrize;
	}

	public String getSixthPrize() {
		return sixthPrize;
	}

	public void setSixthPrize(String sixthPrize) {
		this.sixthPrize = sixthPrize;
	}

	public String getSeventhPrize() {
		return seventhPrize;
	}

	public void setSeventhPrize(String seventhPrize) {
		this.seventhPrize = seventhPrize;
	}

	public String getEighthPrize() {
		return eighthPrize;
	}

	public void setEighthPrize(String eighthPrize) {
		this.eighthPrize = eighthPrize;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}
		
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public void setPrize(String prize) {
		specialPrize = prize.substring(prize.indexOf("B:") + 2, prize.indexOf("1:"));
		firstPrize = prize.substring(prize.indexOf("1:") + 2, prize.indexOf("2:"));
		secondPrize = prize.substring(prize.indexOf("2:") + 2, prize.indexOf("3:"));
		thirdPrize = prize.substring(prize.indexOf("3:") + 2, prize.indexOf("4:"));
		fourthPrize = prize.substring(prize.indexOf("4:") + 2, prize.indexOf("5:"));
		fifthPrize = prize.substring(prize.indexOf("5:") + 2, prize.indexOf("6:"));
		sixthPrize = prize.substring(prize.indexOf("6:") + 2, prize.indexOf("7:"));
		if (prize.indexOf("8:") > 0) {
			seventhPrize = prize.substring(prize.indexOf("7:") + 2, prize.indexOf("8:"));
			eighthPrize = prize.substring(prize.indexOf("8:") + 2);
		} else {
			seventhPrize = prize.substring(prize.indexOf("7:") + 2);
			eighthPrize = "";
		}
	}

	public String[] getListPrize(String prize) {
		String s = prize.trim();
		return s.split("-");
	}
	
	public String getOpenDateFormat() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		return dateFormat.format(openDate);
	}
}
