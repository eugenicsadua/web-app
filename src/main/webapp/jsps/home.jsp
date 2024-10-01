<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOMACS IT SOLUTIONS- Home Page</title>
<link href="images/DP black.png" rel="icon">
</head>
</head>
<body>
<h1 align="center">Welcome to JOMACS IT SOLUTIONS INC. </h1>
<h1 align="center">We are a leading provider of IT solutions for companies and individuals. We specialize in web development, software engineering, DevOps engineering, data science and corporate training and workshops. Our team of experts is dedicated to delivering the highest quality services that are tailored to meet the unique needs of each of our clients. With our innovative solutions and commitment to excellence, we help our clients to achieve their goals and stay ahead of the competition. You will love our service. </h1>
<hr>
<br>
	<h1><h3> Server Side IP Address </h3><br>

<% 
String ip = "";
InetAddress inetAddress = InetAddress.getLocalHost();
ip = inetAddress.getHostAddress();
out.println("Server Host Name :: "+inetAddress.getHostName()); 
%>
<br>
<%out.println("Server IP Address :: "+ip);%>
		
</h1>
	
<hr>
<div style="text-align: center;">
	<span>
		<img src="images/DP black.png" alt="" width="150">
	</span>
	<span style="font-weight: bold;">
                JOMACS IT SOLUTIONS INC., 
		Calgary, Alberta, Canada
		+1 587 402 1728,
		info@jomacsit.com
		<br>
		<a href="mailto:info@jomacsit.com">Mail to JOMACS IT SOLUTIONS INC.</a>
	</span>
</div>
<hr>
	<p> Service : <a href="services/employee/getEmployeeDetails">Get Employee Details </p>
<hr>
<hr>
<p align=center>JOMACS IT SOLUTIONS - Consultantancy, Training and Software Development</p>
<p align=center><small>Copyrights 2022 by <a href="http://jomacsit.com/">JOMACS IT SOLUTIONS INC.</a> </small></p>

</body>
</html>
