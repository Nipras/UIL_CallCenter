<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String path=request.getContextPath();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Audit Report</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/CSS/report.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<script>
function closePopup(){
	$(".mastercontainer").hide();
	
	$(".backlayer").hide();
	}
	

	
function validate(){
	var errorFlag = true;
	var errors='';
	var zcid = document.getElementById("zcid").value;
	var from_date = document.getElementById("from_date").value;
	var to_date = document.getElementById("to_date").value;
	var idReg= /^[1-9]/; 
	//var dateReg=(/^(\d{4})-(\d{1,2})-(\d{1,2})\s(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
	var dateReg=(/^(\d{4})-(\d{1,2})-(\d{1,2})$/);

			if (zcid =='' ){
				errors=errors.concat("<li>"+"ZCentrix Id required"+"<br>");
				errorFlag = false;
			}
			else if (zcid.match(idReg)==null) {
				errors=errors+"<li>"+"Incorrect ZCentrixId"+"<br>";
				errorFlag = false;
			}
			
			 if	(from_date == ''){
				errors=errors+"<li>"+"From date required"+"<br>";
				errorFlag = false;
			} else if (from_date.match(dateReg)==null){
						errors=errors+"<li>"+"Incorrect Date Format, yyyy-mm-dd hh:mm:ss"+"<br>";
						errorFlag = false;
					}
			 if	(to_date == ''){
					errors=errors+"<li>"+"To date required"+"<br>";
					errorFlag = false;
				} else if (to_date.match(dateReg)==null){
							errors=errors+"<li>"+"Incorrect Date Format, yyyy-mm-dd hh:mm:ss"+"<br>";
							errorFlag = false;
						}
	    	
			if(errorFlag){
				errors=errors.concat("Form submitted");
				$("#err").html("errors"); 
				return true ;
			}else{
				$(".backlayer").show();
				$(".mastercontainer").show(); 
				$("#err").html(errors); 
				return false;
			};	
		
};

$(document).ready(function(){
	var report = $('#report'); 
	$(".search").click(function (event){
		var isValid = validate();
		if (isValid){
			report.submit();
		}
	else{
		alert("false");
	}
});
});
</script>
<body style="background-color:#fff">
<div class="header" >
<span>UIL Call Center Quality Management Portal </span> <span style="float:right">Welcome ${name}</span>
</div>
<div class="header_txt">
Detailed Audit Report <span id="msg" ></span><span style="float:right"><a href="Welcome.jsp">Home Page</a></span>
</div>
<form id="report" action="NewFile.jsp" method="post">
<div class="data-container" >
	<table class="hdr_tbl" style="display:block;">
					<tr>
					<td>Zcentrix ID:<input type="text" name="zcentrixid" id="zcid" onkeypress="fetch(event)"></td><br>
					<td>From Date:<input type="text" name="from_date" id="from_date"></td><br>
					<td>To Date:<input type="text" name="to_date" id="to_date"></td>
					
					</tr>
</div>
</table>
</form>
<div class="backlayer" style="display:none"></div>

	<div class="mastercontainer" style="display:none" draggable="true">
	<div class="heading">Errors
 	<span class="close_icon" onclick="closePopup()"> X </span> 
 	</div>
	<div id="err" style="font-size:20px;color:#2E4053;"></div>
</div>

<div class="search" id="search"  >
Search
</div><br>
<!--  <input type="text" value="Submit" class="search" />-->


</body>
</html>