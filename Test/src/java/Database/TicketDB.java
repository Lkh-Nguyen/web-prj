package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Ticket;
import java.util.ArrayList;
import java.util.List;

public class TicketDB implements DatabaseInfo {

    public static Connection getConnect() throws SQLException {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        return DriverManager.getConnection(DBURL, USERDB, PASSDB);
    }

    public static void insertTicket(Ticket ticket) {
        try (Connection con = getConnect(); PreparedStatement pst = con.prepareStatement("INSERT INTO Ticket (BillId, FilmDetailId, ScreenSeatId) VALUES (?, ?, ?)")) {

            pst.setInt(1, ticket.getBill().getId());
            pst.setInt(2, ticket.getFilmDetail().getId());
            pst.setInt(3, ticket.getScreenSeat().getId());

            pst.executeUpdate();
            System.out.println("Ticket inserted successfully.");
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }

    public static List<String> getBookedSeats(int filmDetailId) {
        List<String> bookedSeats = new ArrayList<>();

        try (Connection con = getConnect(); PreparedStatement pst = con.prepareStatement("SELECT s.Name FROM Ticket t JOIN ScreenSeat s ON t.ScreenSeatId = s.Id WHERE t.FilmDetailId = ?")) {

            pst.setInt(1, filmDetailId);
            try (java.sql.ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    String screenSeatName = rs.getString("Name");
                    bookedSeats.add(screenSeatName);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return bookedSeats;
    }

    public static void main(String[] args) {
        // Assuming filmDetailId is 2 for testing purposes
        int filmDetailId = 2;

        // Call the getBookedSeats method
        List<String> bookedSeats = TicketDB.getBookedSeats(filmDetailId);

        // Print the booked seats
        System.out.println("Booked Seats:");
        for (String seat : bookedSeats) {
            System.out.println(seat);
        }
    }
}
