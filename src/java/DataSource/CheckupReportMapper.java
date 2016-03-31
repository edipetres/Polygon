/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.CheckupReport;
import Domain.Customer;
import Domain.Employee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minerva
 */
public class CheckupReportMapper {
    
    public List<CheckupReport> getActiveReports(Connection con){
        ArrayList<CheckupReport> reports = new ArrayList<>();
        String sql = "select creport_id, reportStatus, street, zip, size, Customer.fname, Customer.lname, company_name, Employee.fname, Employee.lname from CheckupReport "
                    + "join Building ON Building.building_id=CheckupReport.building_id "
                    + "join Customer ON Customer.customer_id=Building.customer_id "
                    + "join Employee ON Employee.emp_id=CheckupReport.employee_id "
                    + "where reportStatus='active'";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                    Building b = new Building(
                    rs.getString("street"),
                    rs.getInt("size"),
                    rs.getInt("zip"));
                    Customer c = new Customer(
                    rs.getString("company_name"),
                    rs.getString("fname"),
                    rs.getString("lname")
                    );
                    Employee e = new Employee(
                    rs.getString("fname"),
                    rs.getString("lname")
                    );
                    CheckupReport cr = new CheckupReport(
                    rs.getInt("creport_id"),
                    b,
                    c,
                    e,
                    rs.getString("reportStatus")
                    );
                    reports.add(cr);
                    System.out.println(cr);
                }
            
            return reports;
        } catch (Exception e) {
            System.out.println("Problem in CustomerMapper ");
            System.out.println(e.getMessage());
            return null;
        }
    }
    public boolean createCheckupReport(int building_id, Connection con) {
        boolean result = false;
        String sqlString = "INSERT INTO CheckupReport(building_id, checkDate, reportStatus) "
                + "VALUES (?, current_date(),'pending') ";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setInt(1, building_id);

            stmt.execute();
            stmt.close();
            result = true;
        } catch (SQLException ex) {
            result = false;
            System.out.println("Exception in CheckupReportMapper. ex = " + ex);
        }
        return result;
    }
    
     public boolean updateCheckupReport(CheckupReport cr, Connection con) {
        boolean result = false;
        String sqlString = "UPDATE CheckupReport  "
                + "SET checkDate=current_date(), condition_level=?, reportStatus='done', comments=? "
                + "WHERE creport_id=?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setInt(1, cr.getCondition_level());
            stmt.setString(2, cr.getComments());
            stmt.setInt(3, cr.getCreport_id());

            stmt.execute();
            stmt.close();
            result = true;
        } catch (SQLException ex) {
            result = false;
            System.out.println("Exception in CheckupReportMapper. ex = " + ex);
        }
        return result;
    }
}
