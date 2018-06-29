<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>;
     <%@page import="java.util.*" %>;
<%@page import="org.json.*" %>;
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NF</title>
<style>
#report {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#report td, #report th {
    border: 1px solid #ddd;
    padding: 8px;
}

#report tr:nth-child(even){background-color: #f2f2f2;}

#report tr:hover {background-color: #ddd;}

#report th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
.header{
font-size:20px;
font-weight:500;
background-color:#DF0418;
border: 0px solid #DF0418;
color:#FFFFFF;
line-height:30px;
vertical-align:center;
padding-left:6px;
padding-right:4px;
padding-top:14px;
padding-bottom:14px;
font-weight:500;
font-family: Sans-Serif;
text-align:center;
height:30px;
}
.header_txt{
	font-size:24px;
	font-weight:800;
	color:#3f3f3f;
	margin-top:10px;
}
</style>
</head>
<body style="background-color:#fff">
<div class="header" />
</span><span>UIL Call Center Quality Management Portal </span> <span style="float:right">Welcome ${name}</span>
</div>
<div class="header_txt">
Detailed Audit Report <span id="msg" ></span><span style="float:right"><a href="Welcome.jsp">Home Page</a></span>
</div>

  
    <% 
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost:3306/uil_callcenter";
    final String user="root";
    final String pass="password";
    
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet result = null;
    JSONArray array =  new JSONArray();
    JSONObject obj = new JSONObject(); 
    int numRows, numCols;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url,user,pass);
        String query;  
        query = "SELECT * FROM auditheaderdata where zcid = ? AND callDate BETWEEN ? AND ?";
        pst = con.prepareStatement(query);
        int zcid = Integer.parseInt(request.getParameter("zcentrixid"));  
        String from_date = (request.getParameter("from_date"));
        String to_date = (request.getParameter("to_date"));
        pst.setInt(1,zcid);
        pst.setString(2,from_date);
        pst.setString(3,to_date);   
        
        result = pst.executeQuery(); 
        System.out.println("ResultSet->"+result);
        if(result.next() == false){
        	System.out.println("No Result");
		}else{
			 %>
			 <div style="width:auto" >
				<table id="report" style="width:auto">
				<tr><th>SNo</th>
				<th>ZCentrix Id</th>
				<th>Name</th>
				<th> TL </th>
				<th>Date of Activity</th>
				<th>Call Type</th>
				<th>Campaign</th>
				<th>Desk Type</th>
				<th>Complain Id</th>
				<th>Contact</th>
				<th>Call Date</th>
				<th>Call Duration</th>
				<th>Product</th>
				<th>Agent Score</th>
				<th>Total Score</th></tr>
				<%
			do{      				
			
				%>
				
				<tr><td><%= result.getString("srno") %></td>
				<td><%= result.getString("zcid") %></td>
				<td><%= result.getString("tl")%></td>
				<td><%= result.getString("Name") %></td>
				<td><%= result.getString("doa") %></td>
				<td><%= result.getString("callType") %></td>
				<td><%= result.getString("campaign") %></td>
				<td><%= result.getString("deskType") %></td>
				<td><%= result.getString("ComplainId") %></td>
				<td><%= result.getString("Contact") %></td>
				<td><%= result.getString("callDate") %></td>
				<td><%= result.getString("callDur") %></td>
				<td><%= result.getString("pdt") %></td>
				<td><%= result.getString("AgentScore") %></td>
				<td><%= result.getString("TotalScore") %></td>
				</tr>
				
		
		        <% 
            }while(result.next());           
      
		%>
		</table>
				</div>
				<%
		}     
        
        
		
	}//end of try
    catch (SQLException e) {
    	System.out.println(e);
    }
    %>


</body>
</html>