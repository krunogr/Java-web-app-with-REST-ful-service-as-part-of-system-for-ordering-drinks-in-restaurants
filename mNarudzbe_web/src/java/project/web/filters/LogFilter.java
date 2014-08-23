package project.web.filters;

import javax.servlet.*;
import javax.servlet.http.*;
import project.web.items.Korisnik;

public class LogFilter implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request,
            ServletResponse response,
            FilterChain chain)
            throws java.io.IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String url = req.getRequestURI();

        Korisnik session = (Korisnik) req.getSession().getAttribute("korisnik");

        if (session == null || !session.isLogged) {
            if (url.contains("korisnik") || url.contains("admin")) {
                resp.sendRedirect(req.getServletContext().getContextPath() + "/javno/index.jsp");
            }  else {
                chain.doFilter(request, response);
            }
        } else {
            if (session.getVrsta().contains("admin")) {
                if (url.contains("/javno/") || url.contains("/korisnik/")) {
                    resp.sendRedirect(req.getServletContext().getContextPath() + "/admin/pretragaKorisnikaAdmin.jsp");
                } else {
                    chain.doFilter(request, response);
                }
            } else {
                if (url.contains("/javno/") || url.contains("admin")) {
                    resp.sendRedirect(req.getServletContext().getContextPath() + "/korisnik/noveNarudzbeKorisnik.jsp");
                } else {
                    chain.doFilter(request, response);
                }
            }

        }
    }

    @Override
    public void destroy() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

   
}