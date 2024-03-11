/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

import Model.Bill;
import Model.Service;
import Model.ServiceUsage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ServiceUsageDB implements DatabaseInfo {

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

    // Function to get all service usages
    public static List<ServiceUsage> getAllServiceUsages() {
        List<ServiceUsage> serviceUsages = new ArrayList<>();

        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement("SELECT * FROM ServiceUsage"); java.sql.ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                int serviceID = rs.getInt("serviceID");
                int amount = rs.getInt("amount");
                int billID = rs.getInt("BillID");

                ServiceUsage serviceUsage = new ServiceUsage();
                serviceUsage.setId(id);
                Service service = ServiceDB.getServiceById(serviceID);
                serviceUsage.setService(service);
                serviceUsage.setAmount(amount);
                Bill bill = BillDB.getBill(billID);
                serviceUsage.setBill(bill);

                serviceUsages.add(serviceUsage);
            }

        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return serviceUsages;
    }

    public static void insertServiceUsage(ServiceUsage serviceUsage) {
        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement(
                "INSERT INTO ServiceUsage (serviceID, amount, billID) VALUES (?, ?, ?)")) {

            ps.setInt(1, serviceUsage.getService().getId());
            ps.setInt(2, serviceUsage.getAmount());
            ps.setInt(3, serviceUsage.getBill().getId());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error inserting service usage: " + e);
        }
    }

    public static List<ServiceUsage> getAllServiceUsagesByBillID(int billID) {
        List<ServiceUsage> serviceUsages = new ArrayList<>();

        try (Connection con = getConnect(); PreparedStatement ps = con.prepareStatement("SELECT * FROM ServiceUsage WHERE billID = ?")) {
            ps.setInt(1, billID);
            try (java.sql.ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int serviceID = rs.getInt("serviceID");
                    int amount = rs.getInt("amount");

                    ServiceUsage serviceUsage = new ServiceUsage();
                    serviceUsage.setId(id);
                    Service service = ServiceDB.getServiceById(serviceID);
                    serviceUsage.setService(service);
                    serviceUsage.setAmount(amount);
                    Bill bill = BillDB.getBill(billID);
                    serviceUsage.setBill(bill);

                    serviceUsages.add(serviceUsage);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }

        return serviceUsages;
    }
}
