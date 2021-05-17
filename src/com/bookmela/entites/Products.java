package com.bookmela.entites;

public class Products {

	
	private int pid;
	private String pname;
	private String pdescription;
	private double pprice;
	private float discount;
	private int cid;
	private String ppic;
	
	public Products() {
		
	}
	//constructor
	public Products(int pid, String pname, String pdescription, double pprice, float discount, int cid,String ppic) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pdescription = pdescription;
		this.pprice = pprice;
		this.discount = discount;
		this.cid = cid;
		this.ppic = ppic;
	}
	
	
	//getters and setters
	
	
	public Products(String pname, String pdescription, double pprice, float discount, int cid, String ppic) {
		super();
		this.pname = pname;
		this.pdescription = pdescription;
		this.pprice = pprice;
		this.discount = discount;
		this.cid = cid;
		this.ppic = ppic;
	}


	public int getPid() {
		return pid;
	}

	public String getPpic() {
		return ppic;
	}


	public void setPpic(String ppic) {
		this.ppic = ppic;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdescription() {
		return pdescription;
	}

	public void setPdescription(String pdescription) {
		this.pdescription = pdescription;
	}

	public double getPprice() {
		return pprice;
	}

	public void setPprice(double pprice) {
		this.pprice = pprice;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
