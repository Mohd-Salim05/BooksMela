package com.booksmela.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection conn;
	
	static String username="root";
	static String userpass="salim";
	static String url= "jdbc:mysql://localhost:3306/bookmela ";
	
	
	//for getting connection
	public static Connection getConnection() {
		
		try{
			
			if(conn==null) {
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   conn=DriverManager.getConnection(url,username,userpass);	
			  
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
}
