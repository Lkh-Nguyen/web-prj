/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Film;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class FilmDB implements DatabaseInfo {

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

    public static List<Film> getAllFilms() {
        List<Film> films = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Film"; // Assuming 'films' is the name of your table
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String url = rs.getString("url");
                String name = rs.getString("name");
                String type = rs.getString("type");
                int duration = rs.getInt("duration");
                Date startDate = rs.getDate("startDate");
                String actor = rs.getString("actor");
                String detail = rs.getString("detail");
                String trailer = rs.getString("trailer"); // trailer can be null
                String rate = rs.getString("rate");

                Film film = new Film(id, url, name, type, duration, startDate, actor, detail, trailer, rate);
                films.add(film);
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
        return films;
    }

    public static void main(String[] args) {
           System.out.println(getAllFilms());
    }
}
