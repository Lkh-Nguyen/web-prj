package Model;

import java.sql.Date;

public class FilmDetail {
    private int id;
    private Screen screen;
    private Film film;
    private int filmSlot;
    private Date movieDate;

    public FilmDetail(int id, Screen screen, Film film, int filmSlot, Date movieDate) {
        this.id = id;
        this.screen = screen;
        this.film = film;
        this.filmSlot = filmSlot;
        this.movieDate = movieDate;
    }

    public FilmDetail() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public int getFilmSlot() {
        return filmSlot;
    }

    public void setFilmSlot(int filmSlot) {
        this.filmSlot = filmSlot;
    }

    public Date getMovieDate() {
        return movieDate;
    }

    public void setMovieDate(Date movieDate) {
        this.movieDate = movieDate;
    }

    @Override
    public String toString() {
        return "FilmDetail{" +
                "id=" + id +
                ", screen=" + screen +
                ", film=" + film +
                ", filmSlot=" + filmSlot +
                ", movieDate=" + movieDate +
                '}';
    }
}
