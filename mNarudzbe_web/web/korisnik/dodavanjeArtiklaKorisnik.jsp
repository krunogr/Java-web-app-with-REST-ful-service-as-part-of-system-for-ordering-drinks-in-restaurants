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
                                            <th colspan="2" style="text-decoration:underline;">DODAVANJE NOVOG ARTIKLA</th>
                                            <br/>
                                            <tr><td></td>
                                                <td>

                                                    <br/>
                                                    <br/>
                                                    <br/>

                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="padding-left: 98px  ">Naziv artikla </td>
                                                <td ><input class="input-block-level" placeholder="Naziv artikla" type="text" name="naziv_artikla" required="true"  requiredMessage="Unesi naziv artikla"/>
                                                    <h:message for="naziv_artikla" class="error_message"/></td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 98px ">Skupina artikla </td>
                                                <td ><select name="skupina_artikla" >
                                                        <option value="Bezalkoloholna pica">Bezalkoloholna pića</option>
                                                        <option value="Topli napici">Topli napici</option>
                                                        <option value="Vino">Vino</option>
                                                        <option value="Zestoka pica">Žestoka pića</option>
                                                        <option value="Piva">Piva</option>
                                                    </select></tr>
                                            <tr>
                                                <td style="padding-left: 98px  ">Cijena artikla </td>
                                                <td ><input class="input-block-level" placeholder="Cijena artikla" type="text" name="cijena_artikla" required="true" requiredMessage="Unesi cijenu artikla"/></td>
                                                <h:message for="cijena_artikla" class="error_message"/>
                                            </tr>

                                            <tr><td></td><td>

                                                </td></tr>

                                            <tr><td colspan="2">    <br/>    <br/><center><input type="submit" value="Dodaj artikl" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
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
                                    <sql:update dataSource="${con}" var="forma">INSERT INTO mnarudzbe_${korisnik.username}_artikli ( `Naziv_Artikla`, `Skupina_Artikla`, `Cijena_Artikla`) VALUES( '<c:out value="${param.naziv_artikla}"/>', '<c:out value="${param.skupina_artikla}"/>', '<c:out value="${param.cijena_artikla}"/>')</sql:update>
                                        Dodan je novi artikl!
                                </c:if>     
                            </center>
                        </div>
                    </div>
                </body>
                </html>
