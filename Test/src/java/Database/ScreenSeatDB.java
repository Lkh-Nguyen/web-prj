package Database;

import java.sql.*;
import Model.Screen;
import Model.ScreenSeat;
import java.util.ArrayList;
import java.util.List;

public class ScreenSeatDB implements DatabaseInfo {

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

    public static ScreenSeat getScreenSeat(String seatName, int screenID) {
        ScreenSeat screenSeat = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM ScreenSeat WHERE Name = ? AND ScreenId = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, seatName);
            pst.setInt(2, screenID);
            rs = pst.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                String type = rs.getString("Type");
                double price = rs.getDouble("Price");
                Screen screen = ScreenDB.getScreen(screenID);
                screenSeat = new ScreenSeat(id, name, type, price, screen);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
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
        return screenSeat;
    }

    public static List<ScreenSeat> getAllSeats(int screenID) {
        List<ScreenSeat> seatList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM ScreenSeat WHERE ScreenId = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, screenID);
            rs = pst.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                String type = rs.getString("Type"); // Assuming the type is stored in the database
                double price = rs.getDouble("Price"); // Assuming the price is stored in the database
                Screen screen = ScreenDB.getScreen(screenID);
                ScreenSeat seat = new ScreenSeat(id, name, type, price, screen);
                seatList.add(seat);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
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
        return seatList;
    }

    public static void main(String[] args) {

        // Test getScreenSeat method
        String seatName = "J10"; // Provide the desired seat name
        ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(seatName, 1);
        if (screenSeat != null) {
            System.out.println("Screen Seat Details:");
            System.out.println("ID: " + screenSeat.getId());
            System.out.println("Name: " + screenSeat.getName());
            System.out.println("Type: " + screenSeat.getType());
            System.out.println("Price: " + screenSeat.getPrice());
            System.out.println("Screen: " + screenSeat.getScreen().getName());
        } else {
            System.out.println("Screen seat not found!");
        }
    }
}
