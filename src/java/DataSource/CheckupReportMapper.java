/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.CheckupReport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Minerva
 */
public class CheckupReportMapper {
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
