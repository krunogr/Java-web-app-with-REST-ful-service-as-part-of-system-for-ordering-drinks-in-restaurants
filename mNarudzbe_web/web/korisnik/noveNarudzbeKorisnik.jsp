<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net" %>
<?xml version='1.0' encoding='UTF-8' ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <style>
            a:link {color:#78D2D2;}    /* unvisited link */
            a:visited {color:#78D2D2;} /* visited link */
            a:hover {color:#78D2D2;}   /* mouse over link */
            a:active {color:#0000FF;}  /* selected link */
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>mNarudzbe_web</title>        
            <link rel="stylesheet" type="text/css" href="../css/displaytag.css">
                <link href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                </head>
                <body style="background-color:#78D2D2">
                    <div  style=" width:1000px;  padding: 10px; height: 700px;  margin:20px auto; border-top:2px solid #8686BA; padding:10px; -webkit-border-radius: 36px" >
                        <div class="menu" style="background-color:#8686BA; -webkit-border-radius: 36px;  padding: 10px; padding-top: 30px ; float: left; width: 150px; height: 400px">

                            <p style="font-weight: bold; ">Narudžbe</p>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/noveNarudzbeKorisnik.jsp">Nove narudžbe</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/pretragaNadrudzbeKorisnik.jsp">Pretraga nadrudžbe</a> <br/><br/>
                            <p style="font-weight: bold;">Artikli</p>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/pretragaArtikalaKorisnik.jsp">Pretraga artikala</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/dodavanjeArtiklaKorisnik.jsp">Dodavanje artikla</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/brisanjeArtiklaKorisnik.jsp">Brisanje artikla</a> <br/><br/>
                            <p style="font-weight: bold;">Ostalo</p>
                            <a href="${pageContext.servletContext.contextPath}/korisnik/dodavanjeEventaKorisnik.jsp">Dodavanje eventa</a><br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/OdjavaKorisnika">Odjava</a>

                        </div>
                        <div class="container" style="background-color:#8686BA; -webkit-border-radius: 36px; padding: 10px ; float:right ">
                            <center>
                                <br/>
                                <p colspan="2" style="text-decoration:underline; font-weight: bold">NOVE NARUDŽBE</p>


                                <br/>
                                <sql:setDataSource var="con"
                                                   driver="com.mysql.jdbc.Driver"
                                                   url="${applicationScope.URL_FOR_DB}"
                                                   user="${applicationScope.USERNAME_FOR_DB}"
                                                   password="${applicationScope.PASSWORD_FOR_DB}"/>

                                <c:if test="${pageContext.request.method=='GET'}">
                                    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd.MM.yyyy hh.mm.ss");%>
                                    <sql:update dataSource="${con}" var="forma">UPDATE mnarudzbe_${korisnik.username}_narudzbe SET Vrijeme_posluzivanja='<%= df.format(new java.util.Date())%>' WHERE ID_Narudzbe='<c:out value="${param.vrsta}"/>'</sql:update>
                                    <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_${korisnik.username}_narudzbe WHERE Vrijeme_posluzivanja='NIJE POSLUŽENO'</sql:query>


                                </c:if>
                                <form method="GET" name="forma" >
                                    <display:table name="${forma.rows}" id="displaytable" pagesize="5" style="border:1px solid #666; text-align:center; width:700px">   
                                        <display:column  property="ID_Narudzbe" title="ID Narudzbe" style="border:1px solid #666"/>
                                        <display:column property="Narudzba" title="Narudzba" style="border:1px solid #666"/>
                                        <display:column property="ID_Mjesta" title="Broj mjesta" style="border:1px solid #666"/>
                                        <display:column property="Racun_Narudzbe" title="Racun Narudzbe" style="border:1px solid #666"/>
                                        <display:column property="Vrijeme_zaprimanja_narudzbe" title="Vrijeme zaprimanja" style="border:1px solid #666"/>
                                        <display:column title="Odaberi" style="border:1px solid #666" >  

                                            <input type="radio" id="ID_Narudzbe" name="vrsta" value="${displaytable.ID_Narudzbe}"></input>

                                        </display:column> 
                                    </display:table> 
                                    <br/> <br/>
                                    <input type="submit" name="posluzi_narudzbu" value="Posluži narudžbu" class="btn btn-large btn-block" style="opacity:0.7"/> 
                                </form>
                                <form method="GET" name="forma" >
                                    <input type="submit" name="osvjezi" value="Osvježi prikaz" class="btn btn-large btn-block" style="opacity:0.7"/> 
                                </form>
                            </center> 
                        </div>
                    </div>
                </body>
                </html>