package beans;

import java.io.Serializable;

public class Student implements Serializable {
	private static final long serialVersionUID = 1L;

    private int id;
    private String name;
    private String address;
    private String school;
    private String status;

    public Student() {}

    public Student(int id, String name, String address, String school, String status) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.school = school;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getAddress() { return address; } 
    public void setAddress(String address) { this.address = address; }
    public String getSchool() { return school; }
    public void setSchool(String school) { this.school = school; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}