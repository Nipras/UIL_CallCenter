<%@page import="java.sql.*" %>;
<%@page import="org.json.*" %>;
<%@page import="com.usha.Dao.AuditFormDao.*" %>;
<%@page import="com.usha.Model.*" %>;
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
    	System.out.println("Inside Controller");			
		AuditFormHeader dataHeader = new AuditFormHeader();
		AuditScoreIbd ibdScore = new AuditScoreIbd();
		AuditScoreObd obdScore = new AuditScoreObd();
		dataHeader.setZcentrixid(Integer.parseInt(request.getParameter("zcentrixid")));
		dataHeader.setAname(request.getParameter("aname"));
		dataHeader.setCall_date(request.getParameter("call_date"));		
		dataHeader.setCall_duration(request.getParameter("call_duration"));
		dataHeader.setCall_time(request.getParameter("call_time"));
		dataHeader.setCall_type(request.getParameter("call_type"));
		dataHeader.setCampaign(request.getParameter("campaign"));
		dataHeader.setComplain_id(request.getParameter("complain_id"));
		dataHeader.setContact_num(request.getParameter("contact_num"));
		dataHeader.setDesk_type(request.getParameter("desk_type"));
		dataHeader.setDoa(request.getParameter("doa"));		
		AuditFormDao dao = new AuditFormDao();		
		if (request.getParameter("desk_type").equalsIgnoreCase("In-Bound") ){
			ibdScore.setFatal_a(request.getParameter("7a"));
			ibdScore.setFatal_b(request.getParameter("7b"));
			ibdScore.setFatal_c(request.getParameter("7c"));
			ibdScore.setFatal_d(request.getParameter("7d"));
			ibdScore.setFive_a(Integer.parseInt(request.getParameter("5a")));
			ibdScore.setFour_a(Integer.parseInt(request.getParameter("4a")));
			ibdScore.setFour_b(Integer.parseInt(request.getParameter("4b")));
			ibdScore.setFour_c(Integer.parseInt(request.getParameter("4c")));
			ibdScore.setFour_d(Integer.parseInt(request.getParameter("4d")));
			ibdScore.setOne_a(Integer.parseInt(request.getParameter("1a")));
			ibdScore.setOne_b(Integer.parseInt(request.getParameter("1b")));
			ibdScore.setTwo_a(Integer.parseInt(request.getParameter("2a")));
			ibdScore.setTwo_b(Integer.parseInt(request.getParameter("2b")));
			ibdScore.setTwo_c(Integer.parseInt(request.getParameter("2c")));
			ibdScore.setThree_a(Integer.parseInt(request.getParameter("3a")));
			ibdScore.setThree_b(Integer.parseInt(request.getParameter("3b")));
			ibdScore.setThree_c(Integer.parseInt(request.getParameter("3c")));
			ibdScore.setThree_d(Integer.parseInt(request.getParameter("3d")));
			ibdScore.setThree_e(Integer.parseInt(request.getParameter("3e")));
			ibdScore.setThree_f(Integer.parseInt(request.getParameter("3f")));
			ibdScore.setSix_a(Integer.parseInt(request.getParameter("6a")));		
			ibdScore.setZero_a(request.getParameter("0a"));
			ibdScore.setZero_b(Integer.parseInt(request.getParameter("0b")));
			ibdScore.setZero_c(Integer.parseInt(request.getParameter("0c")));
			ibdScore.setZero_d(Integer.parseInt(request.getParameter("0d")));						
			dao.insertData(dataHeader,ibdScore);
		}else{
			obdScore.setFatal_a(request.getParameter("7a"));
			obdScore.setFatal_b(request.getParameter("7b"));
			obdScore.setFatal_c(request.getParameter("7c"));
			obdScore.setFatal_d(request.getParameter("7d"));
			obdScore.setFive_a(Integer.parseInt(request.getParameter("5a")));
			obdScore.setFour_a(Integer.parseInt(request.getParameter("4a")));
			obdScore.setFour_b(Integer.parseInt(request.getParameter("4b")));
			obdScore.setFour_c(Integer.parseInt(request.getParameter("4c")));			
			obdScore.setOne_a(Integer.parseInt(request.getParameter("1a")));
			obdScore.setOne_b(Integer.parseInt(request.getParameter("1b")));
			//obdScore.setOne_c(Integer.parseInt(request.getParameter("1c")));
			//obdScore.setOne_d(Integer.parseInt(request.getParameter("1d")));
			obdScore.setTwo_a(Integer.parseInt(request.getParameter("2a")));
			obdScore.setTwo_b(Integer.parseInt(request.getParameter("2b")));
			obdScore.setTwo_c(Integer.parseInt(request.getParameter("2c")));
			obdScore.setThree_a(Integer.parseInt(request.getParameter("3a")));
			obdScore.setThree_b(Integer.parseInt(request.getParameter("3b")));
			obdScore.setThree_c(Integer.parseInt(request.getParameter("3c")));
			obdScore.setThree_d(Integer.parseInt(request.getParameter("3d")));
			obdScore.setThree_e(Integer.parseInt(request.getParameter("3e")));
			obdScore.setThree_f(Integer.parseInt(request.getParameter("3f")));
			obdScore.setSix_a(Integer.parseInt(request.getParameter("6a")));		
			obdScore.setZero_a(request.getParameter("0a"));
			obdScore.setZero_b(Integer.parseInt(request.getParameter("0b")));
			obdScore.setZero_c(Integer.parseInt(request.getParameter("0c")));
			obdScore.setZero_d(Integer.parseInt(request.getParameter("0d")));			
			dao.insertData(dataHeader,obdScore);
		}
	
		//request.getRequestDispatcher("JSP/Create.jsp?success=Y").forward(request, response);
		//response.sendRedirect("JSP/Create.jsp");
		response.setContentType("text/plain");
        response.getWriter().write("Success");
        response.getWriter().flush(); 
        response.getWriter().close();
		
	      
    }catch(Exception e){
       System.out.println(e);
    }

%>
