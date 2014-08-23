package project.web.servis;

import project.web.items.Article;
import project.web.items.Event;
import project.web.items.Place;
import project.web.items.Comment;
import com.google.gson.Gson;
import java.util.List;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.core.Request;
import project.web.Database;

@Path("/Resources")
public class Resources {

    List<Place> allPlaces;
    List<Article> allArticles = null;
    List<Comment> allComments = null;
    List<Event> allEvents = null;
    Database db = new Database();
    @Context
    UriInfo uriInfo;
    @Context
    Request request;

    @GET
    @Path("allPlaces")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllPlaces() {
        allPlaces = db.getAllPlaces();
        String json = new Gson().toJson(allPlaces);
        return json;
    }

    @GET
    @Path("allArticles")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllArticls() {
        allPlaces = db.getAllPlaces();
        allArticles = db.getAllArticles(allPlaces);
        String json = new Gson().toJson(allArticles);
        return json;
    }

    @GET
    @Path("allComments")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllComments() {
        allPlaces = db.getAllPlaces();
        allComments = db.getAllComment(allPlaces);
        String json = new Gson().toJson(allComments);
        return json;
    }

    @GET
    @Path("allEvents")
    @Produces(MediaType.APPLICATION_JSON)
    public String getAllEvents() {
        allEvents = db.getAllEvents();
        String json = new Gson().toJson(allEvents);
        return json;
    }

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public void saveOrderOrComment(
            MultivaluedMap<String, String> orderParams) {
        String racunNarudzbe = orderParams.getFirst("racunNarudzbe");
        String user = orderParams.getFirst("user");
        if (racunNarudzbe.equals("0")) {
            String dateOfOrder = orderParams.getFirst("dateOfOrder");
            String comment = orderParams.getFirst("comment");
            db.setComment(user, comment, dateOfOrder);
        } else {
            String narudzba = orderParams.getFirst("narudzba");
            String brojMjesta = orderParams.getFirst("brojMjesta");
            String vrijemeZaprimanja = orderParams.getFirst("vrijemeZaprimanja");
            db.setNewOrder(narudzba, brojMjesta, racunNarudzbe, vrijemeZaprimanja, user);
        }
    }
}