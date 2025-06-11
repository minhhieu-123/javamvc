package vn.hoidanit.laptopshop.domain.DTO;

import java.time.LocalDateTime;

public class NotiSummaryDTO {
      private long id;
    private String name;
    private LocalDateTime date;
    private String image;
    
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    // Constructor
    public NotiSummaryDTO(long id, String name, LocalDateTime date, String image) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.image = image;
    }

    @Override
    public String toString() {
        return "NotiSummaryDTO [id=" + id + ", name=" + name + ", date=" + date + ", image=" + image + "]";
    }
    
}
