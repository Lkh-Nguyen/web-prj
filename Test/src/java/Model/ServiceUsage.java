/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class ServiceUsage {
    private int id;
    private Service service;
    private int amount;
    private Bill bill;

    public ServiceUsage() {
        // Default constructor
    }

    public ServiceUsage(Service service, int amount, Bill bill) {
        this.service = service;
        this.amount = amount;
        this.bill = bill;
    }

    // Getters and setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    @Override
    public String toString() {
        return "ServiceUsage{" +
                "id=" + id +
                ", service=" + service +
                ", amount=" + amount +
                ", bill=" + bill +
                '}';
    }
}
