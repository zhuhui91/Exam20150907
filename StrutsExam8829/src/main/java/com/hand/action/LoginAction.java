package com.hand.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport
{

	private String first_name;
	   private String last_name;
	   private String name;
	   public String execute() {
	      String ret = ERROR;
	      Connection conn = null;
	      try {
	    	  System.out.println("login try---1");
	         String URL = "jdbc:mysql://localhost:3306/sakila";
	         Class.forName("com.mysql.jdbc.Driver");
	         conn = DriverManager.getConnection(URL, "root", "");
	         System.out.println("login try---2");
	         String sql = "SELECT name FROM customer WHERE";
	         sql+=" first_name = ? AND last_name = ?";
	         System.out.println("login try---3");
	         PreparedStatement ps = conn.prepareStatement(sql);
	         System.out.println("the ps -->"+ps);
	         System.out.println("login try---4");
	         System.out.println("first_name--4>"+first_name);
	         ps.setString(3, first_name);
	         System.out.println("first_name-->"+first_name);
	         ps.setString(4, last_name);
	         System.out.println("login try---5");
	         ResultSet rs = ps.executeQuery();
	         System.out.println("login try---6");
	         while (rs.next()) {
	        	 System.out.println("login success!");
	            name = rs.getString(1);
	            ret = SUCCESS;
	         }
	      } catch (Exception e) {
	    	  System.out.println("login  erro!");
	         ret = ERROR;
	      } finally {
	         if (conn != null) {
	            try {
	               conn.close();
	            } catch (Exception e) {
	            }
	         }
	      }
	      return ret;
	   }
	 
	   public String getFirst_name()
	{
		return first_name;
	}

	public void setFirst_name(String first_name)
	{
		this.first_name = first_name;
	}
	   public String getLast_name()
	{
		return last_name;
	}

	public void setLast_name(String last_name)
	{
		this.last_name = last_name;
	}

	public String getName() {
	      return name;
	   }
	   public void setName(String name) {
	      this.name = name;
	   }
	
	
}
