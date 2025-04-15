package ch.hatbe.fitapp.util;

public class  Measurement {
    public int id;
    public String date;
    public String username;
    public double height;
    public int  weight;

    public Measurement(int id, String date, String username, double height, int weight) {
        this.id = id;
        this.date = date;
        this.username = username;
        this.height = height;
        this.weight = weight;
    }
}
