<%@page import="java.sql.*" %>;
<%@page import="org.json.*" %>;
<%@page contentType="application/json; charset=UTF-8"%>

<% 
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost:3306/uil_callcenter";
    final String user="root";
    final String pass="root@1234A";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
    JSONArray array =  new JSONArray();
    JSONObject obj = new JSONObject();    
    try{
        Class.forName(jdbcdriver);
        con = DriverManager.getConnection(url,user,pass);
        String query;        
        stmt = con.createStatement();
        int id = Integer.parseInt(request.getParameter("input"));        
        query = "SELECT * FROM agentdtl where empid="+id;
        result = stmt.executeQuery(query);               
        if(result.next() == false){
        	out.print("0");
		}else{
			 
			do{      				
               obj.put("Name",result.getString("empName"));
               obj.put("Tl",result.getString("tlName"));               
               array.put(obj);
            }while(result.next());           
         
          
		}     
        stmt.close();
        con.close();
        response.setContentType("application/json");
        response.getWriter().write(array.toString());
        response.getWriter().flush(); 
        response.getWriter().close();       
    }catch(Exception e){
       System.out.println(e);
    }

%>
