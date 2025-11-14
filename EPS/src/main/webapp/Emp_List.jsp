<%@page import="com.Pojo.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Employee Records — Employee Payroll System</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="brand">
        <div class="logo">EPS</div>
        <div>
          <div class="title">Employee Payroll System</div>
          <div class="subtitle">Manage employees & calculate salaries</div>
        </div>
      </div>
      <div class="actions">
        <a class="btn" href="GetEmployees">Employee List</a>
        <a class="btn primary" href="AddEmployee.jsp">Add Employee</a>
      </div>
    </div>

    <div class="card">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:12px">
        <div style="display:flex;gap:12px;align-items:center">
        <%List<Employee> list = (List<Employee>)request.getAttribute("list"); %>
          <div class="badge"><%=list.size() %> record</div>
          <div class="small">Showing <%=list.size() %> of <%=list.size() %> employees</div>
        </div>
        <div>
          <a class="link-like" href="AddEmployee.jsp">+ Add Employee</a>
        </div>
      </div>

      <table class="table">
        <thead>
          <tr>
            <th>Employee</th>
            <th>Designation</th>
            <th>Joined</th>
            <th>Salary (Basic)</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <% 
        
        for(int i = 0; i<list.size(); i++){
        	Employee emp = list.get(i);
        	%>
          <tr>
            <td>
              <div class="name-row">                
                <div>
                  <div style="font-weight:700"><%=emp.getName()%></div>
                  <div class="small">Employee ID: <%=emp.getEmpID()%></div>
                </div>
              </div>
            </td>
            <td><%=emp.getDesg()%></td>
            <td><%=emp.getJoinDate()%></td>
            <td>₹ <%=emp.getBasicPay()%></td>
            <td style="text-align:right">
            	<% request.setAttribute("empID", emp.getEmpID()); %>
              <a class="btn" href="CalculationServlet?empID=<%= emp.getEmpID() %>">View Pay Slip</a>
            </td>
          </tr>
          <%
        }
        %>
          
        </tbody>
      </table>

    </div>

    <div class="footer">Employee Payroll System - © 2025 All Rights Reserved</div>
  </div>
</body>
</html>