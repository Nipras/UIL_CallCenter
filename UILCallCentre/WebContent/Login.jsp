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
<title>Login page</title>
<script>
f

</script>
</head>

<body >

<div class="header" />
</span><span>UIL Call Center Quality Management Portal</span>
</div>

<img src="<%=path %>/Images/img5.jpg" class="bg"/>
<form action="Login" method="post">
<div class="logonArea"> 
	<table style="margin:10px 0px 0px 8px" >
		<tr>
			<th colspan="2">Please Login to Continue</th>
			
		</tr>
		<tr >
			<td>EmpId</td>
			<td><input type="text" name="empid" /></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password"  name="pass"/></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" class="btn_login" value="Login"></td>			
		</tr>
	</table>
</div>
</form>
</body>
</html>