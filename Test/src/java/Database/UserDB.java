package Database;

import Model.User;
import java.sql.*;

public class UserDB implements DatabaseInfo {

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

    public static User getUser(String email) {
        Connection con = getConnect();
        try {
            User u = null;
            PreparedStatement st = con.prepareStatement("SELECT * FROM [User] WHERE Email = ?");
            st.setString(1, email);
            java.sql.ResultSet rs = st.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("ID"));
                u.setName(rs.getString("Name"));
                u.setGender(rs.getString("Gender"));
                u.setDateOfBirth(rs.getDate("DateOfBirth"));
                u.setCmnd(rs.getString("CMND"));
                u.setPhoneNumber(rs.getString("PhoneNumber"));
                u.setEmail(rs.getString("Email"));
                u.setPassword(rs.getString("Password"));
                u.setAddress(rs.getString("Address"));
                u.setRole(rs.getInt("Role")); // Set the role
            }

            return u;
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

    public static boolean insertUser(User u) {
        Connection con = getConnect();
        try {
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO [User] (Name, Gender, DateOfBirth, CMND, PhoneNumber, Email, Password, Address, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            // Set parameters
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getGender());
            pstmt.setDate(3, u.getDateOfBirth());
            if (u.getCmnd() == null || u.getCmnd().isEmpty()) {
                pstmt.setNull(4, Types.CHAR);
            } else {
                pstmt.setString(4, u.getCmnd());
            }
            pstmt.setString(5, u.getPhoneNumber());
            pstmt.setString(6, u.getEmail());
            pstmt.setString(7, u.getPassword());
            if (u.getAddress() == null || u.getAddress().isEmpty()) {
                pstmt.setNull(8, Types.VARCHAR);
            } else {
                pstmt.setString(8, u.getAddress());
            }
            pstmt.setInt(9, u.getRole());

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

    public static boolean updateUser(User oldUser, User newUser) {
        String sql = "UPDATE [User] SET Name=?, Gender=?, DateOfBirth=?, CMND=?, PhoneNumber=?, Email=?, Password=?, Address=? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = UserDB.getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newUser.getName());
            pstmt.setString(2, newUser.getGender());
            pstmt.setDate(3, newUser.getDateOfBirth());

            // Check if CMND is null or empty
            if (newUser.getCmnd() == null || newUser.getCmnd().isEmpty()) {
                pstmt.setNull(4, Types.CHAR);
            } else {
                pstmt.setString(4, newUser.getCmnd());
            }

            pstmt.setString(5, newUser.getPhoneNumber());
            pstmt.setString(6, newUser.getEmail());
            pstmt.setString(7, newUser.getPassword());
            pstmt.setString(8, newUser.getAddress());
            pstmt.setString(9, oldUser.getEmail()); // Assuming email is the unique identifier

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

    public static boolean changePassword(User currentUser, String newPassword) {
        String sql = "UPDATE [User] SET Password=? WHERE Email=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = UserDB.getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newPassword);
            pstmt.setString(2, currentUser.getEmail()); // Assuming email is the identifier for the user

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

    }

}
