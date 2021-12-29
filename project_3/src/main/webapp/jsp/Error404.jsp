<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
</head>
<body>
<div align="center">
<img src="image/image.gif" width="318" height="150" border="0">
<h1><font color="red">....oops! Something went wrong</font></h1>
<font style="size: 30px ;">
<h3>Requested Resource not found<br>
Please check the URL entered by you</h3>
</font>
</div>
<div align="center">
 <h2><a href="<%=ORSView.WELCOME_CTL%>">click here to go back</a></h2>
</div>


</body>
</html>