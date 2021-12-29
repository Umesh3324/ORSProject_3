<%@page import="in.co.rays.project_3.controller.MarksheetListCtl"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.dto.MarksheetDTO"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Marksheet Page</title>
<link rel="shortcut icon" href="<%=ORSView.APP_CONTEXT%>/image/TitleIcon.png" type="image/x-icon">
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>

</head>
<body>
<%@ include file="Header.jsp" %>

<div>
		<form action="<%=ORSView.MARKSHEET_LIST_CTL%>" method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.MarksheetDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("RollNo");
			%>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				List list = ServletUtility.getList(request);
				Iterator<MarksheetDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
		
			
				<h1 class=" font-weight-thin pt-3 d-flex justify-content-center"><u>Marksheet
					List</u></h1>
			

			<br><br>

			<div class="d-flex justify-content-center">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible" align="center" style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4><font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font></h4>
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
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">

				<div class="col-sm-3"></div>
				<div class="col-sm-2">
					<input class="form-control" type="text" name="name" placeholder="Enter name" class="p1"
						value="<%=ServletUtility.getParameter("name", request)%>">
				</div>

				<div class="col-sm-2"><%=HTMLUtility.getList("rollno", String.valueOf(dto.getRollno()), list1)%></div>
				
				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 17px" name="operation"
						value="<%=MarksheetListCtl.OP_SEARCH%>">&emsp; <input
						type="submit" class="btn btn-dark btn-md"
						style="font-size: 17px" name="operation"
						value="<%=MarksheetListCtl.OP_RESET%>">
				</div>

				<div class="col-sm-3"></div>
			</div>


			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table table-striped table-hover table-bordered">
					<thead>
						<tr>

							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th class="text">S.NO</th>

							<th class="text">RollNo</th>
							<th class="text">Name</th>
							<th class="text">Physics</th>
							<th class="text">Chemistry</th>
							<th class="text">Maths</th>
							<th class="text">Edit</th>
						</tr>
					</thead>
					<%
						while (it.hasNext()) {
								dto = it.next();
					%>

					<tbody>
						<tr>
							<td align="left"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>
							<td><%=index++%></td>
							<td><%=dto.getRollno()%></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getPhysics()%></td>
							<td><%=dto.getChemistry()%></td>
							<td><%=dto.getMaths()%></td>

					<div class="input-group"><td><a href="MarksheetCtl?id=<%=dto.getId()%>"><i class="fas fa-edit" grey-text" style="font-size: 1rem;">Edit</i></a></td></div>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			
			
			<div class="d-flex justify-content-between mb-3">
			
			
				<div class="p-2"><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						value="<%=MarksheetListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></div>

				<div class="p-2"><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						value="<%=MarksheetListCtl.OP_NEW%>"></div>

				<div class="p-2"><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=MarksheetListCtl.OP_DELETE%>"></div>

				<div class="p-2"><input type="submit" name="operation"
						class="btn btn-secondary btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=MarksheetListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></div>
			</div>
			

			<%
				}
				if (list.size() == 0) {
					System.out.println("user list view list.size==0");
			%>
			<center>
				<h1 class=" font-weight-bold pt-3"><u>Marksheet
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
					<h4>
						<font color="red"><%=ServletUtility.getErrorMessage(request)%></font></h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			</br>
			<div style="padding-left: 48%;">
				<input type="submit" name="operation" class="btn btn-primary btn-md"
					style="font-size: 17px" value="<%=MarksheetListCtl.OP_BACK%>">
			</div>
			<%
				}
			%>
			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">


		</form>

	</div>
<%@ include file="Footer.jsp" %>
</body>
</html>