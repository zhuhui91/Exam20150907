<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags" %>   
 <% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登录界面</title>
<link href="appmy.css" rel="stylesheet">
</head>
<body>
     <div class="body1">
            <div class="ghID">
               <h1>8829梁柱辉</h1>
            </div>
          <div class="form1">
               <div class="form1-1">
                    <h3>电影租赁管理系统</h3>
               </div>
               <div class="form1-2">
                    <div class="form1-2-1">
                        <form class="form12" action="loginaction" Method="post">             
                                                                                        用户名:<input type="text" name="first_name" />
                            <br>
                                                                                         密码：<input type="password" name="last_name" />
                           <BR><Input type=submit value="登录" />
                        </form>
                    </div>
               </div>
          </div>
      </div>
</body>
</html>