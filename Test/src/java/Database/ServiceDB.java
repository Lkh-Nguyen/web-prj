/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Service;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ServiceDB implements DatabaseInfo {

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

    public static List<Service> getAllServices() {
        List<Service> services = new ArrayList<>();

        try (
                Connection con = getConnect(); PreparedStatement ps = con.prepareStatement("SELECT * FROM Service"); java.sql.ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String url = rs.getString("url");

                Service service = new Service();
                service.setId(id);
                service.setName(name);
                service.setPrice(price);
                service.setUrl(url);

                services.add(service);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return services;
    }

    public static Service getServiceById(int serviceId) {
        Service service = null;

        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement("SELECT * FROM Service WHERE id = ?");) {
            ps.setInt(1, serviceId);
            try (java.sql.ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    String url = rs.getString("url");

                    service = new Service();
                    service.setId(id);
                    service.setName(name);
                    service.setPrice(price);
                    service.setUrl(url);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return service;
    }

    public static boolean updateService(Service oldService, Service newService) {
        String sql = "UPDATE Service SET name=?, price=?, url=? WHERE id=?";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newService.getName());
            pstmt.setDouble(2, newService.getPrice());
            pstmt.setString(3, newService.getUrl());
            pstmt.setInt(4, oldService.getId());

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

    public static boolean addService(Service newService) {
        String sql = "INSERT INTO Service (name, price, url) VALUES (?, ?, ?)";
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = getConnect();
            pstmt = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pstmt.setString(1, newService.getName());
            pstmt.setDouble(2, newService.getPrice());
            pstmt.setString(3, newService.getUrl());

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
    public static boolean deleteService(int serviceId) {
    String sql = "DELETE FROM Service WHERE id=?";
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = getConnect();
        pstmt = con.prepareStatement(sql);

        // Set parameter for the prepared statement
        pstmt.setInt(1, serviceId);

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
}
