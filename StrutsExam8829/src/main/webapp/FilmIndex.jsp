<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" import="java.sql.DriverManager" 
                import="java.sql.ResultSet" import="java.sql.Statement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Film 管理页面</title>
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
                  <a href="index.jsp">Customer管理</a>
              </li>
               <li class="main">
                 <a href="#">Film设置</a>
          </li>
       </ul>
           </div>
           <div class="customer">
                   <div class="flt2">
                         <p>电影信息列表
                      </div>
                      <div class="dft3">
                           <table>


						<%
							Connection conn = null;
							Class.forName("com.mysql.jdbc.Driver"); //注册mysql驱动程序
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "");
							Statement stmt = conn.createStatement();
							String cty = "select * from film";
							ResultSet rs = stmt.executeQuery(cty);
						%>

						<tr>
							<th class="th">Film_Id</th>
							<th class="th">Title</th>
							<th class="th">Description</th>
							<th class="th">Release_Year</th>
							<th class="th">Language_Id</th>
							<th class="th">Rental_Duration</th>
							<th class="th">Rental_Rate</th>
							<th class="th">Length</th>
							<th class="th">Rating</th>
							<th class="th">Special_Features</th>
							<th class="th">Last_Update</th>
						</tr>


						<%
							while (rs.next())
							{
						%>

						<tr>
							<td class="td"><%=rs.getString("film_id")%></td>
							<td class="td"><%=rs.getString("title")%></td>
							<td class="td"><%=rs.getString("description")%></td>
							<td class="td"><%=rs.getString("release_year")%></td>
							<td class="td"><%=rs.getString("language_id")%></td>
							<td class="td"><%=rs.getString("rental_duration")%></td>
							<td class="td"><%=rs.getString("rental_rate")%></td>
							<td class="td"><%=rs.getString("length")%></td>
							<td class="td"><%=rs.getString("rating")%></td>
							<td class="td"><%=rs.getString("special_features")%></td>
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
</body>
</html>