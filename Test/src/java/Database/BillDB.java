package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Bill;

public class BillDB implements DatabaseInfo {

    public static Connection getConnect() throws SQLException {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        return DriverManager.getConnection(DBURL, USERDB, PASSDB);
    }

    public static void insertBill(Bill bill) {
        try (Connection con = getConnect(); PreparedStatement pst = con.prepareStatement(
                "INSERT INTO Bill (Date, TotalPrice, UserID) VALUES (?, ?, ?)")) {

            pst.setDate(1, bill.getDate());
            pst.setFloat(2, bill.getTotalPrice());
            pst.setInt(3, bill.getUser().getId());

            pst.executeUpdate();
            System.out.println("Bill inserted successfully.");
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
    }
    
    public static int getLastInsertedBillId() {
        Connection con = null;
        PreparedStatement pst = null;
        java.sql.ResultSet rs = null;
        int lastInsertedId = -1; // Default value if no bill is found

        try {
            con = getConnect();
            String query = "SELECT MAX(Id) AS LastId FROM Bill"; // Assuming the primary key column is named Id
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                lastInsertedId = rs.getInt("LastId");
            }
        } catch (SQLException e) {
            // Handle the SQL exception appropriately (e.g., log the error)
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
                // Handle the SQL exception appropriately (e.g., log the error)
                System.out.println("Error closing resources: " + e);
            }
        }

        return lastInsertedId;
    }
}
