/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.UserDB;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author ASUS
 */
public class UpdateAccountServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        request.getRequestDispatcher("full_updateAccount.jsp").forward(request, response);
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
    //Taking user input
    String name = request.getParameter("name");
    String gender = request.getParameter("gender"); // Assuming this is the name of the gender radio button group
    String dobStr = request.getParameter("DOB"); // Assuming this is the name of the date of birth input field
    String cmnd = request.getParameter("CMND");
    String phoneNumber = request.getParameter("phone");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String repassword = request.getParameter("repassword");
    String address = request.getParameter("address");
    
    //Parsing String to java.util.Date
    java.sql.Date dateOfBirth = null;
    try {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateOfBirth = new java.sql.Date(dateFormat.parse(dobStr).getTime());
    } catch (ParseException e) {
        e.printStackTrace(); // Handle parsing exception appropriately
    }
    
    // Retrieve current user from session
    HttpSession session = request.getSession();
    User sessionUser = (User) session.getAttribute("user");
    
    // Create new User object with updated information
    User newUser = new User(name, gender, dateOfBirth, cmnd, phoneNumber, email, password, address);
    
    boolean hasError = false;

    // Check if passwords match
    if (!password.equals(repassword)) {
        request.setAttribute("repasswordError", "Mật khẩu không khớp!");
        hasError = true;
    } // Check password
    else if (!sessionUser.getPassword().equals(password)) {
        request.setAttribute("passwordError", "Sai mật khẩu!");
        hasError = true;
    }

    // If there's an error, forward to update page
    if (hasError) {
        request.getRequestDispatcher("full_updateAccount.jsp").forward(request, response);
        return;
    }

    // Update the user's information
    if (UserDB.updateUser(sessionUser, newUser)) {
        request.setAttribute("updateStatus", "Cập nhật thành công!");
        // Update the session with the new user information
        session.setAttribute("user", newUser);
    } else {
        request.setAttribute("updateStatus", "Cập nhật không thành công!");
    }
    
    // Forward to the update page
    request.getRequestDispatcher("full_updateAccount.jsp").forward(request, response);
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
