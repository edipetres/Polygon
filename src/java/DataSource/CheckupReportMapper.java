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

    public List<CheckupReport> getActiveReports(Connection con) {
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
                        rs.getString("Employee.fname"),
                        rs.getString("Employee.lname")
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

    public List<CheckupReport> getDoneReports(Connection con) {
        ArrayList<CheckupReport> reports = new ArrayList<>();
        String sql = "select creport_id, reportStatus, checkDate, checkupreport.condition_level, comments, street, zip, size, Customer.fname, Customer.lname, company_name, Employee.fname, Employee.lname from CheckupReport "
                + "join Building ON Building.building_id=CheckupReport.building_id "
                + "join Customer ON Customer.customer_id=Building.customer_id "
                + "join Employee ON Employee.emp_id=CheckupReport.employee_id "
                + "where reportStatus='done'";
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
                        rs.getString("Employee.fname"),
                        rs.getString("Employee.lname")
                );
                CheckupReport cr = new CheckupReport(
                        rs.getInt("creport_id"),
                        b,
                        c,
                        e,
                        rs.getString("checkDate"),
                        rs.getInt("checkupreport.condition_level"),
                        rs.getString("reportStatus"),
                        rs.getString("comments")
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

    public CheckupReport getReportByID(int reportid, Connection con) {
        CheckupReport cr = null;
        String sql = "select * from CheckupReport "
                + "join Building ON Building.building_id=CheckupReport.building_id "
                + "join Customer ON Customer.customer_id=Building.customer_id "
                + "join Employee ON Employee.emp_id=CheckupReport.employee_id "
                + "where creport_id=?";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setInt(1, reportid);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Building b = new Building(
                        rs.getString("name"),
                        rs.getString("street"),
                        rs.getInt("size"),
                        rs.getInt("zip"),
                        rs.getInt("year"),
                        rs.getString("buildingUse"));
                Customer c = new Customer(
                        rs.getString("company_name"),
                        rs.getString("Customer.fname"),
                        rs.getString("Customer.lname")
                );
                Employee e = new Employee(
                        rs.getString("Employee.fname"),
                        rs.getString("Employee.lname")
                );
                cr = new CheckupReport(
                        rs.getInt("creport_id"),
                        b,
                        c,
                        e,
                        rs.getString("checkDate"),
                        rs.getInt("checkupreport.condition_level"),
                        rs.getString("reportStatus"),
                        rs.getString("comments"),
                        rs.getString("roof"),
                        rs.getString("walls_outside"),
                        rs.getString("damaged"),
                        rs.getString("damage_when"),
                        rs.getString("damage_where"),
                        rs.getString("damage_what"),
                        rs.getString("damage_repaired"),
                        rs.getString("walls"),
                        rs.getString("ceiling"),
                        rs.getString("floor"),
                        rs.getString("windows_doors"),
                        rs.getString("moisture_scanning"),
                        rs.getString("moisture_measure")
                );

            }

            return cr;
        } catch (Exception e) {
            System.out.println("Problem in CustomerMapper ");
            System.out.println(e.getMessage());
            return null;
        }

    }

    public boolean createCheckupReport(int building_id, Connection con) {
        boolean result = false;
        String sqlString = "INSERT INTO CheckupReport(building_id, checkDate, reportStatus, employee_id) "
                + "VALUES (?, current_date(),'active', 1) ";
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
                + "SET checkDate=current_date(), condition_level=?, reportStatus='done', "
                + "comments=?, roof=?, walls_outside=?, damaged=?, damage_when=?, damage_where=?, damage_what=?, damage_repaired=?, "
                + "walls=?, ceiling=?, floor=?, windows_doors=?, moisture_scanning=?, moisture_measure=? "
                + "WHERE creport_id=?";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setInt(1, cr.getCondition_level());
            stmt.setString(2, cr.getComments());
            
            stmt.setString(3, cr.getRoof());
            stmt.setString(4, cr.getWalls_outside());
            
            stmt.setString(5, cr.getDamaged());
            stmt.setString(6, cr.getDamage_when());
            stmt.setString(7, cr.getDamage_where());
            stmt.setString(8, cr.getDamage_what());
            stmt.setString(9, cr.getDamage_repaired());
            
            stmt.setString(10, cr.getWalls());
            stmt.setString(11, cr.getCeiling());
            stmt.setString(12, cr.getFloor());
            stmt.setString(13, cr.getWindows_doors());
            stmt.setString(14, cr.getMoisture_scanning());
            stmt.setString(15, cr.getMoisture_measure());
            
            stmt.setInt(16, cr.getCreport_id());
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
