package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBS.Dbs;
import com.Pojo.Employee;

/**
 * Servlet implementation class SaveEmployee
 */
@WebServlet("/SaveEmployee")
public class SaveEmployee extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String EmpID = request.getParameter("EmpID");
		String desg = request.getParameter("desg");
		String date = request.getParameter("jd");
		System.out.println(request.getParameter("BasicPay"));
		int basicPay = Integer.parseInt(request.getParameter("BasicPay"));
		
		Employee e = new Employee();
		e.setName(name);
		e.setEmpID(EmpID);
		e.setDesg(desg);
		e.setBasicPay(basicPay);
		e.setJoinDate(date);
		
		Dbs db = new Dbs();
//		System.out.println();
		
		if(db.addEmployee(e)) {		
			RequestDispatcher rd = request.getRequestDispatcher("/GetEmployees");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("err", "Data not Saved");
			RequestDispatcher rd = request.getRequestDispatcher("/AddEmployee.jsp");
			rd.forward(request, response);
		}
	}
}
