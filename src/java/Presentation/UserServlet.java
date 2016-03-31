/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation;


import Domain.Building;
import Domain.CheckupReport;

import Domain.Customer;

import Domain.DomainFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author edipetres
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        //-- Establish or reestablish application demainModeltext
            HttpSession sessionObj = request.getSession();
            DomainFacade domainModel = (DomainFacade) sessionObj.getAttribute("Controller");
            if (domainModel == null)
            {
                // Session starts
                domainModel = DomainFacade.getInstance();
                sessionObj.setAttribute("Controller", domainModel);
            } else
            {
                domainModel = (DomainFacade) sessionObj.getAttribute("Controller");
            }

            //-- Identify command and delegate job
            String command = request.getParameter("command");
            switch (command)
            {
                case "addBuilding":
                    addBuilding(request, response, domainModel);
                    break;
                case "addCustomer":
                    createCustomer(request, response, domainModel);
                    break;
                case "showCustomers":
                    showCustomers(request, response, domainModel);
                    break;
                case "updateCheckupReport":
                    updateCheckupReport(request, response, domainModel);
                    break;
                case "showActiveCheckupReports":
                    showActiveCheckupReports(request, response, domainModel);
                    break;  
                    
    }
    }
    
    private boolean addBuilding(HttpServletRequest request, HttpServletResponse response, DomainFacade domainModel) throws ServletException, IOException {
        boolean result = false;
        
        String name = request.getParameter("b_name");
        String street = request.getParameter("street");
        int size = Integer.parseInt(request.getParameter("size"));
        int zip = Integer.parseInt(request.getParameter("zip"));
        
        Building tempBuild = new Building(1,name,street,size,0,null,zip);
        result = domainModel.addBuilding(tempBuild);
        
        request.setAttribute("Message", "Building added: "+result);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddBuilding.jsp");
        dispatcher.forward(request, response);
        return result;
    }
    
    private void createCustomer(HttpServletRequest request, HttpServletResponse response, DomainFacade domainModel) throws ServletException, IOException, SQLException {
        String company_name = request.getParameter("company_name");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String username = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        String email = request.getParameter("email");
        String phone_no = request.getParameter("phone_no");

        Customer customer = new Customer(company_name, fname, lname, username, pwd, email, phone_no);
        System.out.println(customer.getCompany_name());
        domainModel.createCustomer(customer);
//        request.setAttribute("customer", customer);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("AddCustomer.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showCustomers(HttpServletRequest request, HttpServletResponse response, DomainFacade df) throws ServletException, IOException
    {
	List<Customer> customers = df.showCustomers();
	request.setAttribute("customers", customers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewCustomers.jsp");
        dispatcher.forward(request, response);
    }
    
    private void showActiveCheckupReports(HttpServletRequest request, HttpServletResponse response, DomainFacade df) throws ServletException, IOException
    {
	List<CheckupReport> reports = df.showActiveCheckupReports();
	request.setAttribute("reports", reports);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Reports.jsp");
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void updateCheckupReport(HttpServletRequest request, HttpServletResponse response, DomainFacade domainModel) throws ServletException, IOException {

        int condition_level = Integer.parseInt(request.getParameter("condition_level"));
        String comments = request.getParameter("comments");

        CheckupReport report = new CheckupReport(condition_level, comments);
        domainModel.updateCheckupReport(report);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.html"); //wanted to redirect to Reports.jsp but wont work 
        dispatcher.forward(request, response);
    }

}
