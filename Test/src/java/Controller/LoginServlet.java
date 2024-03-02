/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import Database.UserDB;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author ASUS
 */
public class LoginServlet extends HttpServlet {

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
        request.getRequestDispatcher("full_home.jsp").forward(request, response);
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        // Use UserDB to get customer details based on email
        User user = UserDB.getUser(email);

        if (user == null || !user.getPassword().equals(password)) {
            // If email or password is incorrect, set error message and forward to login page
            request.setAttribute("errorMessage", "Invalid email or password !");
            request.getRequestDispatcher("full_login.jsp").forward(request, response);
        } else {
            // If email and password match, create session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            //RememberMe box 
            Cookie cEmail = new Cookie("cEmail", email);
            Cookie cRememberMe = new Cookie("cRememberMe", rememberMe);
            //Checked
            if (rememberMe != null) {
                cEmail.setMaxAge(24 * 60);
                cRememberMe.setMaxAge(24 * 60);
            }
            //Not checked
            else {
                cEmail.setMaxAge(0);
                cRememberMe.setMaxAge(0);
            }
            response.addCookie(cEmail);
            response.addCookie(cRememberMe);
            //3 minutes
            session.setMaxInactiveInterval(3 * 60);
            request.getRequestDispatcher("full_home.jsp").forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
