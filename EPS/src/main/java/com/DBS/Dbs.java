package com.DBS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Pojo.Employee;

public class Dbs {
	
	Connection con = null;
	public Dbs(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbms_project",
					"root","root");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: Database Connection not Established");
		}
	}
	
	public boolean addEmployee(Employee e) {
		boolean b = false;
		try {
			PreparedStatement ps = con.prepareStatement("insert into employee value(?,?,?,?,?)");
			ps.setString(1, e.getName());
			ps.setString(2, e.getEmpID());
			ps.setString(3, e.getDesg());
			ps.setString(4, e.getJoinDate());
			ps.setInt(5, e.getBasicPay());
			
			int count = ps.executeUpdate();
			if(count > 0) {
				b = true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			System.out.println("Error: Employee data is not saved");
			e1.printStackTrace();
		}
		return b;
	}
	
	public List<Employee> getEmployees (){
		List<Employee> l = new ArrayList<Employee>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from Employee");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Employee e = new Employee();
				e.setName(rs.getString(1));
				e.setEmpID(rs.getString(2));
				e.setDesg(rs.getString(3));
				e.setJoinDate(rs.getString(4));
				e.setBasicPay(rs.getInt(5));
				l.add(e);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Error: Cannot Fetch Data");
		}
		return l;
	}
	public Employee getEmployee (String id){
		Employee emp = null;
		try {
			PreparedStatement ps = con.prepareStatement("select * from Employee where EmpID = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				Employee e = new Employee();
				e.setName(rs.getString("Name"));
				e.setEmpID(rs.getString("EmpID"));
				e.setDesg(rs.getString("Designation"));
				e.setJoinDate(rs.getString("Joining_Date"));
				e.setBasicPay(rs.getInt("Basic_Pay"));
				emp = e;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Error: Cannot Fetch Data");
		}
		return emp;
	}
}
