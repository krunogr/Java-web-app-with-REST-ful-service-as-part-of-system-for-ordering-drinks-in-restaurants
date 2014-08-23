package project.web.items;

public class Article {

    private String name;
    private String type;
    private String user;
    private String price;
    

    public Article(String name, String type, String price, String user) {
        this.name = name;
        this.type = type;
        this.price = price;
        this.user = user;
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    

}