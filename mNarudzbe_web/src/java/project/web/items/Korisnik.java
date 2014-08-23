
package project.web.items;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import project.web.Database;

public class Korisnik implements Serializable {
    
    String username, password, naziv, adresa, email, vrsta;
    private static String url, userDB, passDB;
    public boolean isLogged = false;
    Database db = new Database();

    public Korisnik() {
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean isIsLogged() {
        return isLogged;
    }
    
    public void setIsLogged(boolean isLogged) {
        this.isLogged = isLogged;
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
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getVrsta() {
        return vrsta;
    }
    
    public void setVrsta(String vrsta) {
        this.vrsta = vrsta;
    }
    
    public String action() {
        boolean user = true;
        FacesContext fc = FacesContext.getCurrentInstance();
        ServletContext sc = (ServletContext) fc.getExternalContext().getContext();
        HttpSession hs = (HttpSession) fc.getExternalContext().getSession(true);
        List<String> aboutKorisnik = db.checkUserInDatabase(getUsername(), getPassword());
        if (aboutKorisnik !=null) {
            setVrsta(aboutKorisnik.get(0));
            setEmail(aboutKorisnik.get(1));
            setNaziv(aboutKorisnik.get(2));
            setAdresa(aboutKorisnik.get(3));
            hs.setAttribute("korisnik", this);
            List<String> korisnici = (List<String>) sc.getAttribute("korisnici");
            if (korisnici == null) {
                korisnici = new ArrayList<>();
            }
            korisnici.add(this.username);
            sc.setAttribute("korisnici", korisnici);
            isLogged = true;
            
            if ("korisnik".equals(getVrsta())) {
                return "OK_KORISNIK";
            } else {
                return "OK_ADMIN";
            }
        } else {
            isLogged = false;
            return "NOT_OK";
        }
        
    }
}
