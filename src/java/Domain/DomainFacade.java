/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import DataSource.DBFacade;

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
    public Customer createCustomer(String company_name, String fname, String lname, String username, String pwd, String email, String phone_no)
    {
        newCustomer = new Customer(company_name, fname, lname, username, pwd, email, phone_no);
        
        boolean status = dbf.createCustomer(newCustomer);
        if (!status)
        {
            newCustomer = null;
        }

        return newCustomer;
    }

    public boolean addBuilding(Building building) {
        return dbf.addBuilding(building);
    }
}
