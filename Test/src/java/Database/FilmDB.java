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
        java.sql.ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Film"; // Assuming 'films' is the name of your table
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                String director = rs.getString("director");
                String language = rs.getString("language");
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

                Film film = new Film(director, language, id, url, name, type, duration, startDate, actor, detail, trailer, rate);
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

    public static Film getFilm(int filmID) {
        Film film = null;
        Connection con = null;
        PreparedStatement pst = null;
        java.sql.ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM Film WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, filmID);
            rs = pst.executeQuery();

            if (rs.next()) {
                String director = rs.getString("director");
                String language = rs.getString("language");
                String url = rs.getString("url");
                String name = rs.getString("name");
                String type = rs.getString("type");
                int duration = rs.getInt("duration");
                Date startDate = rs.getDate("startDate");
                String actor = rs.getString("actor");
                String detail = rs.getString("detail");
                String trailer = rs.getString("trailer"); // trailer can be null
                String rate = rs.getString("rate");

                film = new Film(director, language, filmID, url, name, type, duration, startDate, actor, detail, trailer, rate);
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
        return film;
    }

    public static boolean deleteFilm(int filmID) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "DELETE FROM Film WHERE id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, filmID);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was deleted
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false;
        } finally {
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

    public static void addFilm(Film film) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "INSERT INTO Film (director, language, url, name, type, duration, startDate, actor, detail, trailer, rate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, film.getDirector());
            pst.setString(2, film.getLanguage());
            pst.setString(3, film.getUrl());
            pst.setString(4, film.getName());
            pst.setString(5, film.getType());
            pst.setInt(6, film.getDuration());
            pst.setDate(7, new java.sql.Date(film.getStartDate().getTime()));
            pst.setString(8, film.getActor());
            pst.setString(9, film.getDetail());
            pst.setString(10, film.getTrailer());
            pst.setString(11, film.getRate());

            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        } finally {
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

    public static void updateFilm(Film film,int id) {
    Connection con = null;
    PreparedStatement pst = null;

    try {
        con = getConnect();
        String query = "UPDATE Film SET director=?, language=?, url=?, name=?, type=?, duration=?, startDate=?, actor=?, detail=?, trailer=?, rate=? WHERE id=?";
        pst = con.prepareStatement(query);
        pst.setString(1, film.getDirector());
        pst.setString(2, film.getLanguage());
        pst.setString(3, film.getUrl());
        pst.setString(4, film.getName());
        pst.setString(5, film.getType());
        pst.setInt(6, film.getDuration());
        pst.setDate(7, new java.sql.Date(film.getStartDate().getTime()));
        pst.setString(8, film.getActor());
        pst.setString(9, film.getDetail());
        pst.setString(10, film.getTrailer());
        pst.setString(11, film.getRate());
        pst.setInt(12, id); // Sử dụng filmId để xác định bộ phim cần cập nhật

        pst.executeUpdate();
    } catch (SQLException e) {
        System.out.println("Error: " + e);
    } finally {
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

    public static void main(String[] args) {
//        // Test getFilm method
//        int filmID = 1; // Provide the desired film ID
//        Film film = getFilm(filmID);
//        if (film != null) {
//            System.out.println("Film details:");
//            System.out.println("ID: " + film.getId());
//            System.out.println("Director: " + film.getDirector());
//            System.out.println("Language: " + film.getLanguage());
//            System.out.println("URL: " + film.getUrl());
//            System.out.println("Name: " + film.getName());
//            System.out.println("Type: " + film.getType());
//            System.out.println("Duration: " + film.getDuration());
//            System.out.println("Start Date: " + film.getStartDate());
//            System.out.println("Actor: " + film.getActor());
//            System.out.println("Detail: " + film.getDetail());
//            System.out.println("Trailer: " + film.getTrailer());
//            System.out.println("Rate: " + film.getRate());
//        } else {
//            System.out.println("Film not found!");
//        }
        String dateString = "2024-03-15"; // Chuỗi định dạng yyyy-[m]m-[d]d
        java.sql.Date date = java.sql.Date.valueOf(dateString);
        Film film = new Film("12312", "123", "123", "123", "123", 123,date, "123", "123", "123", "123");
         FilmDB.updateFilm(film, 1020);

    }
}
