# EPS — Employee Payroll System

## Project summary

A small college DBMS project: a Java web application (Servlets + JSP) that manages employee records and generates payslips (salary calculations). It uses plain JDBC to talk to a MySQL database and JSP pages for UI. The project was created in Eclipse and targets Tomcat (or any Java EE servlet container).

---

## Technology stack

* Java (Servlets, JSP)
* JDBC (MySQL Connector/J)
* MySQL (database)
* HTML/CSS (JSP pages under `webapp`)
* Build / IDE: Eclipse (classic Dynamic Web Project structure)

---

## Main features

* Add new employee (form -> `SaveEmployee` servlet -> DB)
* View all employees (lists via `GetEmployees` servlet -> `Emp_List.jsp`)
* View empty list placeholder (`Emp_list_Empty.jsp`)
* Calculate salary & generate payslip (`CalculationServlet` -> `Payslip.jsp`)
* Simple POJOs for `Employee` and `Salary` to pass data between layers
* Database utility class `com.DBS.Dbs` with methods to insert, fetch and query employee records

---

## Where things live (important files)

```
EPS/
 ├─ src/main/java/com/DBS/Dbs.java           # JDBC connection + DB operations (add, list, get by id)
 ├─ src/main/java/com/Pojo/Employee.java    # Employee model (name, empID, desg, joinDate, basicPay)
 ├─ src/main/java/com/Pojo/Salary.java      # Salary model (hra, ma, pf, tds, gross, net etc)
 ├─ src/main/java/com/servlet/SaveEmployee.java    # Handles /SaveEmployee POST from AddEmployee.jsp
 ├─ src/main/java/com/servlet/GetEmployees.java    # Handles /GetEmployees GET to list employees
 ├─ src/main/java/com/servlet/CalculationServlet.java # Handles salary calculation, forwards to Payslip.jsp
 └─ src/main/webapp/                            # JSP pages and CSS
     ├─ AddEmployee.jsp
     ├─ Emp_List.jsp
     ├─ Emp_list_Empty.jsp
     ├─ Payslip.jsp
     └─ css/style.css
```

---

## Database (quick setup)

Run these statements in MySQL (or adapt types to your preferences):

```sql
CREATE DATABASE IF NOT EXISTS dbms_project;
USE dbms_project;

CREATE TABLE IF NOT EXISTS employee (
  Name VARCHAR(100),
  EmpID VARCHAR(50) PRIMARY KEY,
  Designation VARCHAR(100),
  Joining_Date DATE,
  Basic_Pay INT
);
```

Notes:

* The code in `com.DBS.Dbs` expects a database named `dbms_project` on `localhost:3306` using username `root` and password `root`. Edit the `DriverManager.getConnection(...)` call in `Dbs.java` if you use different credentials.

---

## How to run (Eclipse / Tomcat)

1. Import the `EPS` directory into Eclipse as an "Existing Maven/Java / Dynamic Web Project" (project already contains Eclipse metadata).
2. Add MySQL JDBC driver (mysql-connector-java) to the project's `WEB-INF/lib` (or add as Maven dependency). The project has a `WEB-INF/lib` folder—ensure the connector jar is present.
3. Create the `dbms_project` database and `employee` table (see SQL above).
4. Update DB credentials in `com.DBS.Dbs` if needed.
5. Run the project on Tomcat (right-click project -> Run As -> Run on Server).
6. Open these URLs (assuming context root `/EPS`):

   * `http://localhost:8080/EPS/AddEmployee.jsp` — add new employee
   * `http://localhost:8080/EPS/GetEmployees` — view list
   * Fill employee then use calculation form to generate payslip (UI flow is implemented in JSPs)

---

## Key-file walkthrough (important lines & behavior)

Below are short, line-oriented explanations for the primary Java files. This is not a literal line-by-line dump of every single line, but it highlights every code block and important statements so you can quickly understand, modify, or extend the project.

### `com.DBS.Dbs` (database helper)

* `Class.forName("com.mysql.cj.jdbc.Driver");` — loads the MySQL JDBC driver.
* `DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project","root","root");` — establishes a DB connection; change credentials if necessary.
* `addEmployee(Employee e)` — prepares SQL `INSERT` (parameterised), sets values from the `Employee` POJO, executes `executeUpdate()` and returns `true` if insert succeeded.
* `getEmployees()` — executes `SELECT * FROM employee` (or similar), iterates `ResultSet`, maps each row into `Employee` objects, returns `List<Employee>` for the servlet to forward to JSP.
* `getEmployeeById(String id)` — executes `SELECT ... WHERE EmpID=?` and returns a single `Employee` or `null`.

Why it's important:

* All DB operations are concentrated here; to change DB engine or schema you only need to edit this class.
* Uses `PreparedStatement` to avoid SQL injection for parameter values.

### `com.Pojo.Employee` & `com.Pojo.Salary`

* Simple JavaBeans with private fields, getters/setters, and possibly a `toString()`.
* `Employee` fields: `name`, `empID`, `desg`, `joinDate`, `basicPay`.
* `Salary` fields: derived values like `hra`, `ma`, `pf`, `pt`, `tds`, `gross`, `net`, `gs`(gross salary).

### `com.servlet.SaveEmployee` (`@WebServlet("/SaveEmployee")`)

* Reads form parameters from `HttpServletRequest` (`request.getParameter("...")`).
* Instantiates `Employee` POJO and populates fields.
* Calls `new Dbs().addEmployee(e)`.
* On success forwards to `/GetEmployees` (server-side forward), otherwise forwards back to `AddEmployee.jsp` with an error attribute.

### `com.servlet.GetEmployees` (`@WebServlet("/GetEmployees")`)

* Calls `new Dbs().getEmployees()` to get list.
* If list empty, forwards to `Emp_list_Empty.jsp` else sets attribute `employees` and forwards to `Emp_List.jsp`.

### `com.servlet.CalculationServlet` (`@WebServlet("/CalculationServlet")` or similar)

* Reads employee ID or basic pay from request.
* Performs arithmetic for components (example: HRA = basic * 0.2, PF = basic * 0.12 — follow the existing formula in code)
* Builds a `Salary` POJO, sets attributes `salary` and `emp` on the request and forwards to `Payslip.jsp` to render the payslip.

---

## What you can do (suggestions for improvements / extensions)

* Move DB credentials to a properties file (`config.properties`) or environment variables.
* Add validation on server-side (and client-side) for inputs (non-empty, numeric checks for salary)
* Use MVC framework (Spring Boot) for cleaner separation and easier deployment.
* Add authentication (simple login) so only authenticated users can add/view salaries.
* Add unit tests for `Dbs` methods (use an in-memory DB like H2 for tests).
* Use PreparedStatement transaction management for multi-step operations.
* Add logging (SLF4J + Logback) in place of `System.out.println`.

---

## Troubleshooting

* If `ClassNotFoundException` for MySQL driver — ensure `mysql-connector-java.jar` is in `WEB-INF/lib`.
* `Communications link failure` — check DB server running and the port, user credentials.
* `HTTP 404` — check project context path and mapping annotations; try `http://localhost:8080/EPS/` and the JSP names.

---

## License & Credits

This appears to be a college project distributed as-is. Before reusing or publishing, validate any licensing requirements with the original author.

---
