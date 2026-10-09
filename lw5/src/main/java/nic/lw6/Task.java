package nic.lw5;

public class Task {
    
    private String text;
    
    private String date;
    
    private String time;

    public Task(String text, String date, String time) {
        this.text = text;
        this.date = date;
        this.time = time;
    }

    public String getText() { return text; }
    public String getDate() { return date; }
    public String getTime() { return time; }
}