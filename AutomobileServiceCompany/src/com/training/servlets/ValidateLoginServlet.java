package com.training.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.classes.ServiceDAOImpl;
import com.training.ifaces.DAO;


/**
 * Servlet implementation class ValidateLoginServlet
 */
public class ValidateLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispathcher;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao=new ServiceDAOImpl();
		String regNum=request.getParameter("carNumberPlateNum");
		HttpSession session=request.getSession();
		session.setAttribute("regNum", regNum);
		int exists=0;
		try {
			exists=dao.checkExistence(regNum);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		if(exists==1) {
			dispathcher=request.getRequestDispatcher("custExists.jsp");
		}
		else {
			dispathcher=request.getRequestDispatcher("addCustDetails.jsp");
		}
		dispathcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao=new ServiceDAOImpl();
		String checkPassword=null;
		int rowAdded=0;
		HttpSession session=request.getSession();
		
		String checkRequest=(String) session.getAttribute("checkRequest");
		String userName=request.getParameter("empUserName");
		String password=request.getParameter("empPassword");
		
		if(checkRequest.equals("Login")) {
		try {
			checkPassword=dao.validateCredential(userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(password.equals(checkPassword)) {
			
			dispathcher=request.getRequestDispatcher("form1.jsp");
			
		}
		
		else {
			request.setAttribute("msg","Login Unsuccessfull!! Please enter valid credentials and Try Again!");
			dispathcher=request.getRequestDispatcher("index.jsp");
			
		}
		}
		
		
		if(checkRequest.equals("Register")) {
			try {
				rowAdded=dao.empRegister(userName, password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(rowAdded==1) {
				request.setAttribute("msg","Registration Successfull!!");
				dispathcher=request.getRequestDispatcher("register.jsp");
			}
			else {
				request.setAttribute("msg","Registration Unsuccessfull!! Try Again!!");
				dispathcher=request.getRequestDispatcher("register.jsp");
			}
		}
		dispathcher.forward(request,response);
	}

}
