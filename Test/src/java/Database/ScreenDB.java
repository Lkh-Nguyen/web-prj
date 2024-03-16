package Database;

import Model.Screen;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScreenDB implements DatabaseInfo {

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

    public static Screen getScreen(int screenID) {
        Connection con = getConnect();
        if (con != null) {
            try {
                String query = "SELECT id, name FROM Screen WHERE id = ?";
                PreparedStatement statement = con.prepareStatement(query);
                statement.setInt(1, screenID);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    return new Screen(id, name);
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

    public static List<Screen> getAllScreens() {
        List<Screen> screens = new ArrayList<>();
        Connection con = getConnect();
        if (con != null) {
            try {
                String query = "SELECT id, name FROM Screen";
                PreparedStatement statement = con.prepareStatement(query);
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    screens.add(new Screen(id, name));
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
        return screens;
    }

    public static void main(String[] args) {
        // Test getScreen method
        int screenID = 3; // Provide the desired screen ID
        Screen screen = ScreenDB.getScreen(screenID);
        if (screen != null) {
            System.out.println("Screen details:");
            System.out.println("ID: " + screen.getId());
            System.out.println("Name: " + screen.getName());
        } else {
            System.out.println("Screen not found!");
        }
    }
}
