/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DataSource;

import Domain.Customer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

/**
 *
 * @author Minerva
 */
public class CustomerMapper {
    public boolean createCustomer(Customer c, Connection con){
    int rowsInserted = 0;
        String sql = "INSERT INTO Customer (company_name, fname, lname, username, pwd, email, phone_no) VALUES (?,?,?,?,?,?,?)";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            
            statement.setString(1, c.getCompany_name());
            statement.setString(2, c.getFname());
            statement.setString(3, c.getLname());
            statement.setString(4, c.getUsername());
            statement.setString(5, c.getPwd());
            statement.setString(6, c.getEmail());
            statement.setString(7, c.getPhone_no());

            rowsInserted = statement.executeUpdate();
   
        } catch (Exception e) {
            e.printStackTrace();

        }
        return rowsInserted == 1;
    }
}
