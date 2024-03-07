package Model;

public class ScreenSeat {
    private int id;
    private String name;
    private String type; // Type of the seat (e.g., VIP, Standard)
    private double price; // Price of the seat
    private Screen screen; // Reference to the Screen

    public ScreenSeat(int id, String name, String type, double price, Screen screen) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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
                ", type='" + type + '\'' +
                ", price=" + price +
                ", screen=" + screen +
                '}';
    }
}
