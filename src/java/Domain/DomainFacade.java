/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import DataSource.DBFacade;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author edipetres
 */
public class DomainFacade {
   // private Order currentOrder;       // Order in focus
    private DBFacade dbf;
    private Customer newCustomer;
    
    private DomainFacade()
    {
        //currentOrder = null;
        dbf = DBFacade.getInstance();
    }

    public static DomainFacade getInstance()
    {
         return new DomainFacade();
    }
    //----------------------
    public boolean createCustomer(Customer c) throws SQLException
    {
        return dbf.createCustomer(c);
    }

    public boolean addBuilding(Building building) {
        return dbf.addBuilding(building);
    }
    public List<Customer> showCustomers() {
        List <Customer> allCustomers = dbf.showCustomers();
        return allCustomers;
    }

}
