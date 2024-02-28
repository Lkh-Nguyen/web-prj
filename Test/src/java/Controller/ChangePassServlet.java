/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.CustomerDB;
import Model.Customer;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MSI
 */
public class ChangePassServlet extends HttpServlet {

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
            out.println("<title>Servlet ChangePassServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassServlet at " + request.getContextPath() + "</h1>");
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
        String pass = request.getParameter("password");
        String newpass = request.getParameter("newpassword");
        String re_newpass = request.getParameter("re_newpassword");
        HttpSession session = request.getSession();
        Customer cu = (Customer) session.getAttribute("customer");

        if (!cu.getPassword().equals(pass)) {
            request.setAttribute("pass_error", "Mật khẩu cũ không đúng");
            request.getRequestDispatcher("full_changePass.jsp").forward(request, response);
        } else if (pass.equalsIgnoreCase(newpass)) {
            request.setAttribute("newpass_error", "Mật khẩu mới không được trùng với mật khẩu cũ");
            request.getRequestDispatcher("full_changePass.jsp").forward(request, response);
        } else if (!newpass.equalsIgnoreCase(re_newpass)) {
            request.setAttribute("re_newpass_error", "Mật khẩu mới không trùng khớp");
            request.getRequestDispatcher("full_changePass.jsp").forward(request, response);
        } else if (CustomerDB.changePassword(cu, newpass)) {
            request.setAttribute("updateStatus", "Cập nhật mật khẩu thành công!");
            cu.setPassword(newpass);
            session.setAttribute("customer", cu);
            request.getRequestDispatcher("full_changePass.jsp").forward(request, response);
        } else {
            request.setAttribute("updateStatus", "Cập nhật mật khẩu không thành công!");
            request.getRequestDispatcher("full_changePass.jsp").forward(request, response);
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

}
