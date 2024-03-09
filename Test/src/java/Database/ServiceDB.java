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
}
