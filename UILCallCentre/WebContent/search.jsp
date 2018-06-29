<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>;
<%@page import="java.lang.*" %>;
<%@page import="org.json.*" %>;



<% 
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost:3306/uil_callcenter";
    final String user="root";
    final String pass="password";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
    JSONArray array =  new JSONArray();
    JSONObject obj = new JSONObject(); 
    int numRows, numCols;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url,user,pass);
        String query;        
        stmt = con.createStatement();
        String zcid =(request.getParameter("zcid"));  
        String from_date = (request.getParameter("from_date"));
        String to_date = (request.getParameter("to_date"));
        query = "SELECT * FROM auditheaderdata where zcentrixid = " +zcid +
        		"AND callDate BETWEEN"+ from_date + "AND" +to_date;
        result = stmt.executeQuery(query); 
        if(result.next() == false){
        	System.out.println("No Result");
		}else{
			do{      				
				numRows = result.getRow();
				numCols = result.getMetaData().getColumnCount();
				System.out.println(numRows + " " + numCols); 
				String arr[][]=new String[numRows][numCols];
	            //populate array using a for loop
	        	for (int i=0; i < numRows; i++)
	    		{
	    			for (int j=0; j < numCols; j++)
	    			{
	    				arr[i][j] = result.getString(i);
	    				System.out.println (arr[i][j]);
	    				};
	    		}
            }while(result.next());           
         
		}     
	}
    catch (SQLException e) {
    	System.out.println(e);
    }
    
%>