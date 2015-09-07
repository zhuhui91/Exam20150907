package com.hand.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class selectAction extends ActionSupport
{
   
	@Override
	public String execute() throws Exception
	{
		ServletRequest request=ServletActionContext.getRequest();
		ServletResponse response=ServletActionContext.getResponse();
		ServletContext con=ServletActionContext.getServletContext();
		
		String username=request.getParameter("username");
		System.out.println("第四种(推荐使用):"+username);
		
		
		Connection conn=null;
		 Class.forName("com.mysql.jdbc.Driver"); //注册mysql驱动程序
		 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila","root","");
		 Statement stmt = conn.createStatement();
			String cty="select first_name,last_name,address_id,email,customer_id,last_update from customer";
			ResultSet rs = stmt.executeQuery(cty);
			
			System.out.println("First Name|" + "\t"
						+ "Last Name|"+"\t"+"Address|"+"\t"+"Email|"+"\t"+"Customer|"+"\t"+"LastUpodate");
			 while (rs.next()) {
				 System.out.println(rs.getString("first_name") + "\t"
							+ rs.getString("last_name")+"\t"+rs.getString("address_id") + "\t"+rs.getString("email") + "\t"
							+rs.getString("customer_id") + "\t"+rs.getString("last_update"));
				}		 
						 conn.close(); //关闭数据库
		
		return "success";
	}
	
}
