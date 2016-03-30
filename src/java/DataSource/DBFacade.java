/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Customer;
import java.sql.Connection;

/**
 *
 * @author edipetres
 */
public class DBFacade {
    
    private Connection con;
    //add mappers here as private objects
    private CustomerMapper customerMap;
    //Singleton start
    private static DBFacade instance;
    
    private DBFacade () {
        con = DBConnector.getInstance().getConnection();
        //assign the mappers with a new object here
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
}
