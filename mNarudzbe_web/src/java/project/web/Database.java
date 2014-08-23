package project.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import project.web.items.Article;
import project.web.items.Comment;
import project.web.items.Event;
import project.web.items.Place;

public class Database {

    private static String URL_FOR_DB;
    private static String USERNAME_FOR_DB;
    private static String PASSWORD_FOR_DB;

    public Database() {

        URL_FOR_DB = AplicationListener.URL_FOR_DB;
        USERNAME_FOR_DB = AplicationListener.USERNAME_FOR_DB;
        PASSWORD_FOR_DB = AplicationListener.PASSWORD_FOR_DB;
    }

    public List<String> checkUserInDatabase(String username, String password) {

        String query = "SELECT * FROM mnarudzbe_korisnici WHERE user=? AND password=?";
        List<String> aboutKorisnik = new ArrayList<>();;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            PreparedStatement pStatement = conn.prepareStatement(query);
            pStatement.setString(1, username);
            pStatement.setString(2, password);
            ResultSet rs = pStatement.executeQuery();

            if (rs.next()) {
                aboutKorisnik.add(rs.getString("vrsta"));
                aboutKorisnik.add(rs.getString("email"));
                aboutKorisnik.add(rs.getString("naziv"));
                aboutKorisnik.add(rs.getString("adresa"));


            } else {
                aboutKorisnik = null;

            }
            rs.close();
            pStatement.close();
            conn.close();
            return aboutKorisnik;
        } catch (Exception ex) {
            aboutKorisnik = null;
            ex.printStackTrace();
        }
        return aboutKorisnik;
    }

    public List<Place> getAllPlaces() {

        String query = "SELECT user, email, naziv, adresa FROM mnarudzbe_korisnici WHERE vrsta='korisnik' ORDER BY naziv ASC";
        List<Place> allPlaces = new ArrayList<Place>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            PreparedStatement pStatement = conn.prepareStatement(query);

            ResultSet rs = pStatement.executeQuery();

            while (rs.next()) {
                Place place = new Place(rs.getString("user"), rs.getString("email"),
                        rs.getString("naziv"), rs.getString("adresa"));
                allPlaces.add(place);
            }
            rs.close();
            pStatement.close();
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return allPlaces;
    }

    public List<Event> getAllEvents() {

        String query = "SELECT * FROM mnarudzbe_eventi  WHERE NOT (mjesto='') ORDER BY datum_eventa DESC";
        List<Event> allEvents = new ArrayList<Event>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            PreparedStatement pStatement = conn.prepareStatement(query);

            ResultSet rs = pStatement.executeQuery();

            while (rs.next()) {
                Event event = new Event(rs.getString("mjesto"), rs.getString("datum_eventa"),
                        rs.getString("naziv"), rs.getString("opis_eventa"));
                allEvents.add(event);
            }
            rs.close();
            pStatement.close();
            conn.close();
        } catch (Exception ex) {

            ex.printStackTrace();
        }
        return allEvents;
    }

    public List<Article> getAllArticles(List<Place> allPlaces) {
        List<Article> allArticles = new ArrayList<Article>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            PreparedStatement pStatement = null;
            ResultSet rs = null;
            for (Place element : allPlaces) {
                String query = "SELECT * FROM mnarudzbe_" + element.getUser() + "_artikli ORDER BY Skupina_Artikla ASC, Naziv_Artikla ASC";
                pStatement = conn.prepareStatement(query);
                rs = pStatement.executeQuery();
                String user = element.getUser();
                while (rs.next()) {
                    Article article = new Article(rs.getString("Naziv_Artikla"), rs.getString("Skupina_Artikla"),
                            rs.getString("Cijena_artikla"), user);
                    allArticles.add(article);
                }
            }
            rs.close();
            pStatement.close();
            conn.close();
        } catch (Exception ex) {

            ex.printStackTrace();
        }
        return allArticles;
    }

    public List<Comment> getAllComment(List<Place> allPlaces) {
        List<Comment> allComments = new ArrayList<Comment>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            PreparedStatement pStatement = null;
            ResultSet rs = null;

            for (Place element : allPlaces) {
                String query = "SELECT * FROM mnarudzbe_" + element.getUser() + "_narudzbe WHERE NOT (komentar='-') ORDER BY ID_Narudzbe DESC";
                pStatement = conn.prepareStatement(query);
                rs = pStatement.executeQuery();
                String user = element.getUser();
                while (rs.next()) {
                    Comment comment = new Comment(user, rs.getString("Vrijeme_zaprimanja_narudzbe"),
                            rs.getString("komentar"));
                    allComments.add(comment);
                }
            }

            rs.close();
            pStatement.close();
            conn.close();
        } catch (Exception ex) {

            ex.printStackTrace();
        }
        return allComments;
    }

    public void setNewOrder(String narudzba, String brojMjesta, String racunNarudzbe, String vrijemeZaprimanja, String user) {
        List<Article> allArticles = new ArrayList<Article>();
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);
            String query = "INSERT INTO mnarudzbe_" + user + "_narudzbe (Narudzba, ID_Mjesta, Racun_Narudzbe, Vrijeme_zaprimanja_narudzbe, Vrijeme_posluzivanja, komentar) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pStatement = conn.prepareStatement(query);
            pStatement.setString(1, narudzba);
            pStatement.setString(2, brojMjesta);
            pStatement.setString(3, racunNarudzbe);
            pStatement.setString(4, vrijemeZaprimanja);
            pStatement.setString(5, "NIJE POSLUŽENO");
            pStatement.setString(6, "-");
            pStatement.executeUpdate();

            pStatement.close();
            conn.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void setComment(String user, String comment, String dateOfOrder) {
        List<Article> allArticles = new ArrayList<Article>();

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection(URL_FOR_DB, USERNAME_FOR_DB, PASSWORD_FOR_DB);

            String query = "UPDATE mnarudzbe_" + user + "_narudzbe SET komentar=? WHERE Vrijeme_zaprimanja_narudzbe=?";
            PreparedStatement pStatement = conn.prepareStatement(query);
            pStatement.setString(1, comment);
            pStatement.setString(2, dateOfOrder);


            pStatement.executeUpdate();
            pStatement.close();
            conn.close();
        } catch (Exception ex) {

            ex.printStackTrace();
        }
    }
}