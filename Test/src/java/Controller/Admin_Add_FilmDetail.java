/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Database.FilmDB;
import Database.FilmDetailDB;
import Database.ScreenDB;
import Database.SlotDB;
import Model.Film;
import Model.FilmDetail;
import Model.Screen;
import Model.Slot;
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
public class Admin_Add_FilmDetail extends HttpServlet {
   
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
            out.println("<title>Servlet Admin_Add_FilmDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin_Add_FilmDetail at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("full_admin_filmDetail.jsp").forward(request, response);
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
        int filmId = 0;
        int screenId = 0;
        int slotId = 0;

        try {
            filmId = Integer.parseInt(request.getParameter("idFilm"));
            screenId = Integer.parseInt(request.getParameter("idScreen"));
            slotId = Integer.parseInt(request.getParameter("filmSlotID"));
        } catch (NumberFormatException e) {
            // Xử lý khi có lỗi chuyển đổi dữ liệu sang int
            e.printStackTrace(); // hoặc log lỗi, hoặc thông báo cho người dùng về lỗi nhập liệu
        }
        java.sql.Date filmStartDay = null;

        try {
            String filmStartDate = request.getParameter("dateMoive");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            filmStartDay = new java.sql.Date(dateFormat.parse(filmStartDate).getTime());
        } catch (ParseException e) {
            // Xử lý khi có lỗi trong quá trình chuyển đổi ngày
            e.printStackTrace(); // hoặc log lỗi, hoặc thông báo cho người dùng về lỗi nhập liệu
        }
        Film film = FilmDB.getFilm(filmId);
        Screen screen = ScreenDB.getScreen(screenId);
        Slot slot = SlotDB.getSlot(slotId);
        FilmDetail newFilmDetail = new FilmDetail(screen, film, slot, filmStartDay);
        FilmDetailDB.addFilmDetail(newFilmDetail);
        HttpSession session = request.getSession();
        session.setAttribute("filmDetailList", FilmDetailDB.getFilmDetails());
        request.getRequestDispatcher("full_admin_filmDetail.jsp").forward(request, response);
//        PrintWriter out = response.getWriter();
//        out.print(film);
//        out.print(screen);
//        out.print(slot);
        
        
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
