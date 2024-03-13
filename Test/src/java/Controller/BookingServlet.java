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
public class BookingServlet extends HttpServlet {

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
        String fdIDString = request.getParameter("fdID");
        int fdID = Integer.parseInt(fdIDString);
        FilmDetail filmDetail = FilmDetailDB.getFilmDetail(fdID);
        if (filmDetail == null) {
            response.sendRedirect("home");
        } else {
            List<String> bookedSeats = TicketDB.getBookedSeats(fdID);
            request.setAttribute("filmDetail", filmDetail);
            request.setAttribute("bookedSeats", bookedSeats);
            request.getRequestDispatcher("full_seat.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        //Get film detail
        int filmDetailID = Integer.parseInt(request.getParameter("fdID"));
        FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID);
        //Get seat
        String listSeatString = request.getParameter("listSeat");
        if (listSeatString == null || listSeatString.isEmpty()) {
            response.sendRedirect("booking?fdID=" + filmDetailID);
            return;
        }
        String[] listSeat = listSeatString.split(",");
        Screen screen = filmDetail.getScreen();

        //Get price
        int price = Integer.parseInt(request.getParameter("price"));

        // Update the bill ID for all tickets and add to arrayList
        List<Ticket> ticketList = new ArrayList<>();
        List<ScreenSeat> seatList = new ArrayList<>();
        for (String seatName : listSeat) {
            ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(seatName, screen.getId());
            seatList.add(screenSeat);
            Ticket t = new Ticket(null, filmDetail, screenSeat);
            ticketList.add(t);
        }

        //Send ticket list for user to buy more service
        session.setAttribute("ticketList", ticketList);
        session.setAttribute("price", price);
        session.setAttribute("filmDetail", filmDetail);
        session.setAttribute("listSeatString", listSeatString);
        request.getRequestDispatcher("full_service.jsp").forward(request, response);
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
