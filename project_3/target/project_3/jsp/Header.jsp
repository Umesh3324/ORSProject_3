<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.dto.RoleDTO"%>
<%@page import="in.co.rays.project_3.dto.UserDTO"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="<%=ORSView.APP_CONTEXT%>/css/BackGround.css"></link>
  
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <style>
  .navbar{
  z-index: 999;
  /* position: fixed; */
  -webkit-font-smoothing: antialiased;
    /* background:#dbd8e3; */
    background: linear-gradient(to top, #fdd9eaec, rgb(231, 248, 232));
  
 
  }
 #navbardrop,#navbarDropdown{
 color: #003586;
 font-weight: 550;
 
  
  }

 .dropdown-menu{
 background: #f7f6ee;
 }
 .dropdown-item{
 z-index: 100;
 line-height: 10%;
 }
  .dropdown-item:hover{
 /* background: linear-gradient(to right, #fdd9eaec, rgb(231, 248, 232)); */
 background: linear-gradient(to top, #fdd9eaec, rgb(231, 248, 232));
} 
body{
	
  background:#f7f6ee;
  
  }
th{
  background-color: #98a3a5;
  align: center;
 }
 tr{
 font-weight: 400;
 }
 .text{
 align: center;
 }
 .font-weight-thin{
 color:#162390;
 }
 
  </style>
  
  </head>
<body>
<div id="wrapper">
		<%
			for (int i = 1; i < 11; i++) {
		%>
		<div class="bubble x<%=i%>"></div>
		<%
			}
		%>
	</div>

   


	<%
		UserDTO userDto = (UserDTO) session.getAttribute("user");
		boolean userLoggedIn = userDto != null;
		 String welcomeMsg = "Hi, ";
		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userDto.getFirstname() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>
<div id="navigation ">
	
<nav class="navbar navbar-expand-md navbar-light sticky-top shadow-sm">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=ORSView.WELCOME_CTL%>">
  	<img src="<%=ORSView.APP_CONTEXT%>/image/rays.png" width="100px" height="35px">
  </a>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse d-flex justify-content-end" id="collapsibleNavbar">
    <ul class="navbar-nav">
    
    <a class="nav-link" href="#"><span class="sr-only">(current)</span></a>

				<%
					if (userLoggedIn) {
				%>
				
				<%
					if (userDto.getRoleid() == RoleDTO.STUDENT) {
				%>
				
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i
						class="far fa-file"></i>Add Marksheet</a> <a class="dropdown-item"
						href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i class="fas fa-paste"></i>Marksheet
		List</a> <a class="dropdown-item"
						href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
						class=" far fa-file-alt"></i>Marksheet Merit List </a> <a
						class="dropdown-item" href="<%=ORSView.GET_MARKSHEET_CTL%>"><i
						class="far fa-copy"></i>Get Marksheet</a>
				</div>
				</li>

				<%
					}  else if (userDto.getRoleid() == RoleDTO.ADMIN) { 
				%>
				 
       
       <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link  btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        User
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.USER_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add User</a>
        <a class="dropdown-item" href="<%=ORSView.USER_LIST_CTL%>"><i class="fas fa-list"></i>&nbsp;User List</a>
      </div>
    </li> 
    
    	 <!-- Dropdown -->
    <li class="nav-item dropdown ">
      <a class="nav-link btn dropdown-toggle " href="#" id="navbardrop" data-toggle="dropdown">
        Marksheet
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Marksheet</a>
        <a class="dropdown-item" href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Marksheet List</a>
        <a class="dropdown-item" href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i class="fas fa-star"></i>&nbsp;Marksheet Merit List</a>
        <a class="dropdown-item" href="<%=ORSView.GET_MARKSHEET_CTL%>"><i class="fas fa-file"></i>&nbsp;Get Marksheet</a>
      </div>
    </li>
    
    
     <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Role
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Role</a>
        <a class="dropdown-item" href="<%=ORSView.ROLE_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Role List</a>
      </div>
    </li>
    
     <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
       College
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add College</a>
        <a class="dropdown-item" href="<%=ORSView.COLLEGE_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;College List</a>
      </div>
    </li>
    
    
     <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Course
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Course</a>
        <a class="dropdown-item" href="<%=ORSView.COURSE_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Course List</a>
      </div>
    </li>
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Student
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Student</a>
        <a class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Student List</a>
      </div>
    </li>
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Faculty
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Faculty</a>
        <a class="dropdown-item" href="<%=ORSView.FACULTY_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Faculty List</a>
      </div>
    </li>
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        TimeTable
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.TIMETABLE_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Time Table</a>
        <a class="dropdown-item" href="<%=ORSView.TIMETABLE_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Time Table List</a>
      </div>
    </li>
    
    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link btn dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Subject
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><i class="fas fa-pen"></i>&nbsp;Add Subject</a>
        <a class="dropdown-item" href="<%=ORSView.SUBJECT_LIST_CTL%>"><i class="fas fa-tasks"></i>&nbsp;Subject List</a>
      </div>
    </li>
    
    <%} }%>
    
    <li class="nav-item dropdown">
	<a class="nav-link btn btn-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
	data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user-tie"></i>&nbsp;<%=welcomeMsg%></a>
					
	<div class="dropdown-menu ml-auto" aria-labelledby="navbarDropdown">
						<%
							 if (userLoggedIn) { 
						%>
						
						
	<a class="dropdown-item" href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>">
		<i	class="fas fa-sign-out-alt"></i>Logout </a>
		 <a class="dropdown-item" href="<%=ORSView.MY_PROFILE_CTL%>">
		 <i class="fas fa-user"></i>My Profile</a>
	     <a class="dropdown-item" href="<%=ORSView.CHANGE_PASSWORD_CTL%>">
		 <i	class="fas fa-edit"></i>Change Password</a>
		 <a class="dropdown-item" href="<%=ORSView.JAVA_DOC_VIEW%>"	target="blank">
		 <i class="fas fa-clone"></i>Java Doc </a>
						<%
							} else { 
						%>
		<a class="dropdown-item" href="<%=ORSView.LOGIN_CTL%>">
		<i class="fas fa-sign-in-alt"><b>Login</b></i>
		<a	class="dropdown-item" href="<%=ORSView.USER_REGISTRATION_CTL%>">
		<i class="fas fa-registered"><b>User Registration</b></i>
	</a>
	
	</div>
	</li>
    	
    			<%
					}
				%>
    
    </ul>
  </div>  
  
  </ul>


</nav>
</div>
<br><br>
</body>
</html>