package Model;

public class ScreenSeat {
    private int id;
    private String name;
    private Screen screen; // Reference to the Screen

    public ScreenSeat(int id, String name, Screen screen) {
        this.id = id;
        this.name = name;
        this.screen = screen;
    }

    public ScreenSeat() {
    }

    // Getters and Setters
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

    public Screen getScreen() {
        return screen;
    }

    public void setScreen(Screen screen) {
        this.screen = screen;
    }

    @Override
    public String toString() {
        return "ScreenSeat{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", screen=" + screen +
                '}';
    }
}
