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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Login page</title>
<script>
$(document).ready(function(){
	
	var loginForm = $('#loginForm'); 
		 $(".btn_submit").click(function (event) {   	        
        
			event.preventDefault();
	    	 $.ajax({
	    		  url: '<%=path %>/Login',
	    		  method: 'POST',
	    		  data: loginForm.serialize(),
	    		  success: function (res) {    			 
	    			  if(res == 'Error'){   		
	    			   		      
	    				  $("#msg").html("User Authentication Failed !! Invalid Credentials");   
	    			  }	else{
	    				  var str = "<%=path %>" ;
	    				  var url = str + "/JSP/Welcome.jsp"
	    				  window.location = url.toString() ;
	    			  }
	    			  
	    		  } ,
	    		  error: function(){
	    			  alert("Database could not be connected");
	    		  }
	    		});
   });
	});


</script>
</head>

<body >

<div class="header" />
</span><span>UIL Call Center Quality Management Portal</span>
</div>

<img src="<%=path %>/Images/img5.jpg" class="bg"/>
<div id="msg" class="err_msg"> </div>
<form action="Login" method="post" id="loginForm">
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
			<td colspan="2"><input type="button" class="btn_submit" value="Login"></td>			
		</tr>
	</table>
</div>
</form>
</body>
</html>