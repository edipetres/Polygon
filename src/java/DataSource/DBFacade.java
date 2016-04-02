/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.Customer;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author edipetres
 */
public class DBFacade {

    private Connection con;

    //add mappers here as private objects
    private BuildingMapper bm;
    private CustomerMapper customerMap;
    private ServiceMapper serviceMapper;

    //Singleton start
    private static DBFacade instance;

    private DBFacade() {
        con = DBConnector.getInstance().getConnection();
        bm = new BuildingMapper();
        customerMap = new CustomerMapper();
        serviceMapper = new ServiceMapper();
        //assign the mappers with a new object 
    }

    public static DBFacade getInstance() {
        if (instance == null) {
            instance = new DBFacade();
        }
        return instance;
    }
    //Singleton end

    public boolean createCustomer(Customer c) throws SQLException {
        return customerMap.createCustomer(c, con);
    }

    public boolean addBuilding(Building building) {
        return bm.addBuilding(con, building);
    }

    public List<Customer> showCustomers() {
        return customerMap.viewAllCustomers(con);
    }

    public ArrayList<String> getAllServices() {
        return serviceMapper.getAllServices(con);
    }

}
