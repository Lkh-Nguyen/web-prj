/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import java.sql.*;
import Model.Ticket;

/**
 *
 * @author ASUS
 */
public class TicketDB implements DatabaseInfo {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public static void insertTicket(Ticket t) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "INSERT INTO Ticket (UserId, Price, Date, FilmDetailId, ScreenSeatId) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setInt(1, t.getUser().getId());
            pst.setFloat(2, t.getPrice());
            pst.setDate(3, t.getDate());
            pst.setInt(4, t.getFilmDetail().getId());
            pst.setInt(5, t.getScreenSeat().getId());
            pst.executeUpdate();
            System.out.println("Ticket inserted successfully.");
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("Error closing resources: " + e);
            }
        }
    }

}
