package Database;

import Model.Customer;
import java.sql.*;

public class CustomerDB implements DatabaseInfo {

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

    public static Customer getCustomer(String email) {
        Connection con = getConnect();
        try {
            Customer c = null;
            PreparedStatement st = con.prepareStatement("SELECT * FROM Customers WHERE Email = ?");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                c = new Customer();
                c.setId(rs.getInt("ID"));
                c.setName(rs.getString("Name"));
                c.setGender(rs.getString("Gender"));
                c.setDateOfBirth(rs.getDate("DateOfBirth"));
                c.setCmnd(rs.getString("CMND"));
                c.setPhoneNumber(rs.getString("PhoneNumber"));
                c.setEmail(rs.getString("Email"));
                c.setPassword(rs.getString("Password"));
                c.setAddress(rs.getString("Address"));
            }

            return c;
        } catch (SQLException ex) {
            // Handle exceptions appropriately (log or throw)
            ex.printStackTrace();
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                // Handle exceptions appropriately (log or throw)
                ex.printStackTrace();
            }
        }

        return null;
    }

    public static boolean insertCustomer(Customer c) {
        Connection con = getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO customers (name, gender, dateofbirth, cmnd, phonenumber, email, password, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters
            pstmt.setString(1, c.getName());
            pstmt.setString(2, c.getGender());
            pstmt.setDate(3, c.getDateOfBirth());
            if (c.getCmnd() == null || c.getCmnd().isEmpty()) {
                pstmt.setNull(4, Types.CHAR);
            } else {
                pstmt.setString(4, c.getCmnd());
            }
            pstmt.setString(5, c.getPhoneNumber());
            pstmt.setString(6, c.getEmail());
            pstmt.setString(7, c.getPassword());
            if (c.getAddress() == null || c.getAddress().isEmpty()) {
                pstmt.setNull(8, Types.VARCHAR);
            } else {
                pstmt.setString(8, c.getAddress());
            }

            // Execute the SQL statement
            int rowsInserted = pstmt.executeUpdate();

            // Close resources
            pstmt.close();
            con.close();

            // Return true if at least one row was inserted
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Handle database error appropriately
        } finally {
            // Close resources in a finally block
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace(); // Handle database error appropriately
            }
        }
        return false;
    }

   public static boolean updateCustomer(Customer oldCustomer, Customer newCustomer) {
        String sql = "UPDATE customers SET name=?, gender=?, dateOfBirth=?, cmnd=?, phoneNumber=?, email=?, password=?, address=? WHERE email=?";
        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            con = CustomerDB.getConnect();
            pstmt = con.prepareStatement(sql);
            
            // Set parameters for the prepared statement
            pstmt.setString(1, newCustomer.getName());
            pstmt.setString(2, newCustomer.getGender());
            pstmt.setDate(3, newCustomer.getDateOfBirth());
            
            // Check if cmnd is null or empty
            if (newCustomer.getCmnd() == null || newCustomer.getCmnd().isEmpty()) {
                pstmt.setNull(4, Types.CHAR);
            } else {
                pstmt.setString(4, newCustomer.getCmnd());
            }
            
            pstmt.setString(5, newCustomer.getPhoneNumber());
            pstmt.setString(6, newCustomer.getEmail());
            pstmt.setString(7, newCustomer.getPassword());
            
            // Set address parameter from the newCustomer object
            pstmt.setString(8, newCustomer.getAddress());
            
            pstmt.setString(9, oldCustomer.getEmail()); // Assuming email is unique identifier

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
  public static boolean changePassword(Customer cu, String newPassWord) {
    String sql = "UPDATE customers SET password=? WHERE email=?";
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = CustomerDB.getConnect();
        pstmt = con.prepareStatement(sql);

        // Set parameters for the prepared statement
        pstmt.setString(1, newPassWord);
        pstmt.setString(2, cu.getEmail()); // Assuming email is the identifier for the customer

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
        System.out.println(getCustomer("alice@example.com"));
        
    }

}
