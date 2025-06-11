package vn.hoidanit.laptopshop.domain;

public class CloundTest {
    private String id;
    private String name;
    private String Add;
    private String phone;
    public CloundTest(){}
    public CloundTest(String id, String name, String add, String phone) {
        this.id = id;
        this.name = name;
        Add = add;
        this.phone = phone;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAdd() {
        return Add;
    }
    public void setAdd(String add) {
        Add = add;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
