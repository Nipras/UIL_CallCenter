package com.usha.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.usha.Dao.LoginDao;
import java.lang.*;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int usrid = 0 ;
		String empid = request.getParameter("empid");

		String pass = request.getParameter("pass");			
		LoginDao dao = new LoginDao();
		if (empid != null ){
		usrid = Integer.parseInt(empid);
		} 		
		if(dao.check(usrid, pass)){
			String name = dao.getName(usrid);

			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			request.getRequestDispatcher("JSP/Welcome.jsp").forward(request, response);
			//response.sendRedirect("JSP/Welcome.jsp");
		}else{

			request.getRequestDispatcher("JSP/LoginE.jsp").forward(request, response);
			//response.sendRedirect("JSP/LoginE.jsp");
		}
		
	}

}
