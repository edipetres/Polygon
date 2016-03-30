/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import java.sql.Connection;

/**
 *
 * @author edipetres
 */
public class DBFacade {
    
    private Connection con;
    private BuildingMapper bm;
    //add mappers here as private objects
    
    //Singleton start
    private static DBFacade instance;
    
    private DBFacade () {
        con = DBConnector.getInstance().getConnection();
        bm = new BuildingMapper();
        //assign the mappers with a new object 
    }
    
    public static DBFacade getInstance() {
        if (instance == null) {
            instance = new DBFacade();
        }
        return instance;
    }
    //Singleton end
    
    public boolean addBuilding() {
        return bm.addBuilding(con,1,null);
    }
}
