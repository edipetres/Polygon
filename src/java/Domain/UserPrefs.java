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
public class UserPrefs {
    //user access levels: (separate cunstructor for each type of login)
    //1: admin
    //2: employee
    //3: customer
    
    private int accessLevel;
    private int userID;
    String fname;
    private String lname;
    private String username;
    private String email;
    private int phoneNo;
    private String companyName;
    
    public UserPrefs(int accessLevel, int userID, String fname, String lname, String username, String email, int phoneNo, String companyName) {
        this.accessLevel = accessLevel;
        this.userID = userID;
        this.fname = fname;
        this.lname = lname;
        this.username = username;
        this.email = email;
        this.phoneNo = phoneNo;
        this.companyName = companyName;
    }
    
    public UserPrefs(int accessLevel, int userID, String fname, String lname, String username, String email, int phoneNo) {
        this.accessLevel = accessLevel;
        this.userID = userID;
        this.fname = fname;
        this.lname = lname;
        this.username = username;
        this.email = email;
        this.phoneNo = phoneNo;
    }

    public int getAccessLevel() {
        return accessLevel;
    }
    
    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public int getUserID() {
        return userID;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public int getPhoneNo() {
        return phoneNo;
    }
    
}
