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
import java.sql.ResultSet;

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

    public static Ticket getTicketById(int ticketId) {
        Ticket ticket = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Ticket WHERE ID = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, ticketId);
            rs = pst.executeQuery();

            if (rs.next()) {
                int billId = rs.getInt("BillId");
                int filmDetailID = rs.getInt("FilmDetailId");
                int screenSeatID = rs.getInt("ScreenSeatId");

                // Retrieve Bill object
                Bill bill = BillDB.getBill(billId); // Assuming you have a method in BillDB to get a bill by ID

                // Retrieve FilmDetail object
                FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID); // Assuming you have a method in FilmDetailDB to get a film detail by ID

                // Retrieve ScreenSeat object
                ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(screenSeatID); // Assuming you have a method in ScreenSeatDB to get a screen seat by ID

                // Create Ticket object
                ticket = new Ticket(ticketId, bill, filmDetail, screenSeat);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
            // Close resources in finally block
            try {
                if (rs != null) {
                    rs.close();
                }
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

        return ticket;
    }

    public static List<Ticket> getAllTickets() {
        List<Ticket> ticketList = new ArrayList<>();

        try (Connection con = getConnect(); PreparedStatement pst = con.prepareStatement("SELECT * FROM Ticket")) {
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    int ticketID = rs.getInt("ID");
                    int billID = rs.getInt("BillId");
                    int filmDetailID = rs.getInt("FilmDetailId");
                    int screenSeatID = rs.getInt("ScreenSeatId");

                    // Retrieve Bill object
                    Bill bill = BillDB.getBill(billID);

                    // Retrieve FilmDetail object
                    FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID);

                    // Retrieve ScreenSeat object
                    ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(screenSeatID);

                    // Create Ticket object
                    Ticket ticket = new Ticket(ticketID, bill, filmDetail, screenSeat);

                    // Add Ticket object to the list
                    ticketList.add(ticket);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return ticketList;
    }

    public static boolean addTicket(Ticket newTicket) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "INSERT INTO Ticket (BillId, FilmDetailId, ScreenSeatId) VALUES (?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setInt(1, newTicket.getBill().getId());
            pst.setInt(2, newTicket.getFilmDetail().getId());
            pst.setInt(3, newTicket.getScreenSeat().getId());

            int rowsAffected = pst.executeUpdate();

            // If rowsAffected is greater than 0, insertion was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        } finally {
            // Close resources in finally block
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

    public static boolean updateTicket(Ticket oldTicket, Ticket newTicket) {
        String sql = "UPDATE Ticket SET BillId=?, FilmDetailId=?, ScreenSeatId=? WHERE ID=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setInt(1, newTicket.getBill().getId());
            pstmt.setInt(2, newTicket.getFilmDetail().getId());
            pstmt.setInt(3, newTicket.getScreenSeat().getId());
            pstmt.setInt(4, oldTicket.getId());

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;

        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static boolean deleteTicket(Ticket ticket) {
        String sql = "DELETE FROM Ticket WHERE ID=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnect();
            pstmt = con.prepareStatement(sql);

            // Set the ID parameter for the prepared statement
            pstmt.setInt(1, ticket.getId());

            // Execute the SQL statement
            int rowsAffected = pstmt.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;

        } finally {
            // Close resources in finally block to ensure they are always closed
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
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
