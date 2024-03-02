package Model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.sql.Date;

public class User implements Serializable {

    private int id;
    private String name;
    private String gender;
    private Date dateOfBirth;
    private String cmnd;
    private String phoneNumber;
    private String email;
    private String password;
    private String address;
    private int role;

    // Constructors, getters, and setters
    public User() {
        // Default constructor
    }

    //Full constructor
    public User(String name, String gender, Date dateOfBirth, String cmnd, String phoneNumber, String email, String password, String address, int role) {
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.cmnd = cmnd;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.address = address;
        this.role = role;
    }

    //No role
    public User(String name, String gender, Date dateOfBirth, String cmnd, String phoneNumber, String email, String password, String address) {
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.cmnd = cmnd;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.password = password;
        this.address = address;
    }

    // Getters and Setters for each field
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", gender=" + gender + ", dateOfBirth=" + dateOfBirth + ", cmnd=" + cmnd + ", phoneNumber=" + phoneNumber + ", email=" + email + ", password=" + password + ", address=" + address + ", role=" + role + '}';
    }

    private String formatDateOfBirth() {
        if (dateOfBirth != null) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            return dateFormat.format(dateOfBirth);
        } else {
            return null;
        }
    }
}
