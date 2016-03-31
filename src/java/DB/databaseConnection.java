/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Pasi
 */
public class databaseConnection {
    
    String server = "jdbc:mysql://localhost:3306/Appi";
    String user = "root";
    String password = "pallero12";
    
    public Connection getConnection() {
        
        try {         
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(databaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    Connection conn = null;
        try {
            conn = DriverManager.getConnection(server, user, password);
        } catch (SQLException ex) {
            Logger.getLogger(databaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return conn;
    }
    
}
