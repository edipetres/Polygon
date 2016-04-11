/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Domain;

/**
 *
 * @author edipetres
 */
public class Building {

    private int buildingID;
    private int customerID;
    private String name;
    private String address;
    private String street;
    private int size;
    private int condition;
    private String lastCheckUp;
    private int zip;
    private int parcel_no;

    public Building(String street, int size, int zip) {
        this.street = street;
        this.size = size;
        this.zip = zip;
    }

    public int getBuildingID() {
        return buildingID;
    }

    public String getStreet() {
        return street;
    }

    public int getCustomerID() {
        return customerID;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public int getSize() {
        return size;
    }

    public int getCondition() {
        return condition;
    }

    public String getLastCheckUp() {
        return lastCheckUp;
    }

    public int getZip() {
        return zip;
    }

    public int getParcel_no() {
        return parcel_no;
    }

    public Building(int customerID, String name, String street, int size, int zip) {
        this.customerID = customerID;
        this.name = name;
        this.street = street;
        this.size = size;
        this.zip = zip;
    }

    public Building(int buildingID, String name, String street, int zip, int size, int condition, int parcel_no) {
        this.buildingID = buildingID;
        this.name = name;
        this.street = street;
        this.size = size;
        this.condition = condition;
        this.zip = zip;
        this.parcel_no = parcel_no;
    }

    public Building(int buildingID, int customerID, String name, String street, int size, int condition, int zip) {
        this.buildingID = buildingID;
        this.customerID = customerID;
        this.name = name;
        this.street = street;
        this.size = size;
        this.condition = condition;
        //this.lastCheckUp = lastCheckUp;
        this.zip = zip;
    }

    public Building(int buildingID, String street, int size, int zip) {
        this.buildingID = buildingID;
        this.street = street;
        this.size = size;
        this.zip = zip;
    }

}
