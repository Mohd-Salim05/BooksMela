package com.booksmela.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bookmela.entites.Categories;


public class CategoriesDao {

	
	private Connection con;
	
	
	
	
	public CategoriesDao(Connection con) {
		super();
		this.con = con;
	}




	//it get categories from DB
	public ArrayList<Categories> getAllCategories() {
		
		Categories cg;
		ArrayList<Categories> list=new ArrayList<Categories>();
		
		try {
			  String query="select * from categories;";
			PreparedStatement pstm=con.prepareStatement(query);
			ResultSet set= pstm.executeQuery();
			
			while(set.next()) {
				int cid=set.getInt(1);
				String cname=set.getString(2);
				String cdes=set.getString(3);
				
				cg=new Categories(cid, cname, cdes);
				list.add(cg);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
