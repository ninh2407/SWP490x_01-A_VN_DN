package swp.model;

public class Company {
	private String id;
	private String name;
	private String region;
	private String linkRss;
	private String province;

	public Company() {

	}

	public Company(String id, String name, String region, String linkRss, String province) {
		super();
		this.id = id;
		this.name = name;
		this.region = region;
		this.linkRss = linkRss;
		this.province = province;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getLinkRss() {
		return linkRss;
	}

	public void setLinkRss(String linkRss) {
		this.linkRss = linkRss;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

}
