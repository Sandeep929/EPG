<%@page import="com.Pojo.Salary"%>
<%@page import="com.Pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <% Employee e = (Employee)request.getAttribute("emp"); %>
  <title>Payslip — <%=e.getName() %></title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    /* small print-friendly tweaks for payslip */
    @media print{
      body{background:white}
      .container{max-width:800px;margin:0;padding:0}
      .header,.actions{display:none}
      .payslip{border:none;border-radius:0}
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="brand">
        <div class="logo">EPS</div>
        <div>
          <div class="title">Employee Payroll System</div>
          <div class="subtitle">Pay Slip</div>
        </div>
      </div>
      <div class="actions">
        <a class="btn" href="GetEmployees">Back to List</a>
        <button class="btn primary" onclick="window.print()">Download Pay Slip</button>
      </div>
    </div>

    <div class="payslip">
      <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:18px">
        <div>
          <div style="font-weight:700"><%=e.getName() %></div>
          <div class="small">Employee ID: <%=e.getEmpID()%></div>
          <div class="small">Designation: <%=e.getDesg() %></div>
        </div>
		<%Salary s = (Salary)request.getAttribute("salary"); %>
        <div style="text-align:right">
          <div class="small">Total Salary</div>
          <div style="font-weight:700">₹ <%=s.getGs() %></div>
        </div>
      </div>
      <div style="border-top:1px solid var(--border);padding-top:12px">
        <div class="small row-between">Earnings</div>
        <div class="row-between"><div>Basic Salary</div><div>₹ <%=s.getBasicPay()%></div></div>
        <div class="row-between"><div>HRA (32%)</div><div>₹ <%=s.getHra()%></div></div>
        <div class="row-between"><div>DA (25%)</div><div>₹ <%=s.getDa()%></div></div>
        <div class="row-between"><div>Conveyance Allowances (7.5%)</div><div>₹ <%=s.getCa()%></div></div>
        <div class="row-between"><div>Medical Allowance (3.5%)</div><div>₹ <%=s.getMa()%></div></div>
    </div>
    
    <div style="border-top:1px solid var(--border);padding-top:12px">
        <div class="small row-between">Deductions</div>
        <div class="row-between"><div>Provident Fund(12%)</div><div>- ₹ <%=s.getPf()%></div></div>
        <div class="row-between"><div>Professional Tax(2%)</div><div>- ₹ <%=s.getPt()%></div></div>
        <div class="row-between"><div>Income Tax (TDS)</div><div>- ₹ <%=s.getTds()%></div></div>
        <div style="border-top:1px dashed var(--border);padding-top:10px;margin-top:10px" class="row-between total"><div>Total Salary</div><div>₹ <%=s.getGs()%></div></div>
      </div>

      <div style="margin-top:18px;text-align:right">
        <div class="small">To download: use your browser's <strong>Print → Save as PDF</strong> option.</div>
      </div>

    </div>

    <div class="footer">Employee Payroll System - © 2025 All Rights Reserved</div>
  </div>
</body>
</html>