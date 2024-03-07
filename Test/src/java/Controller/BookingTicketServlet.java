/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.*;
import Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class BookingTicketServlet extends HttpServlet {

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
            out.println("<title>Servlet BookingTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingTicketServlet at " + request.getContextPath() + "</h1>");
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
        //Get user ID
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //Get price
        float price = Float.parseFloat(request.getParameter("price"));
        //Get current date
        Date currentDate = new Date(System.currentTimeMillis());
        //Get film detail
        int filmDetailID = Integer.parseInt(request.getParameter("fdid"));
        FilmDetail filmDetail = (FilmDetail) request.getAttribute("filmDetail");
        //Get seat
        String[] listSeat = request.getParameter("listSeat").split(",");
        Screen screen = filmDetail.getScreen();

        // Create a new bill first
        Bill bill = new Bill(currentDate, 0.0f, user); // Initial total price is 0.0
        BillDB.insertBill(bill); // Insert the bill into the database

        // Retrieve the ID of the newly inserted bill
        int newBillId = BillDB.getLastInsertedBillId(); // Implement this method in BillDB

        // Update the bill ID for all tickets and add to arrayList
        List<Ticket> ticketList = new ArrayList<>();
        for (String seatName : listSeat) {
            ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(seatName, screen.getId());
            Ticket t = new Ticket(bill, filmDetail, screenSeat);
            ticketList.add(t);
        }
        
        //Send ticket list for user to buy more service
        request.setAttribute("ticketList",ticketList);
        
        request.getRequestDispatcher("").forward(request, response);
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
