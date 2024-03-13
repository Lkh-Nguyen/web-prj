package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Bill;
import Model.User;
import java.util.ArrayList;
import java.util.List;

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

    public static Bill getBill(int billID) {
        Bill bill = null;
        Connection con = null;
        PreparedStatement pst = null;
        java.sql.ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Bill WHERE Id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, billID);
            rs = pst.executeQuery();

            if (rs.next()) {
                // Retrieve bill details from the result set
                java.sql.Date date = rs.getDate("Date");
                float totalPrice = rs.getFloat("TotalPrice");
                // Assuming you have a method to retrieve User by ID
                // Replace getUserByID() with appropriate method
                User user = UserDB.getUser(rs.getInt("UserID"));
                // Create a Bill object
                bill = new Bill(date, totalPrice, user);
                bill.setId(billID);
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

        return bill;
    }

    public static List<Bill> getBillsByUserID(int userID) {
        List<Bill> bills = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        java.sql.ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Bill WHERE UserID = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, userID);
            rs = pst.executeQuery();

            while (rs.next()) {
                int billID = rs.getInt("Id");
                java.sql.Date date = rs.getDate("Date");
                float totalPrice = rs.getFloat("TotalPrice");
                User user = UserDB.getUser(userID); // Assuming you have a method to retrieve User by ID
                Bill bill = new Bill(date, totalPrice, user);
                bill.setId(billID);
                bills.add(bill);
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

        return bills;
    }
}
