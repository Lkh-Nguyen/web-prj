/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.BillDB;
import Database.ServiceUsageDB;
import Database.TicketDB;
import Model.Bill;
import Model.FilmDetail;
import Model.ServiceUsage;
import Model.Ticket;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BillDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet BillDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillDetailServlet at " + request.getContextPath() + "</h1>");
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
        String billIDString = request.getParameter("bID");
        Integer billID = Integer.valueOf(billIDString);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Bill bill = BillDB.getBill(billID);

        //Bill không phải của người dùng
        if (bill==null || user.getId() != bill.getUser().getId()) {
            response.sendRedirect("home");
        }
        List<Ticket> ticketList = TicketDB.getTicketsByBillID(billID);
        FilmDetail filmDetail = null;
        if (ticketList != null && !ticketList.isEmpty()) {
            filmDetail = ticketList.get(0).getFilmDetail();
        }
        List<ServiceUsage> orderedService = ServiceUsageDB.getAllServiceUsagesByBillID(billID);
        request.setAttribute("bill", bill);
        request.setAttribute("filmDetail", filmDetail);
        request.setAttribute("ticketList", ticketList);
        request.setAttribute("orderedService", orderedService);
        request.getRequestDispatcher("full_historyOnline_detail.jsp").forward(request, response);
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
