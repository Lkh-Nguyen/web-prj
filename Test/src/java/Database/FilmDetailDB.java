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
    public static List<FilmDetail> getFilmDetails() {
        List<FilmDetail> filmDetails = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = getConnect();
            String query = "SELECT * FROM FilmDetail";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("Id");
                int screenId = rs.getInt("ScreenId");
                int filmId = rs.getInt("FilmId");
                int filmSlotId = rs.getInt("FilmSlotId");
                Date movieDate = rs.getDate("MovieDate");

                // Fetch related entities
                Screen screen = ScreenDB.getScreen(screenId);
                Film film = FilmDB.getFilm(filmId);
                Slot filmSlot = SlotDB.getSlot(filmSlotId);

                FilmDetail filmDetail = new FilmDetail(id, screen, film, filmSlot, movieDate);
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
    public static boolean deleteFilmDetail(int filmDetailID) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "DELETE FROM FilmDetail WHERE Id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, filmDetailID);
            int rowsAffected = pst.executeUpdate();
            System.out.println("FilmDetail with ID " + filmDetailID + " has been deleted successfully.");
            return rowsAffected > 0; // Trả về true nếu có ít nhất một hàng bị ảnh hưởng bởi câu lệnh DELETE
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            return false; // Trả về false nếu có lỗi xảy ra
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
    public static void updateFilmDetail(FilmDetail oldFilmDetail, FilmDetail newFilmDetail) {
        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = getConnect();
            String query = "UPDATE FilmDetail SET ScreenId = ?, FilmId = ?, FilmSlotId = ?, MovieDate = ? WHERE Id = ?";
            pst = con.prepareStatement(query);
            pst.setInt(1, newFilmDetail.getScreen().getId());
            pst.setInt(2, newFilmDetail.getFilm().getId());
            pst.setInt(3, newFilmDetail.getFilmSlot().getId());
            pst.setDate(4, new java.sql.Date(newFilmDetail.getMovieDate().getTime()));
            pst.setInt(5, oldFilmDetail.getId());
            pst.executeUpdate();
            System.out.println("FilmDetail with ID " + oldFilmDetail.getId() + " has been updated successfully.");
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
    public static void addFilmDetail(FilmDetail newFilmDetail) {
    Connection con = null;
    PreparedStatement pst = null;

    try {
        con = getConnect();
        String query = "INSERT INTO FilmDetail (ScreenId, FilmId, FilmSlotId, MovieDate) VALUES (?, ?, ?, ?)";
        pst = con.prepareStatement(query);
        pst.setInt(1, newFilmDetail.getScreen().getId());
        pst.setInt(2, newFilmDetail.getFilm().getId());
        pst.setInt(3, newFilmDetail.getFilmSlot().getId());
        pst.setDate(4, new java.sql.Date(newFilmDetail.getMovieDate().getTime()));
        pst.executeUpdate();
        System.out.println("FilmDetail has been added successfully.");
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
        // Test getFilmDetail method
//        int filmDetailID = 1; // Provide the desired film detail ID
//        FilmDetail filmDetail = FilmDetailDB.getFilmDetail(filmDetailID);
//        if (filmDetail != null) {
//            System.out.println("Film Detail:");
//            System.out.println("ID: " + filmDetail.getId());
//            System.out.println("Screen: " + filmDetail.getScreen().getName()); // Assuming Screen has a getName() method
//            System.out.println("Film: " + filmDetail.getFilm().getName()); // Assuming Film has a getName() method
//            System.out.println("Slot Start Time: " + filmDetail.getFilmSlot().getStartTime()); // Assuming Slot has a getStartTime() method
//            System.out.println("Slot End Time: " + filmDetail.getFilmSlot().getEndTime()); // Assuming Slot has a getEndTime() method
//            System.out.println("Movie Date: " + filmDetail.getMovieDate());
//        } else {
//            System.out.println("Film detail not found!");
//        }
    
            for(FilmDetail f : FilmDetailDB.getFilmDetails()){
                System.out.println(f.toString());
            }
    }
}
