<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Employee List — Employee Payroll System</title>
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
        <a class="btn" href="Emp_List.jsp">Employee List</a>
        <a class="btn primary" href="AddEmployee.jsp">Add Employee</a>
      </div>
    </div>

    <div class="card empty-state">
      <h2 style="margin:0 0 8px 0">No employees added yet</h2>
      <p style="margin:0 0 18px 0;color:var(--muted)">Start by adding your first employee to manage payroll and generate payslips.</p>
      <a class="btn primary" href="AddEmployee.jsp">Add Employee</a>
    </div>

    <div class="footer">Employee Payroll System - © 2025 All Rights Reserved</div>
  </div>
</body>
</html>