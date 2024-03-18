package Model;

import java.io.Serializable;

public class Ticket implements Serializable{
    private int id;
    private Bill bill;
    private FilmDetail filmDetail;
    private ScreenSeat screenSeat;

    public Ticket(Bill bill, FilmDetail filmDetail, ScreenSeat screenSeat) {
        this.bill = bill;
        this.filmDetail = filmDetail;
        this.screenSeat = screenSeat;
    }

    public Ticket(int id, Bill bill, FilmDetail filmDetail, ScreenSeat screenSeat) {
        this.id = id;
        this.bill = bill;
        this.filmDetail = filmDetail;
        this.screenSeat = screenSeat;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
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
                ", bill=" + bill +
                ", filmDetail=" + filmDetail +
                ", screenSeat=" + screenSeat +
                '}';
    }
}
