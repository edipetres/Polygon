/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

/**
 *
 * @author Minerva
 */
public class CheckupReport {

    int creport_id;
    Building building;
    Customer customer;
    Employee employee;
    String checkDate;
    int condition_level;
    String reportStatus;
    String comments;
    String damaged;
    String damage_when;
    String damage_where;
    String damage_what;
    String damage_repaired;

    public CheckupReport(int creport_id, int condition_level, String comments, String damaged, String damage_when, String damage_where, String damage_what, String damage_repaired) {
        this.creport_id = creport_id;
        this.condition_level = condition_level;
        this.comments = comments;
        this.damaged = damaged;
        this.damage_when = damage_when;
        this.damage_where = damage_where;
        this.damage_what = damage_what;
        this.damage_repaired = damage_repaired;
    }

    public String getDamaged() {
        return damaged;
    }

    public void setDamaged(String damaged) {
        this.damaged = damaged;
    }

    public String getDamage_when() {
        return damage_when;
    }

    public void setDamage_when(String damage_when) {
        this.damage_when = damage_when;
    }

    public String getDamage_where() {
        return damage_where;
    }

    public void setDamage_where(String damage_where) {
        this.damage_where = damage_where;
    }

    public String getDamage_what() {
        return damage_what;
    }

    public void setDamage_what(String damage_what) {
        this.damage_what = damage_what;
    }

    public String getDamage_repaired() {
        return damage_repaired;
    }

    public void setDamage_repaired(String damage_repaired) {
        this.damage_repaired = damage_repaired;
    }

    public CheckupReport(int creport_id, Building building, Customer customer, Employee employee, String checkDate, int condition_level, String reportStatus, String comments) {
        this.creport_id = creport_id;
        this.building = building;
        this.customer = customer;
        this.employee = employee;
        this.checkDate = checkDate;
        this.condition_level = condition_level;
        this.reportStatus = reportStatus;
        this.comments = comments;

    }

    public CheckupReport(int creport_id, Building building, Customer customer, Employee employee, String reportStatus) {
        this.creport_id = creport_id;
        this.building = building;
        this.customer = customer;
        this.employee = employee;
        this.reportStatus = reportStatus;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public CheckupReport(String checkDate, int condition_level, String comments) {
        this.checkDate = checkDate;
        this.condition_level = condition_level;
        this.comments = comments;
    }

    public CheckupReport(int creport_id, int condition_level, String comments) {
        this.creport_id = creport_id;
        this.condition_level = condition_level;
        this.comments = comments;
    }

    public int getCreport_id() {
        return creport_id;
    }

    public void setCreport_id(int creport_id) {
        this.creport_id = creport_id;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public String getCheckDate() {
        return checkDate;
    }

    public void setCheckDate(String checkDate) {
        this.checkDate = checkDate;
    }

    public int getCondition_level() {
        return condition_level;
    }

    public void setCondition_level(int condition_level) {
        this.condition_level = condition_level;
    }

    public String getReportStatus() {
        return reportStatus;
    }

    public void setReportStatus(String reportStatus) {
        this.reportStatus = reportStatus;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

}
