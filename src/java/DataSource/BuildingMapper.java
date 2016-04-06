/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edipetres
 */
public class BuildingMapper {
    public boolean addBuilding(Connection con,Building building) {
        boolean result = false;
        String sqlString = "INSERT INTO Building (building_id,name,street,zip,size,condition_level,customer_id) "
                + "VALUES (?,?,?,?,?,?,?);";
        PreparedStatement stmt = null;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setInt(1, building.getBuildingID());
            stmt.setString(2, building.getName());
            stmt.setString(3, building.getStreet());
            stmt.setInt(4, building.getZip());
            stmt.setInt(5, building.getSize());
            stmt.setInt(6, building.getCondition());
            stmt.setInt(7, building.getCustomerID());
            
            stmt.execute();
            stmt.close();
            result = true;
        } catch (SQLException ex) {
            result = false;
            System.out.println("Exception in BuildingMapper. ex = " + ex);
        }
        return result;
    }
        public List<Building> getBuildings(Connection con){
        ArrayList<Building> buildings = new ArrayList<>();
        String sql = "select * from Building";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                    Building tempBuild = new Building(
                    rs.getInt("building_id"),
                    rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("street"),
                    rs.getInt("size"),
                    rs.getInt("condition_level"),
                    rs.getInt("zip"));
                    buildings.add(tempBuild);
                    
                }
        } catch (Exception e) {
            System.out.println("Problem in BuildingMapper ");
            System.out.println(e.getMessage());
            return null;
        }
        return buildings;
    }
    
    
//    an result = false;
//        try {
//            Class.forName(driver);
//            Connection conn = DriverManager.getConnection(url, this.username, this.pwd);
//            String sqlString = "insert into user(username, fullName,balance, pwd) VALUES (?,?,?,?)";
//            PreparedStatement stmt = conn.prepareStatement(sqlString);
//            stmt.setString(1, username);
//            stmt.setString(2, fullName);
//            stmt.setInt(3, balance);
//            stmt.setString(4, password);
//
//            stmt.execute();
//            stmt.close();
//            conn.close();
//            result = true;
//        } catch (ClassNotFoundException | SQLException ex) {
//            System.out.println(ex);
//            result = false;
//        }
//        return result;
//    
//    public Player getPlayer(int playerid, Connection conn){
//        Player p = null;
//        String sqlString = "select * from player where Player_id=?";
//        PreparedStatement stmt = null;
//        try {
//            stmt = conn.prepareStatement(sqlString);
//            stmt.setInt(1, playerid);
//            ResultSet rs = stmt.executeQuery();
//            while (rs.next()) {
//                p = new Player(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5));
//            }
//        } catch (SQLException ex) {
//            System.out.println("Error in soccerMapper getPlayer");
//            System.out.println("Exception = " + ex);
//        } finally {
//            try {
//                stmt.close();
//            } catch (SQLException ex) {
//                System.out.println("Error while trying to close stmt.");
//                System.out.println("Exception = " + ex);
//            }
//        }
//        return p;
//    }
}
