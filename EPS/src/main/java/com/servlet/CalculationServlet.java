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
import com.Pojo.Salary;

/**
 * Servlet implementation class CalculationServlet
 */
@WebServlet("/CalculationServlet")
public class CalculationServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String empID = (String)request.getParameter("empID");
			System.out.println(empID);
			Dbs db = new Dbs();
			int BasicPay = 0;
			Employee e = db.getEmployee(empID);
			BasicPay = e.getBasicPay();
			
			float hra = BasicPay*0.32f;
			float da = BasicPay*0.25f;
			float ca = BasicPay*0.075f;
			float ma = BasicPay*0.035f;
			
			float pf = BasicPay*0.12f;
			float pt = BasicPay*0.02f;
			float tds = 0;
			
			if(BasicPay <= 20000) {
				tds = 0;
			}
			else if(BasicPay > 20000 && BasicPay <= 50000) {
				tds = BasicPay*0.075f;
			}
			else if(BasicPay > 50000 && BasicPay <= 75000) {
				tds = BasicPay*0.15f;
			}
			else if(BasicPay > 75000 && BasicPay <= 100000) {
				tds = BasicPay*0.25f;
			}
			else if(BasicPay > 100000) {
				tds = BasicPay*0.30f;
			}
			
			float Gs = (hra + da + ca + ma + BasicPay) - (pf + pt + tds);
			
			Salary s = new Salary();
			s.setBasicPay(BasicPay);
			s.setCa(ca);
			s.setDa(da);
			s.setGs(Gs);
			s.setHra(hra);
			s.setMa(ma);
			s.setPf(pf);
			s.setPt(pt);
			s.setTds(tds);
			
			request.setAttribute("salary", s);
			request.setAttribute("emp", e);
			RequestDispatcher rd = request.getRequestDispatcher("/Payslip.jsp");
			rd.forward(request, response);
	}

}
