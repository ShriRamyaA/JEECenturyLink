package com.training.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.training.classes.Customer;
import com.training.classes.Service;
import com.training.classes.ServiceDAOImpl;
import com.training.ifaces.DAO;

/**
 * Servlet implementation class PrintBillServlet
 */
public class PrintBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		List<Service> printList = null;
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		
		Date dateOfService = new Date();  
		String dateOfDelivery=formatter.format(dateOfService)+10;
		Calendar c = Calendar.getInstance();
        c.setTime(dateOfService);
        c.add(Calendar.DATE, 10);
        Date expectedDateOfDelivery = c.getTime();
		
        String carNumberPlateNum=(String) session.getAttribute("regNum");
		DAO dao=new ServiceDAOImpl();
		Customer customer=new Customer();
		 try {
			customer=dao.getCustDetails(carNumberPlateNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 Service service=new Service();
		 try {
			service=dao.getAmount(carNumberPlateNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 try {
			 printList=dao.getServiceDetails(carNumberPlateNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 session.setAttribute("customer",customer);
			session.setAttribute("service", service);
			session.setAttribute("printList", printList);
			session.setAttribute("expectedDateOfDelivery", expectedDateOfDelivery);
		 RequestDispatcher dispathcher=request.getRequestDispatcher("lastBill.jsp");
		 dispathcher.forward(request,response);
		
		
		
		
	}

}
