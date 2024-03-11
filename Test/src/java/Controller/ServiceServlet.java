/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Database.ServiceDB;
import Model.FilmDetail;
import Model.Service;
import Model.ServiceUsage;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ServiceServlet extends HttpServlet {

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
            out.println("<title>Servlet ServiceServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceServlet at " + request.getContextPath() + "</h1>");
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
        if (filmDetail==null){
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
        //        session.setAttribute("ticketList", ticketList);
        //        session.setAttribute("price", price);
        //        session.setAttribute("filmDetail", filmDetail);
        //        session.setAttribute("listSeatString", listSeatString);
        //Những dữ liệu đã có trong session, cập nhật giá + đồ ăn nước uống

        //Update price
        Integer price = Integer.valueOf(request.getParameter("price"));
        session.setAttribute("price", price);
        //Handle ordererd service
        String listServiceSizeString = request.getParameter("listServiceSize");
        int listServiceSize = Integer.parseInt(listServiceSizeString);
        List<ServiceUsage> orderedService = new ArrayList<>();
        for (int i = 1; i <= listServiceSize; i++) {
            String foodDrink = request.getParameter("full_FD" + i);
            System.out.println("foodDrink:" + foodDrink);
            String[] foodDrinkStrings = foodDrink.split(":");
            if ("0".equals(foodDrinkStrings[1])) {
                continue;
            }
            Integer serviceID = Integer.valueOf(foodDrinkStrings[0]);
            Service service = ServiceDB.getServiceById(serviceID);
            Integer amount = Integer.valueOf(foodDrinkStrings[1]);
            ServiceUsage su = new ServiceUsage(service, amount, null);
            orderedService.add(su);
        }
        session.setAttribute("orderedService", orderedService);
        //Send to payment
        request.getRequestDispatcher("full_payment.jsp").forward(request, response);
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
