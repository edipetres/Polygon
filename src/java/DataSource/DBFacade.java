/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Building;
import Domain.CheckupReport;
import Domain.CityList;
import Domain.Customer;
import Domain.ServiceRequest;
import Domain.ServiceList;
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
    
    public List<Building> showBuildings() 
    {
	return bm.getBuildings(con);
    }
    
    public CheckupReport getReportByID(int id) 
    {
	return creportmap.getReportByID(id, con);
    }
    public ArrayList<ServiceList> getAllServices() {
        return serviceMapper.getServiceList(con);
    }
    
    public ArrayList<CityList> getCities() {
        return bm.getCityList(con);
    }
    
    public boolean saveServiceRequest(ServiceRequest s) {
        boolean result = serviceMapper.saveServiceRequest(con, s);
        return result;
    }

    public List<ServiceRequest> showPendingServiceRequests() {
        return serviceMapper.showPendingServiceRequests(con);
    }
    public boolean takeServiceRequest(int srequest_id, int employee_id) {
        return serviceMapper.takeServiceRequest(con, srequest_id, employee_id);
    }
    
    public Building getBuilding(int building_id) {
        return bm.getBuilding(con, building_id);
    }

    public boolean saveBuildingEdits(Building tempBuilding) {
        return bm.saveBuildingEdits(con, tempBuilding);
    }
}
