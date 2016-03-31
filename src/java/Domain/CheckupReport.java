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
    String checkDate;
    int condition_level;
    String reportStatus;
    String comments;
    int employee_id; 

    public CheckupReport(Building building, String checkDate, int condition_level, String comments) {
        this.building = building;
        this.checkDate = checkDate;
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

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }
    
    
}
