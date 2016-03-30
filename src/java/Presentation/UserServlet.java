/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Presentation;

import Domain.Customer;
import Domain.DomainFacade;
import java.io.IOException;
import java.io.PrintWriter;
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
            throws ServletException, IOException {
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
//                case "newOrderDetail":
//                    createNewOrderDetail(request, response, domainModel);
//                    break;
//                    
//                //== exercise
//                case "updateOrder":
//                    updateOrder(request, response, domainModel);
//                    break;
//                //== exercise
//                case "updateOrderDetail":
//                    updateOrderDetail(request, response, domainModel);
//                    break;
    }
    }
    
    private boolean addBuilding(HttpServletRequest request, HttpServletResponse response, DomainFacade domainModel) throws ServletException, IOException {
        boolean result = false;
        
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int size = Integer.parseInt(request.getParameter("size"));
        
        request.setAttribute("Message", "");
        RequestDispatcher dispatcher = request.getRequestDispatcher("ShowOrder.jsp");
        dispatcher.forward(request, response);
        return result;
    }
    
    private void createCustomer(HttpServletRequest request, HttpServletResponse response, DomainFacade domainModel) throws ServletException, IOException {
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
        request.setAttribute("customer", customer);
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
        processRequest(request, response);
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
        processRequest(request, response);
        
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

}
