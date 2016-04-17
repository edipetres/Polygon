/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minerva
 */
public class EmployeeMapper {
    public List<Employee> viewAllEmployees(Connection con){
        ArrayList<Employee> employees = new ArrayList<>();
        String sql = "SELECT * FROM Employee";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                    Employee e = new Employee(
                    rs.getString("fname"),
                    rs.getString("lname"),
                    rs.getInt("emp_id")
                    );
                    employees.add(e);
                }
            
            return employees;
        } catch (Exception e) {
            System.out.println("Problem in EmployeeMapper ");
            System.out.println(e.getMessage());
            return null;
        }
        
    }
}
