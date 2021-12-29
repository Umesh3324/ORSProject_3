<%@page import="in.co.rays.project_3.controller.StudentListCtl"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.dto.StudentDTO"%>
<%@page import="in.co.rays.project_3.model.CollegeModelInt"%>
<%@page import="in.co.rays.project_3.model.ModelFactory"%>
<%@page import="in.co.rays.project_3.dto.CollegeDTO"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StudentList Page</title>
<link rel="shortcut icon" href="<%=ORSView.APP_CONTEXT%>/image/TitleIcon.png" type="image/x-icon">
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>

</head>
<body>
<%@include file="Header.jsp" %>

	<div>
		<form action="<%=ORSView.STUDENT_LIST_CTL%>" method="post">



			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.StudentDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("collegeList");
			%>

			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				List list = ServletUtility.getList(request);
				CollegeDTO cbean1 = new CollegeDTO();
				CollegeModelInt cmodel = ModelFactory.getInstance().getCollegeModel();
				Iterator<StudentDTO> it = list.iterator();
				if (list.size() != 0) {
			%>

			<center>
				<h1 class=" font-weight-thin pt-3"><u>Student
					List</u></h1>
			</center>
			
			<br>

			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible" align="center" style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>

				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible" align="center">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">

				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="firstName" placeholder="Enter FirstName"
						class="p1"
						value="<%=ServletUtility.getParameter("firstName", request)%>">
				</div>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="email" placeholder="Enter EmailId"
						value="<%=ServletUtility.getParameter("email", request)%>">
				</div>
				<div class="col-sm-2"><%=HTMLUtility.getList("collegeId", String.valueOf(dto.getCollegeid()), list1)%></div>
				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 17px" name="operation"
						value="<%=StudentListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-dark btn-md"
						style="font-size: 17px" name="operation"
						value="<%=StudentListCtl.OP_RESET%>">
				</div>
				<div class="col-sm-2"></div>
			</div>



			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>

							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th class="text">S.NO</th>
							<th class="text">First Name</th>
							<th class="text">Last Name</th>
							<th class="text">College Name</th>
							<th class="text">DOB</th>
							<th class="text">Mobile No</th>
							<th class="text">Email Id</th>
							<th class="text">Edit</th>

						</tr>
					</thead>
					<%
						while (it.hasNext()) {
								dto = it.next();
								CollegeDTO cbean = cmodel.findByPK(dto.getCollegeid());
					%>

					<tbody>
						<tr>
							<td align="left"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>
							<td><%=index++%></td>
							<td><%=dto.getFirstname()%></td>
							<td><%=dto.getLastname()%></td>
							<td><%=cbean.getName()%></td>
							<td><%=DataUtility.getDateString(dto.getDob())%></td>
							<td><%=dto.getMobileno()%></td>
							<td><%=dto.getEmailid()%></td>

							<div class="input-group"><td><a href="StudentCtl?id=<%=dto.getId()%>"><i class="fas fa-edit" grey-text" style="font-size: 1rem;">Edit</a></i> </div></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						value="<%=StudentListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>
					<td><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						value="<%=StudentListCtl.OP_NEW%>"></td>
					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=StudentListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=StudentListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>

			</br>

			<%
				}
				if (list.size() == 0) {
					System.out.println("user list view list.size==0");
			%>
			<center>
				<h1  class=" font-weight-bold pt-3"><u>Student
					List</u></h1>
			</center>
			</br>
				
				<div class="row">
				<div class="col-md-4"></div>
				
					<%
						if (!ServletUtility.getErrorMessage(request).equals("")) {
					%>
					<div class=" col-md-4 alert alert-danger alert-dismissible" align="center">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>	<font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h4>
					</div>
					<%
						}
					%>
					<div class="col-md-4"></div>
			</div>
			
				
				
			
			</br>
			<div style="padding-left: 48%;">
				<input type="submit" name="operation" class="btn btn-primary btn-md"
					style="font-size: 17px" value="<%=StudentListCtl.OP_BACK%>">
			</div>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>

	</div>
<%@include file="Footer.jsp" %>
</body>
</html>