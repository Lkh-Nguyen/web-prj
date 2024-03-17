/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.FilmDB;
import Model.Film;
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
public class Admin_Update_Film extends HttpServlet {

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
            out.println("<title>Servlet Admin_Update_Film</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin_Update_Film at " + request.getContextPath() + "</h1>");
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
        int id = Integer.parseInt(request.getParameter("filmId"));
        Film f = FilmDB.getFilm(id);
        HttpSession session = request.getSession();
        request.setAttribute("film", f);
        session.setAttribute("filmList", FilmDB.getAllFilms());
        request.getRequestDispatcher("full_admin_film.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("filmId"));
        String urlImg = request.getParameter("urlFilm");
        String filmName = request.getParameter("name");
        String filmType = request.getParameter("type");
        int filmDuration = Integer.parseInt(request.getParameter("duration"));
        String filmStartDate = request.getParameter("startDate");
        String filmActor = request.getParameter("actor");
        String filmRate = request.getParameter("rate");
        String filmDirector = request.getParameter("director");
        String filmLanguage = request.getParameter("language");
        String filmDetail = request.getParameter("detail");
        String filmUrlTrailer = request.getParameter("urlTrailer");
        java.sql.Date startDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            startDate = new java.sql.Date(dateFormat.parse(filmStartDate).getTime());
        } catch (ParseException e) {
            e.printStackTrace(); // Handle parsing exception appropriately
        }
        Film newfilm = new Film(filmDirector, filmLanguage, urlImg, filmName, filmType, filmDuration, startDate, filmActor, filmDetail, filmUrlTrailer, filmRate);
        FilmDB.updateFilm(newfilm,id);
        HttpSession session = request.getSession();
        session.setAttribute("filmList", FilmDB.getAllFilms());
        request.getRequestDispatcher("full_admin_film.jsp").forward(request, response);
        // Update the session with the new user information
         
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
