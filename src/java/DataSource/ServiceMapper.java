/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Service;
import Domain.ServiceList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edipetres
 */



public class ServiceMapper {
    
//    private static Connection con;
//    private static ServiceMapper sm;
//    
//    ServiceMapper() {
//        con = (Connection) DBConnector.getInstance().getConnection();
//        
//    }
//    public static void main(String[] args) {
//        ServiceMapper sm = new ServiceMapper();
//        ArrayList<ServiceList> sl = sm.getServiceList(con);
//        
//        for (int i = 0; i < sl.size(); i++) {
//            System.out.println(i+": "+sl.get(i).getService_id()+" name: "+sl.get(i).getService_name());
//        }
//        
//        Service s = new Service(2, 11, "This is description.", "pending");
//        boolean result = sm.saveServiceRequest(con, s);
//        System.out.println("result = " + result);
//    }
    
    
    //Returns the list of services without their indexes
    public ArrayList<ServiceList> getServiceList(Connection con) {
        ArrayList<ServiceList> serviceList = new ArrayList();
        String sqlString = "select * from Services";
        Statement stmt = null;
        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sqlString);
            while (rs.next()) {
                serviceList.add(new ServiceList(rs.getInt(1),rs.getString(2)));
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error in getAllServices() method; exception: "+ex);
        }
        return serviceList;
    }
    
    
    public boolean saveServiceRequest(Connection con,Service service) {
        boolean result = false;
        String sqlString = "INSERT INTO ServiceRequest (building_id,employee_id,requestDate,service_id,description,reportStatus)\n" +
"VALUES (?,?,current_date(),?,?,?);";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setInt(1, service.getBuilding_id());
            stmt.setInt(2, service.getEmployee_id());
            stmt.setInt(3, service.getService_id());
            stmt.setString(4, service.getDescription());
            stmt.setString(5, service.getReportStatus());
            result = true;
            
            stmt.execute();
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceMapper.class.getName()).log(Level.SEVERE, null, ex);
            result = false;
        }
        return result;
    }
}
