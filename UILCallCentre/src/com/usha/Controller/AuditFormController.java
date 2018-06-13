package com.usha.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.usha.Dao.AuditFormDao;
import com.usha.Model.AuditFormHeader;
import com.usha.Model.AuditScoreIbd;
import com.usha.Model.AuditScoreObd;

import org.json.* ;


//import javax.servlet.annotation.WebServlet;
/**
 * Servlet implementation class AuditFormController
 * @WebServlet("/AuditFormController")
 */

public class AuditFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuditFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AuditFormHeader dataHeader = new AuditFormHeader();
		AuditScoreIbd ibdScore = new AuditScoreIbd();
		AuditScoreObd obdScore = new AuditScoreObd();
		String status ;
		dataHeader.setZcentrixid(Integer.parseInt(request.getParameter("zcentrixid")));
		dataHeader.setAname(request.getParameter("aname"));
		dataHeader.setCall_date(request.getParameter("call_date").trim());		
		dataHeader.setCall_duration(request.getParameter("call_duration"));
		dataHeader.setCall_time(request.getParameter("call_time"));
		dataHeader.setCall_type(request.getParameter("call_type"));
		dataHeader.setCampaign(request.getParameter("campaign"));
		dataHeader.setComplain_id(request.getParameter("complain_id"));
		dataHeader.setContact_num(request.getParameter("contact_num"));
		dataHeader.setDesk_type(request.getParameter("desk_type"));
		dataHeader.setDoa(request.getParameter("doa"));
		dataHeader.setProduct(request.getParameter("product"));
		AuditFormDao dao = new AuditFormDao();		
		if (request.getParameter("desk_type").equalsIgnoreCase("In-Bound") ){
			ibdScore.setFatal_a(request.getParameter("7ai"));
			ibdScore.setFatal_b(request.getParameter("7bi"));
			ibdScore.setFatal_c(request.getParameter("7ci"));
			ibdScore.setFatal_d(request.getParameter("7di"));
			ibdScore.setFive_a(Integer.parseInt(request.getParameter("5ai")));
			ibdScore.setFour_a(Integer.parseInt(request.getParameter("4ai")));
			ibdScore.setFour_b(Integer.parseInt(request.getParameter("4bi")));
			ibdScore.setFour_c(Integer.parseInt(request.getParameter("4ci")));
			ibdScore.setFour_d(Integer.parseInt(request.getParameter("4di")));
			ibdScore.setOne_a(Integer.parseInt(request.getParameter("1ai")));
			ibdScore.setOne_b(Integer.parseInt(request.getParameter("1bi")));
			ibdScore.setTwo_a(Integer.parseInt(request.getParameter("2ai")));
			ibdScore.setTwo_b(Integer.parseInt(request.getParameter("2bi")));
			ibdScore.setTwo_c(Integer.parseInt(request.getParameter("2ci")));
			ibdScore.setThree_a(Integer.parseInt(request.getParameter("3ai")));
			ibdScore.setThree_b(Integer.parseInt(request.getParameter("3bi")));
			ibdScore.setThree_c(Integer.parseInt(request.getParameter("3ci")));
			ibdScore.setThree_d(Integer.parseInt(request.getParameter("3di")));
			ibdScore.setThree_e(Integer.parseInt(request.getParameter("3ei")));
			ibdScore.setThree_f(Integer.parseInt(request.getParameter("3fi")));
			ibdScore.setSix_a(Integer.parseInt(request.getParameter("6ai")));		
			ibdScore.setZero_a(request.getParameter("0ai"));
			ibdScore.setZero_b(Integer.parseInt(request.getParameter("0bi")));
			ibdScore.setZero_c(Integer.parseInt(request.getParameter("0ci")));
			ibdScore.setZero_d(Integer.parseInt(request.getParameter("0di")));						
			status = dao.insertData(dataHeader,ibdScore);
		}else{
			obdScore.setFatal_a(request.getParameter("7ao"));
			obdScore.setFatal_b(request.getParameter("7bo"));
			obdScore.setFatal_c(request.getParameter("7co"));
			obdScore.setFatal_d(request.getParameter("7do"));
			obdScore.setFive_a(Integer.parseInt(request.getParameter("5ao")));
			obdScore.setFour_a(Integer.parseInt(request.getParameter("4ao")));
			obdScore.setFour_b(Integer.parseInt(request.getParameter("4bo")));
			obdScore.setFour_c(Integer.parseInt(request.getParameter("4co")));			
			obdScore.setOne_a(Integer.parseInt(request.getParameter("1ao")));
			obdScore.setOne_b(Integer.parseInt(request.getParameter("1bo")));
			obdScore.setOne_c(Integer.parseInt(request.getParameter("1co")));
			obdScore.setOne_d(Integer.parseInt(request.getParameter("1do")));
			obdScore.setTwo_a(Integer.parseInt(request.getParameter("2ao")));
			obdScore.setTwo_b(Integer.parseInt(request.getParameter("2bo")));
			obdScore.setTwo_c(Integer.parseInt(request.getParameter("2co")));
			obdScore.setThree_a(Integer.parseInt(request.getParameter("3ao")));
			obdScore.setThree_b(Integer.parseInt(request.getParameter("3bo")));
			obdScore.setThree_c(Integer.parseInt(request.getParameter("3co")));
			obdScore.setThree_d(Integer.parseInt(request.getParameter("3do")));
			obdScore.setThree_e(Integer.parseInt(request.getParameter("3eo")));
			obdScore.setThree_f(Integer.parseInt(request.getParameter("3fo")));
			obdScore.setSix_a(Integer.parseInt(request.getParameter("6ao")));		
			obdScore.setZero_a(request.getParameter("0ao"));
			obdScore.setZero_b(Integer.parseInt(request.getParameter("0bo")));
			obdScore.setZero_c(Integer.parseInt(request.getParameter("0co")));
			obdScore.setZero_d(Integer.parseInt(request.getParameter("0do")));			
			status = dao.insertData(dataHeader,obdScore);
		}
		response.setContentType("text/html;charset=UTF-8");		
		PrintWriter out = response.getWriter();
		out.write(status);
		

		
	}

}
