package project.web;

import project.web.items.Korisnik;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Kontroler", urlPatterns = {"/ProvjeraKorisnika", "/OdjavaKorisnika"})
public class Kontroler extends HttpServlet {

    Database db = new Database();
    Korisnik bla;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String zahtjev = request.getServletPath();
        String odrediste = null;
        HttpSession session;

        switch (zahtjev) {
            case "/ProvjeraKorisnika":

                String korIme = request.getParameter("j_username");
                String lozinka = request.getParameter("j_password");
                session = request.getSession(true);
                List<String> aboutKorisnik = db.checkUserInDatabase(korIme, lozinka);
                Korisnik korisnik = new Korisnik();
                if (aboutKorisnik != null) {

                    korisnik.setVrsta(aboutKorisnik.get(0));
                    korisnik.setUsername(korIme);
                    korisnik.setPassword(lozinka);
                    korisnik.isLogged = true;
                    session.setAttribute("korisnik", korisnik);

                    if (korisnik.getVrsta().contains("admin")) {
                        odrediste = "/admin/pretragaKorisnikaAdmin.jsp";
                    } else {
                        odrediste = "/korisnik/noveNarudzbeKorisnik.jsp";
                    }
                } else {
                    odrediste = "/javno/indexKriviPodaci.jsp";
                }

                break;

            case "/OdjavaKorisnika":
                odrediste = "/javno/index.jsp";
                request.getSession().removeAttribute("korisnik");
        }
        response.sendRedirect(request.getContextPath() + odrediste);

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
