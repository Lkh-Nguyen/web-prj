/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Database.UserDB;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author MSI
 */
public class Admin_Add_User extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin_Add_User</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin_Add_User at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("full_admin_user.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String dobStr = request.getParameter("DOB");
        String cmnd = request.getParameter("CMND");
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        int iRole = role(role);
        java.sql.Date dateOfBirth = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            dateOfBirth = new java.sql.Date(dateFormat.parse(dobStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Handle parsing exception appropriately
        }
        User newUser = new User(name, gender, dateOfBirth, cmnd, phoneNumber, email, password, address, iRole);
        if(UserDB.doesUserExist(email)){
        request.setAttribute("emailError", "Email đã tồn tại!");
        request.getRequestDispatcher("full_admin_user.jsp").forward(request, response);
        }       
        else if (!password.equals(repassword)) {
        request.setAttribute("repasswordError", "Mật khẩu không khớp!");
        request.getRequestDispatcher("full_admin_user.jsp").forward(request, response);
        } // Check password
        else if (UserDB.insertUser(newUser)) {
        HttpSession session = request.getSession();
        session.setAttribute("userList", UserDB.getAllUsers());
        request.getRequestDispatcher("full_admin_user.jsp").forward(request, response);
        // Update the session with the new user information
         } else {      
        HttpSession session = request.getSession();
        session.setAttribute("userList", UserDB.getAllUsers());
        request.getRequestDispatcher("full_admin_user.jsp").forward(request, response);
    }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
     public int role(String role){
        if(role == "Guest"){
            return 1;
        }
        else{
            return 2;
        }
    }
}
