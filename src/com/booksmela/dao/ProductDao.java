package com.booksmela.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.bookmela.entites.Products;


public class ProductDao {

	
	private Connection con;

	//constructor
	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	//inserting product
public boolean insertProduct(Products p) {
		
		boolean done=false;
		
		try {
			   String query="insert into products(pname,pdescription,pprice,pdiscount,ppic,cid) values(?,?,?,?,?,?);";
			  PreparedStatement ps=con.prepareStatement(query);
			  ps.setString(1, p.getPname());
			  ps.setString(2, p.getPdescription());
			  ps.setDouble(3,p.getPprice());
			  ps.setFloat(4, p.getDiscount());
			  ps.setString(5, p.getPpic());
			  ps.setInt(6, p.getCid());
			  ps.executeUpdate();
			  done=true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return done;
	}
	
	
	//getting all products
	public ArrayList<Products> getAllProducts(){
		
		ArrayList<Products> list=new ArrayList<Products>();
		Products p=null;
		try {
			
			  String query="select * from products;";
			  
			  PreparedStatement ps=con.prepareStatement(query);
			  ResultSet rs=ps.executeQuery();
			 
			  while(rs.next()) {
				  int pid=rs.getInt("pid");
				  String pname=rs.getString("pname");
				  String pdesc=rs.getString("pdescription");
				  double pprice=rs.getDouble("pprice");
				  float pdiscount=rs.getFloat("pdiscount");
				  int cid=rs.getInt("cid");
				  String ppic=rs.getString("ppic");
				  p=new Products(pid, pname, pdesc, pprice, pdiscount, cid,ppic);
				  
				  list.add(p);
			  }
		} catch (Exception e) {
		   e.printStackTrace();
		}

		return list;
	}
	
	//getting  products by cat id
		public ArrayList<Products> getProductsByCatId(int catid){
			
			ArrayList<Products> list=new ArrayList<Products>();
			Products p=null;
			try {
				
				  String query="select * from products where cid=?;";
				  
				  PreparedStatement ps=con.prepareStatement(query);
				  ps.setInt(1, catid);
				  ResultSet rs=ps.executeQuery();
				 
				  while(rs.next()) {
					  int pid=rs.getInt("pid");
					  String pname=rs.getString("pname");
					  String pdesc=rs.getString("pdescription");
					  double pprice=rs.getDouble("pprice");
					  float pdiscount=rs.getFloat("pdiscount");
					  int cid=rs.getInt("cid");
					  String ppic=rs.getString("ppic");
					  p=new Products(pid, pname, pdesc, pprice, pdiscount, cid,ppic);
					  
					  list.add(p);
				  }
			} catch (Exception e) {
			   e.printStackTrace();
			}

			return list;
		}
	
	
		//getting  products by pid
				public Products getProductsByPid(int pid){
					
					
					Products p=null;
					try {
						
						  String query="select * from products where pid=?;";
						  
						  PreparedStatement ps=con.prepareStatement(query);
						  ps.setInt(1, pid);
						  ResultSet rs=ps.executeQuery();
						 
						  while(rs.next()) {	
							  p=new Products();
							  String pname=rs.getString("pname");
							  String pdesc=rs.getString("pdescription");
							  double pprice=rs.getDouble("pprice");
							  float pdiscount=rs.getFloat("pdiscount");
							  int cid=rs.getInt("cid");
							  String ppic=rs.getString("ppic");
							  p=new Products(pid, pname, pdesc, pprice, pdiscount, cid,ppic);
							 
						  }
					} catch (Exception e) {
					   e.printStackTrace();
					}

					return p;
				}
	
	
	
	
}
