package project.web.items;



public class Place {

    private String user;
    private String email;
    private String naziv;
    private String adresa;

    public Place(String user, String email, String naziv, String adresa) {
        this.user = user;
        this.email = email;
        this.naziv = naziv;
        this.adresa = adresa;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }
}