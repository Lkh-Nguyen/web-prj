package Model;

import java.sql.Date;

public class Ticket {
    private int id;
    private User user;
    private float price;
    private Date date; // Changed from tDate to date
    private FilmDetail filmDetail;
    private ScreenSeat screenSeat;

    public Ticket(int id, User user, float price, Date date, FilmDetail filmDetail, ScreenSeat screenSeat) {
        this.id = id;
        this.user = user;
        this.price = price;
        this.date = date;
        this.filmDetail = filmDetail;
        this.screenSeat = screenSeat;
    }

    public Ticket() {
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public FilmDetail getFilmDetail() {
        return filmDetail;
    }

    public void setFilmDetail(FilmDetail filmDetail) {
        this.filmDetail = filmDetail;
    }

    public ScreenSeat getScreenSeat() {
        return screenSeat;
    }

    public void setScreenSeat(ScreenSeat screenSeat) {
        this.screenSeat = screenSeat;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "id=" + id +
                ", user=" + user +
                ", price=" + price +
                ", date=" + date +
                ", filmDetail=" + filmDetail +
                ", screenSeat=" + screenSeat +
                '}';
    }
}
