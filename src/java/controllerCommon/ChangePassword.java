/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerCommon;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author ADMIN
 */
public class ChangePassword extends HttpServlet {

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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        Object o = session.getAttribute("account");
        request.setAttribute("none1", "none");
        request.setAttribute("none2", "block");
        Account acc = (Account) o;
        acc = dao.getAccount(acc.getUsername(), acc.getPassword());
        String oldPass = request.getParameter("accPass");
        String newPass = request.getParameter("accNewPass");
        String reNewPass = request.getParameter("accReNewPass");

        String Pattern = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*()-_+=]).{8,}$";

        if (acc.getPassword().equals(oldPass)) {
            if (newPass.matches(Pattern)) {
                if (newPass.equals(reNewPass) && !newPass.equals(acc.getPassword())) {
                    dao.updatePassByUserName(acc.getUsername(), newPass);
                    request.setAttribute("mess2", "Update Success!");
                    Account acc3 = dao.getAccount(acc.getUsername(), newPass);
                    session.setAttribute("account", acc3);
                } else {
                    request.setAttribute("mess2", "New password and Renew password must be same and New password not same old password");
                }
            } else {
                request.setAttribute("mess2", "New password must be at least 8 characters long, start with an uppercase letter, and contain at least one special character");
            }
        } else {
            request.setAttribute("mess2", "Old Password is wrong");

        }
        request.setAttribute("none", "none");
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
