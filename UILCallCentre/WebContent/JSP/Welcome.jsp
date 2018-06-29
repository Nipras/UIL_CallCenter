<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String path=request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=path %>/CSS/login.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/CSS/welcome.css" />
<title>Login page</title>
</head>

<body >

<div class="header">
<span>UIL Call Center Quality Management Portal </span> <span style="float:right">Welcome ${name}</span>
</div>
<table class="mast_tbl" border="0"  >
<tr>
<!-- Beginning of column 1 -->
	<td width="33%"> 	
	<!-- Beginning of c1r1 -->
	 <table class="c1r1_tbl" border="0">
	 <tr><th>Data Entry</th></tr>
	 <tr>
	 <td>
	 <ul style="margin:0px;">
	 <li><a href="<%=path %>/JSP/Create.jsp">Call Monitoring</a></li>
	 <li><a href="<%=path %>/JSP/Edit.jsp">Feedback</a></li>
	 </ul>	 
	 </td></tr>	 
	 </table>
	 <!-- Beginning of c1r2 -->
	 <table class="c1r2_tbl" border="0">
	 <tr><th>Reports</th></tr>
	 <tr><td>
	 <ul style="margin:0px;">
	 <li><a href="<%=path %>/JSP/report.jsp">Detailed Audit Report</a></li>
	 <li>Summary Audit Report</li>
	 <li>Call-Category Wise Analysis</li>
	 </ul>	 
	 </td></tr>
	 </table>
	 <!-- Beginning of c1r3 -->
	 <table class="c1r3_tbl" border="0">
	 <tr><th>Master Data</th></tr>
	  <tr><td>
	 <ul style="margin:0px;">
	 <li>User Creation & Maintenance</li>
	 <li>Maintain Updates</li>
	 <li>Call-Category Wise Analysis</li>
	 </ul>	 
	 </td></tr>
	 </table>	
	</td>
<!-- Beginning of column 2 -->		
	<td width="33%"> 
	<!-- Beginning of c2r1 -->
	 <table class="c2r1_tbl" border="0">
	 <tr><th>Updates & Notifications</th></tr>
	 <tr>
	 <td>
	 <ul style="margin:0px;">
	 
	 </ul>	 
	 </td></tr>	 
	 </table>	
	</td>	 
<!-- Beginning of column 3 -->	
	<td width="33%">
	<table class="c3r1_tbl" border="0">
	 <tr><th>Birthday Today</th></tr>
	 <tr>
	 <td>
	 <ul style="margin:0px;">
	 <li>Dummy Emp Name1</li>
	 <li>Dummy Emp Name2</li>
	 </ul>	 
	 </td></tr>	 
	 </table> 
	 
	 <table class="c3r2_tbl" border="0">
	 <tr><th>Top Performers</th></tr>
	 <tr>
	 <td>
	 <ul>
	 <li>Update1</li>
	 <li>Update2</li>
	 </ul>	 
	 </td></tr>	 
	 </table> 
	
	</td>
</tr>



</table>

</div>
</body>
</html>