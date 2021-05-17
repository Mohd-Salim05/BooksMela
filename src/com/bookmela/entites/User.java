package com.bookmela.entites;

import java.sql.Timestamp;

public class User {

	private int uid;
	private String uname;
	private String uemail;
	private String upass;
	private String uaddress;
	private String ugender;
	private Timestamp reg_date;
	private String upic;
	private String um_number;
	
	
	public User() {
	}
	
	
	
	
	
	public User(int uid, String uname, String uemail, String upass, String uaddress, String ugender, Timestamp reg_date,
			String upic, String um_number) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.uemail = uemail;
		this.upass = upass;
		this.uaddress = uaddress;
		this.ugender = ugender;
		this.reg_date = reg_date;
		this.upic = upic;
		this.um_number = um_number;
	}





	//constructor
	public User(String uname, String uemail, String uaddress, String ugender, String upic) {
		super();
		this.uname = uname;
		this.uemail = uemail;
		this.uaddress = uaddress;
		this.ugender = ugender;
		this.upic = upic;
		
	}
	
	

	public User(String uname, String uemail,String upass, String uaddress, String ugender, String um_number) {
		super();
		this.uname = uname;
		this.uemail = uemail;
		this.uaddress = uaddress;
		this.ugender = ugender;
		this.um_number = um_number;
		this.upass=upass;
	}



	//getters and setters
	
	public String getUpass() {
		return upass;
	}



	public void setUpass(String upass) {
		this.upass = upass;
	}
	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUaddress() {
		return uaddress;
	}

	public void setUaddress(String uaddress) {
		this.uaddress = uaddress;
	}

	public String getUgender() {
		return ugender;
	}

	public void setUgender(String ugender) {
		this.ugender = ugender;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public String getUpic() {
		return upic;
	}

	public void setUpic(String upic) {
		this.upic = upic;
	}

	public String getUm_number() {
		return um_number;
	}

	public void setUm_number(String um_number) {
		this.um_number = um_number;
	}
	
	
	
	
}
