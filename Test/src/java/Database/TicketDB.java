package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Ticket;

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
        try (Connection con = getConnect();
             PreparedStatement pst = con.prepareStatement("INSERT INTO Ticket (BillId, FilmDetailId, ScreenSeatId) VALUES (?, ?, ?)")) {

            pst.setInt(1, ticket.getBill().getId());
            pst.setInt(2, ticket.getFilmDetail().getId());
            pst.setInt(3, ticket.getScreenSeat().getId());

            pst.executeUpdate();
            System.out.println("Ticket inserted successfully.");
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
}
