package Database;

import Model.Bill;
import Model.FilmDetail;
import Model.ScreenSeat;
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

    public static ArrayList<Ticket> getTicketsByBillID(int billID) {
        ArrayList<Ticket> ticketList = new ArrayList<>();

        try (Connection con = getConnect(); PreparedStatement pst = con.prepareStatement("SELECT * FROM Ticket WHERE BillId = ?")) {
            pst.setInt(1, billID);

            try (java.sql.ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    int ticketID = rs.getInt("ID");
                    int filmDetailID = rs.getInt("FilmDetailId");
                    int screenSeatID = rs.getInt("ScreenSeatId");

                    // Retrieve Bill object
                    Bill bill = BillDB.getBill(billID); // Assuming you have a method in BillDB to get a bill by ID

                    // Retrieve FilmDetail object
                    FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID); // Assuming you have a method in FilmDetailDB to get a film detail by ID

                    // Retrieve ScreenSeat object
                    ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(screenSeatID); // Assuming you have a method in ScreenSeatDB to get a screen seat by ID

                    // Create Ticket object and add it to the list
                    Ticket ticket = new Ticket(ticketID, bill, filmDetail, screenSeat);
                    ticketList.add(ticket);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return ticketList;
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
