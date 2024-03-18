/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Database.BillDB;
import Database.FilmDetailDB;
import Database.ScreenSeatDB;
import Database.TicketDB;
import Model.Bill;
import Model.FilmDetail;
import Model.ScreenSeat;
import Model.Ticket;
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
public class Admin_Add_Ticket extends HttpServlet {
   
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
            out.println("<title>Servlet Admin_Add_Ticket</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin_Add_Ticket at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("full_admin_ticket.jsp").forward(request, response);
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
        int billId = Integer.parseInt(request.getParameter("billId"));
        int filmDetailId = Integer.parseInt(request.getParameter("filmDetailId"));
        int screenSeatId = Integer.parseInt(request.getParameter("screenSeatId"));
        Bill bill = BillDB.getBill(billId);
        FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailId);
        ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(screenSeatId);
        Ticket ticket = new Ticket(bill, filmDetail, screenSeat);
        TicketDB.addTicket(ticket);
        HttpSession session = request.getSession();
        session.setAttribute("ticketList", TicketDB.getAllTickets());
        request.getRequestDispatcher("full_admin_ticket.jsp").forward(request, response);

    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
