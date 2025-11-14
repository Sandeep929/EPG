<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Add Employee — Employee Payroll System</title>
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
      <h3 style="margin-top:0">Add Employee Details</h3>
      <form action = "SaveEmployee" method="get">
        <div class="form-grid">
          <div>
            <label class="small">Full name</label>
            <input class="input" type="text" name = "name" placeholder="e.g. Saksham Nayak">
          </div>
          <div>
            <label class="small">Employee ID</label>
            <input class="input" type="text" name = "EmpID" placeholder="e.g. 0808CS23">
          </div>
        </div>

        <div class="form-grid" style="margin-top:12px">
          <div>
            <label class="small">Designation</label>
            <!-- <input class="input" type="text" placeholder="e.g. Software Engineer"> -->
            <input class="input" list="it-designations-list" name="desg" id="it-designation"
              placeholder="e.g., Software Engineer">

            <datalist id="it-designations-list">
              <option value="IT Manager"></option>
              <option value="IT Support Specialist"></option>
              <option value="Systems Administrator"></option>
              <option value="Network Administrator"></option>
              <option value="Cloud Engineer"></option>

              <!-- Software Development -->
              <option value="Software Engineer"></option>
              <option value="Junior Software Developer"></option>
              <option value="Senior Software Engineer"></option>
              <option value="Full Stack Developer"></option>
              <option value="Front-End Developer"></option>
              <option value="Back-End Developer"></option>
              <option value="Mobile App Developer"></option>
              <option value="Technical Lead"></option>
              <option value="Solutions Architect"></option>

              <!-- Data & Analytics -->
              <option value="Data Analyst"></option>
              <option value="Data Scientist"></option>
              <option value="Data Engineer"></option>
              <option value="Database Administrator (DBA)"></option>
              <option value="Business Intelligence (BI) Analyst"></option>

              <!-- Project & Product Management -->
              <option value="Project Manager"></option>
              <option value="Technical Project Manager"></option>
              <option value="Scrum Master"></option>
              <option value="Product Manager"></option>
              <option value="Program Manager"></option>

              <!-- Cybersecurity -->
              <option value="Cybersecurity Analyst"></option>
              <option value="Information Security Analyst"></option>
              <option value="Network Security Engineer"></option>

              <!-- Quality Assurance & DevOps -->
              <option value="QA Automation Engineer"></option>
              <option value="DevOps Engineer"></option>
              <option value="Site Reliability Engineer (SRE)"></option>

              <!-- Leadership -->
              <option value="Chief Technology Officer (CTO)"></option>
              <option value="Chief Information Officer (CIO)"></option>
            </datalist>
          </div>
          <div>
            <label class="small">Joining Date</label>
            <input class="input" type="date" name = "jd">
          </div>
        </div>

        <div style="margin-top:12px">
          <label class="small">Monthly Basic Salary (INR)</label>
          <input class="input" type="number" name = "BasicPay" placeholder="e.g. 45000">
        </div>

        <div class="form-actions">
          <a class="btn" href="Emp_List.jsp">Cancel</a>
          <button type = "submit" class="btn primary">Save Employee</button>
        </div>
      </form>
    </div>

    <div class="footer">Employee Payroll System - © 2025 All Rights Reserved</div>
  </div>
</body>

</html>