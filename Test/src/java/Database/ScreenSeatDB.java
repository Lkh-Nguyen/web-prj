/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import java.sql.*;
import Model.Screen;
import Model.ScreenSeat;

/**
 *
 * @author ASUS
 */
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

    public static ScreenSeat getScreenSeat(String seatName, Screen screen) {
        ScreenSeat screenSeat = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM ScreenSeat WHERE Name = ? AND ScreenId = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, seatName);
            pst.setInt(2, screen.getId());
            rs = pst.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                screenSeat = new ScreenSeat(id, name, screen);
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

    public static void main(String[] args) {
        // Create a sample Screen
        Screen screen = new Screen(1, "Screen 1");

        // Test getScreenSeat method
        String seatName = "J10"; // Provide the desired seat name
        ScreenSeat screenSeat = ScreenSeatDB.getScreenSeat(seatName, screen);
        if (screenSeat != null) {
            System.out.println("Screen Seat Details:");
            System.out.println("ID: " + screenSeat.getId());
            System.out.println("Name: " + screenSeat.getName());
            System.out.println("Screen: " + screenSeat.getScreen().getName());
        } else {
            System.out.println("Screen seat not found!");
        }
    }
}
