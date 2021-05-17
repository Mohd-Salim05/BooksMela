package com.bookmela.entites;

public class Categories {

	
	private int cid;
	private String cname;
	private String cdescription;
	
	//constructor
	public Categories(int cid, String cname, String cdescription) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cdescription = cdescription;
	}
	
	//getters and setters
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdescription() {
		return cdescription;
	}
	public void setCdescription(String cdescription) {
		this.cdescription = cdescription;
	}
	
}
