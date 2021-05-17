package com.booksmela.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.bookmela.entites.User;

public class UserDao {

	private Connection con;
	
	
	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	//it saves the new user in DB
	public boolean saveUser(User user) {
		
		boolean done=false;
		
		try {
			   String query="insert into user(uname,uemail,upassword,uaddress,ugender,um_number) values(?,?,?,?,?,?);";
			  PreparedStatement ps=con.prepareStatement(query);
			  ps.setString(1, user.getUname());
			  ps.setString(2, user.getUemail());
			  ps.setString(3, user.getUpass());
			  ps.setString(4, user.getUaddress());
			  ps.setString(5, user.getUgender());
			  ps.setString(6, user.getUm_number());
			  ps.executeUpdate();
			  done=true;

		} catch (Exception e) {
			return false;
		}
		return done;
	}

//it fetch user from DB by taking email and password
	
	public User getUserByEmailAndPassword(String email,String password) {
		
		User user=null;
		
		try {
		     
			String query="select * from user where uemail=? and upassword=?;";
			PreparedStatement pstm=con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			
			ResultSet rs=pstm.executeQuery();
			if(rs.next()) {
				user=new User();
			
				int uid =rs.getInt("uid");
				user.setUid(uid);
				user.setUname(rs.getString("uname"));
				user.setUemail(rs.getString("uemail"));
				user.setUpass(rs.getString("upassword"));
				user.setUaddress(rs.getString("uaddress"));
				user.setUgender(rs.getString("ugender"));
				user.setReg_date(rs.getTimestamp("reg_date"));
				user.setUpic(rs.getString("upic"));
				user.setUm_number(rs.getString("um_number"));
				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}


	
	
	
	
	public boolean updateUser(User user) {
		
		 boolean done=false;
		try {
			
			String query="update user set uemail=? , uaddress=?,um_number=? where uid=?;";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, user.getUemail());
			pst.setString(2, user.getUaddress());
			pst.setString(3, user.getUm_number());
			pst.setInt(4, user.getUid());
			pst.executeUpdate();
			done=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return done;
		
	}
	
	
	
	
}
