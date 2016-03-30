/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.Customer;
import java.sql.Connection;

/**
 *
 * @author edipetres
 */
public class DBFacade {
    
    private Connection con;
    private BuildingMapper bm;
    //add mappers here as private objects
    private CustomerMapper customerMap;
    //Singleton start
    private static DBFacade instance;
    
    private DBFacade () {
        con = DBConnector.getInstance().getConnection();
        bm = new BuildingMapper();
        customerMap = new CustomerMapper();
        //assign the mappers with a new object 
    }
    
    public static DBFacade getInstance() {
        if (instance == null) {
            instance = new DBFacade();
        }
        return instance;
    }
    //Singleton end
    
    public boolean createCustomer(Customer c){
        return customerMap.createCustomer(c, con);
    }

    public boolean addBuilding(Building building) {
        return bm.addBuilding(con, building);
    }
}
