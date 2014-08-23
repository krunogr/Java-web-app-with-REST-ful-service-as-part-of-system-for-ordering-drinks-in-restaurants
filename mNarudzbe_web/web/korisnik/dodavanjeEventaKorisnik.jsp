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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="iso-8859-2">
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
                                <form method="POST" name="forma" >
                                    <div class="row-fluid">
                                        <table style="width: 450px; ">
                                            <th colspan="2" style="text-decoration:underline;">DODAVANJE NOVOG EVENTA</th>
                                            <br/>
                                            <tr><td></td>
                                                <td>

                                                    <br/>
                                                    <br/>
                                                    <br/>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="padding-left: 98px  ">Naziv eventa</td>
                                                <td ><input class="input-block-level" placeholder="Naziv eventa" type="text" name="naziv_eventa" required="true"  requiredMessage="Unesi naziv artikla"/>
                                                    <h:message for="naziv_artikla" class="error_message"/></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 98px ">Mjesto odrzavanja </td>
                                                <td ><input class="input-block-level" placeholder="Mjesto eventa" type="text" name="mjesto" required="true"  requiredMessage="Unesi naziv artikla"/>
                                                    <h:message for="naziv_artikla" class="error_message"/></td>
                                                <tr>
                                                    <td style="padding-left: 98px ">Datum eventa </td>
                                                    <td><input  class="input-block-level" placeholder="dd.MM.yyyy hh.mm.ss" type="text" name="datum" </td>
                                                </tr>

                                                <tr>
                                                    <td style="padding-left: 98px ">Opis eventa</td>
                                                    <td><textarea   class="input-block-level" ma placeholder="Opis eventa" type="text" name="opis" size="50"/></textarea></td>
                                                </tr>

                                                </td></tr>

                                            <tr><td colspan="2">    <br/>    <br/><center><input type="submit" value="Dodaj event" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
                                        </table>
                                    </div>
                                </form>

                                <br/>
                                <sql:setDataSource var="con"
                                                   driver="com.mysql.jdbc.Driver"
                                                   url="${applicationScope.URL_FOR_DB}"
                                                   user="${applicationScope.USERNAME_FOR_DB}"
                                                   password="${applicationScope.PASSWORD_FOR_DB}"/>
                                <c:if test="${pageContext.request.method=='POST'}">
                                    <sql:update dataSource="${con}" var="forma">UPDATE mnarudzbe_eventi SET mjesto='<c:out value="${param.mjesto}"/>', datum_eventa='<c:out value="${param.datum}"/>', naziv='<c:out value="${param.naziv_eventa}"/>', opis_eventa='<c:out value="${param.opis}"/>'  WHERE korisnik='${korisnik.username}'</sql:update>    Dodan je novi event!
                                </c:if>       
                            </center>
                        </div>
                    </div>
                </body>
                </html>
