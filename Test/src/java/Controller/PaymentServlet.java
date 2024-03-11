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
import Model.Service;
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
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ASUS
 */
public class PaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet PaymentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        FilmDetail filmDetail = (FilmDetail) session.getAttribute("filmDetail");
        if (filmDetail == null) {
            response.sendRedirect("home");
            return;
        }
        request.getRequestDispatcher("booking?fdID=" + filmDetail.getId()).forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Integer price = (Integer) session.getAttribute("price");
        FilmDetail filmDetail = (FilmDetail) session.getAttribute("filmDetail");
        List<Ticket> ticketList = (List<Ticket>) session.getAttribute("ticketList");
        String listSeatString = (String) session.getAttribute("listSeatString");
        HashMap<Service, Integer> orderedService = (HashMap<Service, Integer>) session.getAttribute("orderedService");

        // Check if any required session attribute is missing or if the user is not logged in
        if (user == null || price == null || filmDetail == null || ticketList == null
                || listSeatString == null || orderedService == null) {

            // Forward to home page
            response.sendRedirect("home");
            return;
        }

        // Proceed with the rest of the logic
        Date currentDate = new Date(System.currentTimeMillis());
        Bill bill = new Bill(currentDate, price, user);
        BillDB.insertBill(bill);
        int newBillId = BillDB.getLastInsertedBillId();
        bill.setId(newBillId);
        //Set bill for ticket
        for (Ticket t : ticketList) {
            t.setBill(bill);
            TicketDB.insertTicket(t);
        }
        for (Map.Entry<Service, Integer> entry : orderedService.entrySet()) {
            Service service = entry.getKey();
            Integer amount = entry.getValue();
            ServiceUsage su = new ServiceUsage(service, amount, bill);
            ServiceUsageDB.insertServiceUsage(su);
        }

        // Remove session attributes
        session.removeAttribute("ticketList");
        session.removeAttribute("price");
        session.removeAttribute("filmDetail");
        session.removeAttribute("listSeatString");
        session.removeAttribute("orderedService");

        // Set request attributes
        request.setAttribute("bill", bill);
        request.setAttribute("filmDetail", filmDetail);
        request.setAttribute("ticketList", ticketList);
        request.setAttribute("listSeatString", listSeatString);
        request.setAttribute("orderedService", orderedService);
        
        // Forward to the detail page
        request.getRequestDispatcher("full_historyOnline_detail.jsp").forward(request, response);
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
