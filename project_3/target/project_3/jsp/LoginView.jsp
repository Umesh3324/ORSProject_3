<%@page import="in.co.rays.project_3.controller.UserRegistrationCtl"%>
<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Log In page</title>
<link rel="shortcut icon" href="<%=ORSView.APP_CONTEXT%>/image/TitleIcon.png" type="image/x-icon">
</head>
<body>
<%@ include file="Header.jsp" %>

	<form action="<%=ORSView.LOGIN_CTL%>" method="post">
		
	
			<div class="row log1">
				<!-- Grid column -->
				<div class="col-sm-4 "></div>
				<div class="col-sm-4">
					<div class="card rounded-lg border-secondary shadow">
						<div class="card-body">

							<h3 class="text-center text-primary"><u>Login</u></h3>
							<!--Body-->
							<div>

								<jsp:useBean id="dto" class="in.co.rays.project_3.dto.UserDTO" scope="request"></jsp:useBean>
								<H6 align="center">
									<%
										if (!ServletUtility.getSuccessMessage(request).equals("")) {
									%>
									<div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getSuccessMessage(request)%>
									</div>
									<%
										}
									%>
								</H6>

								<H6 align="center">
									<%
										if (!ServletUtility.getErrorMessage(request).equals("")) {
									%>
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
											<%=ServletUtility.getErrorMessage(request)%>
									</div>
									<%
										}
									%>

								</H6>
								<%
									String uri = (String) request.getAttribute("uri");
								%>
								
								
								<input type="hidden" name="id" value="<%=dto.getId()%>">
								<input type="hidden" name="createdBy" value="<%=dto.getCreatedby()%>"> 
								<input type="hidden" name="modifiedBy" value="<%=dto.getModifiedby()%>"> 
								<input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(dto.getCreateddatetime())%>">
								<input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(dto.getModifieddatetime())%>">
							</div>
							
		<br><br>
	
	<div class="col-sm-12">
      <div class="input-group">
      <label><b>Email Id</b></label>
		<span style="color: red;">*</span> &nbsp; &nbsp;
        <div class="input-group-prepend">
          <div class="input-group-text"><i class="fa fa-envelope grey-text" style="font-size: 1rem;"></i> 
          
          </div>
        </div>
        <input type="text" class="form-control" name="loginid" placeholder="Enter email" value="<%=DataUtility.getStringData(dto.getLoginid())%>">
      </div>
    </div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("loginid", request)%></font></br>								
					
	
	<div class="col-sm-12">
      <div class="input-group">
      <label><b>Password</b></label>
	<span style="color: red;">*</span> &nbsp;
        <div class="input-group-prepend">
          <div class="input-group-text"><i class="fa fa-lock grey-text" style="font-size: 1rem;"></i> </div>
        </div>
        <input type="password" id="myInput" class="form-control" name="password" placeholder="Enter password"  value="<%=DataUtility.getStringData(dto.getPassword())%>"> 	
       
     </div>
    </div>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 	<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("password", request)%></font></br>	</br>						
		

							<div class="text-center">

								<input type="submit" name="operation"
									class="btn btn-success btn-md hover-overlayed" style="font-size: 17px"
									value="<%=LoginCtl.OP_SIGN_IN%>"> 
									
								<input type="submit"
									name="operation" class="btn btn-info btn-md"
									style="font-size: 17px"
									value="<%=UserRegistrationCtl.OP_SIGN_UP%>">
							</div>
							<div class="text-center">
								<a href="<%=ORSView.FORGET_PASSWORD_CTL%>"
									style="color: black; font-size: 15px;"><b>Forget my
										password ?</b></a>
							</div>
							
							<input type="hidden" name="uri" value="<%=uri%>">
						</div>
					</div>
				</div>
				
			</div>

		</form>
		</main>

<%@ include file="Footer.jsp" %>
</body>
</html>