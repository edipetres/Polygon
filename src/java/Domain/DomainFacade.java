/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

import DataSource.DBFacade;
import java.sql.SQLException;
import java.util.ArrayList;
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
    public boolean createCheckupReport(int building_id) {
        return dbf.createCheckupReport(building_id);
    }
    public boolean updateCheckupReport(CheckupReport checkupreport) {
        return dbf.updateCheckupReport(checkupreport);
    }
    public List<Customer> showCustomers() {
        List <Customer> allCustomers = dbf.showCustomers();
        return allCustomers;
    }
    
    
    
    public List<CheckupReport> showActiveCheckupReports() {
        List <CheckupReport> activeReports = dbf.showActiveCheckupReports();
        return activeReports;
    }
    
    public List<CheckupReport> showDoneCheckupReports() {
        List <CheckupReport> doneReports = dbf.showDoneCheckupReports();
        return doneReports;
    }
    
    public List<Building> showBuildings() {
        List <Building> buildings = dbf.showBuildings();
        return buildings;
    }
    
    public CheckupReport getReportByID(int id) {
        return dbf.getReportByID(id);
    }
    public ArrayList<ServiceList> getAllServices() {
        return dbf.getAllServices();
    }
    
    public boolean saveServiceRequest(ServiceRequest service) {
        return dbf.saveServiceRequest(service);
    }
    public List<ServiceRequest> showPendingServiceRequests() {
        return dbf.showPendingServiceRequests();
    }
    public boolean takeServiceRequest(int srequest_id, int employee_id) {
        return dbf.takeServiceRequest(srequest_id, employee_id);
    }
    public Building getBuilding(int building_id) {
        return dbf.getBuilding(building_id);
    }

    public boolean saveBuildingEdits(Building tempBuilding) {
        return dbf.saveBuildingEdits(tempBuilding);
    }
    
}
