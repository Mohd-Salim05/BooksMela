 package com.booksmela.helper;

public class Message {

	private String msg;
	private String cssClass;
	
	
	public Message(String msg, String cssClass) {
		super();
		this.msg = msg;
		this.cssClass = cssClass;
	}

	
	//method to get specific length of string
	public static String getMaxString(String s,int maxValue) {
		
		String original=s;
		if(s.length()>150) {
		original=original.substring(0, maxValue);
		}
		return original;
	}
	
	//method to get specific length of string for name
		public static String getMaxName(String s) {
			
			String original=s;
			if(s.length()>40) {
			original=original.substring(0, 40);
			}
			return original;
		}
	

	public String getMsg() {
		return msg;
	}


	public void setMsg(String msg) {
		this.msg = msg;
	}


	public String getCssClass() {
		return cssClass;
	}


	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	
	
	
	
}
