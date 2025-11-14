package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBS.Dbs;
import com.Pojo.Employee;

/**
 * Servlet implementation class GetEmployess
 */
@WebServlet("/GetEmployees")
public class GetEmployees extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Employee> list = null;
		Dbs db = new Dbs();
		list = db.getEmployees();
		if(list != null) {
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/Emp_List.jsp");
			rd.forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/Emp_list_Empty.jsp");
			rd.forward(request, response);
		}
	}

}
