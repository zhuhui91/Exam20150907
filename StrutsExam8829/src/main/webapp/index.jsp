<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.sql.Connection" import="java.sql.DriverManager" 
                import="java.sql.ResultSet" import="java.sql.Statement" %>
 <% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>电影租赁管理系统主界面</title>
<link href="appmy2.css" rel="stylesheet">
</head>
<body>
<div class="dody">
     <div class="body0"> 
          <h3>8829梁柱辉</h3>
     </div>
     <div class="dody1">
           <div class="dody11">
           <ul>
              <li class="main">
                  <a href="#">Customer管理</a>
              </li>
               <li class="main">
                 <a href="FilmIndex.jsp">Film设置</a>
          </li>
       </ul>
           </div>
           <div class="customer">
                  <div>
                    <h3>客户管理</h3>
                  </div>
                  <div class="ct1">
                    <table>
                       <tr>
                           <td id="td1"><p>客户列表</td>
                           <td> <a href="CustomerNew.jsp">新建</a></td>
                       </tr>
                    </table>                
                  </div>
                  <div class="ct2">
                      <div class="dtb">
                          <table class="table">
                 

						<%
							Connection conn = null;
							Class.forName("com.mysql.jdbc.Driver"); //注册mysql驱动程序
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "");
							Statement stmt = conn.createStatement();
							String cty = "select first_name,last_name,address_id,email,customer_id,last_update from customer";
							ResultSet rs = stmt.executeQuery(cty);
						%>

						<tr>
						    <th class="th">操作</th>
							<th class="th">First Name</th>
							<th class="th">Last Name</th>
							<th class="th">Address</th>
							<th class="th">Email</th>
							<th class="th">Customer</th>
							<th class="th">LastUpodate</th>
						</tr>


						<%
							while (rs.next())
							{
						%>

						<tr>
						    <td class="td"><a href="#">编辑</a>|<a href="#">删除</a></td>
							<td class="td"><%=rs.getString("first_name")%></td>
							<td class="td"><%=rs.getString("last_name")%></td>
							<td class="td"><%=rs.getString("address_id")%></td>
							<td class="td"><%=rs.getString("email")%></td>
							<td class="td"><%=rs.getString("customer_id")%></td>
							<td class="td"><%=rs.getString("last_update")%></td>
						</tr>
						<%
							}
							conn.close(); //关闭数据库
						%>
					</table>
                      </div>					

				</div>
              
           </div>
     </div>
</div>
</body>
</html>