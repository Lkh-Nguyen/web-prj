package Model;

import java.sql.Date;

public class Bill {

    private int id;
    private User user;
    private Date date;
    private float totalPrice;

    public Bill(Date date, float totalPrice, User user) {
        this.user = user;
        this.date = date;
        this.totalPrice = totalPrice;
    }

    public Bill(int id, User user, Date date, float totalPrice) {
        this.id = id;
        this.user = user;
        this.date = date;
        this.totalPrice = totalPrice;
    }

    public Bill(User user, Date date, float totalPrice) {
        this.user = user;
        this.date = date;
        this.totalPrice = totalPrice;
    }
    

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Bill{"
                + "id=" + id
                + ", user=" + user
                + ", date=" + date
                + ", totalPrice=" + totalPrice
                + '}';
    }
}
