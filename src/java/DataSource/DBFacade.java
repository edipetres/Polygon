/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.CheckupReport;
import Domain.Customer;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author edipetres
 */
public class DBFacade {
    
    private Connection con;
    private BuildingMapper bm;
    //add mappers here as private objects
    private CustomerMapper customerMap;
    private CheckupReportMapper creportmap;
    private ServiceMapper serviceMapper;
    
    //Singleton start
    private static DBFacade instance;
    
    private DBFacade () {
        con = DBConnector.getInstance().getConnection();
        bm = new BuildingMapper();
        customerMap = new CustomerMapper();
        creportmap = new CheckupReportMapper();
        //assign the mappers with a new object 
    }
    
    public static DBFacade getInstance() {
        if (instance == null) {
            instance = new DBFacade();
        }
        return instance;
    }
    //Singleton end
    
    public boolean createCustomer(Customer c) throws SQLException{
        return customerMap.createCustomer(c, con);
    }

    public boolean addBuilding(Building building) {
        return bm.addBuilding(con, building);
    }
    
    public boolean createCheckupReport(int building_id) {
        return creportmap.createCheckupReport(building_id, con);
    }
    public boolean updateCheckupReport(CheckupReport checkuprreport) {
        return creportmap.updateCheckupReport(checkuprreport, con);
    }
    public List<Customer> showCustomers() 
    {
	return customerMap.viewAllCustomers(con);
    }
    public List<CheckupReport> showActiveCheckupReports() 
    {
	return creportmap.getActiveReports(con);
    }
    public List<CheckupReport> showDoneCheckupReports() 
    {
	return creportmap.getDoneReports(con);
    }
    
    public CheckupReport getReportByID(int id) 
    {
	return creportmap.getReportByID(id, con);
    }
    public ArrayList<String> getAllServices() {
        return serviceMapper.getAllServices(con);
    }
   
}
