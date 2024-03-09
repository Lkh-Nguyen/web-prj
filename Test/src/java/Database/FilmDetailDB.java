package Database;

import Model.FilmDetail;
import Model.Screen;
import Model.Film;
import Model.Slot;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FilmDetailDB implements DatabaseInfo {

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

    public static FilmDetail getFilmDetail(int filmDetailID) {
        FilmDetail filmDetail = null;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM FilmDetail WHERE Id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, filmDetailID);
            rs = pst.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("Id");
                int screenId = rs.getInt("ScreenId");
                int filmId = rs.getInt("FilmId");
                int filmSlotId = rs.getInt("FilmSlotId");
                Date movieDate = rs.getDate("MovieDate");

                // Fetch related entities
                Screen screen = ScreenDB.getScreen(screenId);
                Film film = FilmDB.getFilm(filmId);
                Slot filmSlot = SlotDB.getSlot(filmSlotId);

                filmDetail = new FilmDetail(id, screen, film, filmSlot, movieDate);
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
        return filmDetail;
    }

    public static List<FilmDetail> getFilmsFromDate(Integer fid) {
        List<FilmDetail> filmDetails = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        LocalDate today = LocalDate.now(); // Get today's date dynamically

        try {
            con = getConnect();
            StringBuilder queryBuilder = new StringBuilder("SELECT * FROM FilmDetail WHERE ");

            if (fid != null) {
                queryBuilder.append("FilmId = ? ");
            } else {
                queryBuilder.append("MovieDate >= ? ");
            }

            pst = con.prepareStatement(queryBuilder.toString());

            if (fid != null) {
                pst.setInt(1, fid);
            } else {
                pst.setDate(1, Date.valueOf(today));
            }

            rs = pst.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("Id");
                int fetchedFilmID = rs.getInt("FilmId");
                int fetchedScreenID = rs.getInt("ScreenId");
                int fetchedFilmSlotID = rs.getInt("FilmSlotId");
                Date fetchedMovieDate = rs.getDate("MovieDate");

                // Assuming you have methods to get Screen, Film, and Slot
                Screen screen = ScreenDB.getScreen(fetchedScreenID);
                Film film = FilmDB.getFilm(fetchedFilmID);
                Slot filmSlot = SlotDB.getSlot(fetchedFilmSlotID);

                FilmDetail filmDetail = new FilmDetail(id, screen, film, filmSlot, fetchedMovieDate);
                filmDetails.add(filmDetail);
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
        return filmDetails;
    }

    public static void main(String[] args) {
        // Test getFilmDetail method
        int filmDetailID = 1; // Provide the desired film detail ID
        FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID);
        if (filmDetail != null) {
            System.out.println("Film Detail:");
            System.out.println("ID: " + filmDetail.getId());
            System.out.println("Screen: " + filmDetail.getScreen().getName()); // Assuming Screen has a getName() method
            System.out.println("Film: " + filmDetail.getFilm().getName()); // Assuming Film has a getName() method
            System.out.println("Slot Start Time: " + filmDetail.getFilmSlot().getStartTime()); // Assuming Slot has a getStartTime() method
            System.out.println("Slot End Time: " + filmDetail.getFilmSlot().getEndTime()); // Assuming Slot has a getEndTime() method
            System.out.println("Movie Date: " + filmDetail.getMovieDate());
        } else {
            System.out.println("Film detail not found!");
        }
    }
}
