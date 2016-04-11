/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.ServiceList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author edipetres
 */
public class BuildingMapper {

//    private static Connection con;
//    private static BuildingMapper bm;
//
//    BuildingMapper() {
//        con = (Connection) DBConnector.getInstance().getConnection();
//
//    }
//
//    public static void main(String[] args) {
//        bm = new BuildingMapper();
//        
//        Building b = new Building("");
//    }

    public boolean addBuilding(Connection con, Building building) {
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

    public List<Building> getBuildings(Connection con) {
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

    public Building getBuilding(Connection con, int building_id) {
        Building building = null;
        String sql = "select * from Building where building_id=?";
        PreparedStatement stmt;
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, building_id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                building = new Building(rs.getInt("building_id"),
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("street"),
                        rs.getInt("size"),
                        rs.getInt("condition_level"),
                        rs.getInt("zip"));
            }
            stmt.close();
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(BuildingMapper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Problem in getBuilding. Exception = " + ex);
        }
        return building;
    }

    boolean saveBuildingEdits(Connection con, Building tempBuilding) {
        boolean result = false;
        String sqlString = "UPDATE Building "
                + "SET `name`=?, "
                + "`street`=?, "
                + "`zip`=?,"
                + "`size`=?,"
                + "`condition_level`=?,"
                + "`parcel_no`=? "
                + "WHERE `building_id`=?;";
        PreparedStatement stmt;
        try {
            stmt = con.prepareStatement(sqlString);
            stmt.setString(1, tempBuilding.getName());
            stmt.setString(2, tempBuilding.getStreet());
            stmt.setInt(3, tempBuilding.getZip());
            stmt.setInt(4, tempBuilding.getSize());
            stmt.setInt(5, tempBuilding.getCondition());
            stmt.setInt(6, tempBuilding.getParcel_no());
            stmt.setInt(7, tempBuilding.getBuildingID());
            stmt.execute();
            stmt.close();
            result = true;
        } catch (SQLException ex) {
            Logger.getLogger(BuildingMapper.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Exception in updateBuilding(). Exception: "+ex);
            result = false;
        }
        return result;
    }

//    public boolean updatePlayer(Connection conn, Player player ){
//        
//        //It should not be possible to change the playerid!
//        
//        
//        String sql = "update player\n" +
//        "set Player_name = ?,Player_position=?,Player_number=?,Team_id=?\n" +
//        "where Player_id = ?;";
//        PreparedStatement updateStatement;
//        try {
//        updateStatement = conn.prepareStatement(sql);
//        updateStatement.setString(1, player.getPlayerName());
//        updateStatement.setString(2, player.getPlayerPos());
//        updateStatement.setInt(3, player.getPlayerNumber());
//        updateStatement.setString(4, player.getTeamid());
//        updateStatement.setInt(5, player.getPlayerid());
//        return updateStatement.execute();
//        } catch (SQLException ex) {
//            System.out.println("SQL EX IN Update Player" + ex);
//        }
//        return false;
//    }
}
