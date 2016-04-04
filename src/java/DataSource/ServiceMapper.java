/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edipetres
 */



public class ServiceMapper {
    
    private static Connection conn;
    private static ServiceMapper sm;
    
    ServiceMapper() {
        conn = (Connection) DBConnector.getInstance().getConnection();
        
    }
    
//    
//    public static void main(String[] args) {
//        ServiceMapper sm = new ServiceMapper();
//        ArrayList<String> serviceList = sm.getAllServices(conn);
//        for (int i = 0; i < serviceList.size(); i++) {
//            System.out.println(i+": "+serviceList.get(i));
//        }
//    }
    
    
    
    public ArrayList<String> getAllServices(Connection con) {
        ArrayList<String> serviceList = new ArrayList();
        String sqlString = "select service_name from Services";
        Statement stmt = null;
        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sqlString);
            while (rs.next()) {
                serviceList.add(rs.getString("service_name"));
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error in getAllServices() method; exception: "+ex);
        }
        return serviceList;
    }
}
