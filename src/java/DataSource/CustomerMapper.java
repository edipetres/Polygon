/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Minerva
 */
public class CustomerMapper {
    
    public boolean createCustomer(Customer c, Connection con){
    boolean result = false;
        String sql = "INSERT INTO Customer (company_name, fname, lname, username, pwd, email, phone_no) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement statement = con.prepareStatement(sql);
        try  {
            statement.setString(1, c.getCompany_name());
            statement.setString(2, c.getFname());
            statement.setString(3, c.getLname());
            statement.setString(4, c.getUsername());
            statement.setString(5, c.getPwd());
            statement.setString(6, c.getEmail());
            statement.setString(7, c.getPhone_no());

            statement.execute();
            
            result = true;
        } catch (SQLException e, Exception ex) {
            result = false;
            System.out.println("Problem in Mapper "+ e);
            System.out.println(ex);
        }finally{statement.close();}
        return result;
    }
}
