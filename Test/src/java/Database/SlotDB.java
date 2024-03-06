package Database;

import Model.Slot;
import java.sql.*;
import java.time.LocalTime;

public class SlotDB implements DatabaseInfo {

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

    public static Slot getSlot(int slotID) {
        Connection con = getConnect();
        if (con != null) {
            try {
                String query = "SELECT startTime, endTime FROM Slot WHERE id = ?";
                PreparedStatement statement = con.prepareStatement(query);
                statement.setInt(1, slotID);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    LocalTime startTime = rs.getTime("startTime").toLocalTime();
                    LocalTime endTime = rs.getTime("endTime").toLocalTime();
                    return new Slot(slotID, startTime, endTime);
                }
            } catch (SQLException e) {
                System.out.println("Error: " + e);
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("Error closing connection: " + e);
                }
            }
        }
        return null;
    }

    public static void main(String[] args) {
        // Test getSlot method
        int slotID = 1; // Provide the desired slot ID
        Slot slot = SlotDB.getSlot(slotID);
        if (slot != null) {
            System.out.println("Slot details:");
            System.out.println("ID: " + slot.getId());
            System.out.println("Start Time: " + slot.getStartTime());
            System.out.println("End Time: " + slot.getEndTime());
        } else {
            System.out.println("Slot not found!");
        }
    }
}
