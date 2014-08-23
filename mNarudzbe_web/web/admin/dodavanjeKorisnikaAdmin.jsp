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
                        <div class="menu" style="background-color:#8686BA; -webkit-border-radius: 36px;  padding: 10px; padding-top: 30px ; float: left; width: 150px; height: 300px">
                            <a href="${pageContext.servletContext.contextPath}/admin/pretragaKorisnikaAdmin.jsp">Pretraga korisnika</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/admin/dodavanjeKorisnikaAdmin.jsp">Dodavanje korisnika</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/admin/brisanjeKorisnikaAdmin.jsp">Brisanje korisnika</a> <br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/admin/pretragaNarudzbeAdmin.jsp">Pretraga narudžbe</a> <br/><br/><br/><br/><br/><br/><br/>
                            <a href="${pageContext.servletContext.contextPath}/OdjavaKorisnika">Odjava</a>
                        </div>
                        <div class="container" style="background-color:#8686BA; -webkit-border-radius: 36px; padding: 10px ; float:right ">
                            <center>
                                <form method="POST" name="forma" >
                                    <div class="row-fluid">
                                        <table style="width: 350px;" >
                                            <th colspan="2" style="text-decoration:underline;">DODAVANJE KORISNIKA</th>
                                            <br/>
                                            <tr><td></td>
                                                <td>

                                                    <br/>
                                                    <br/>
                                                    <br/>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Korisničko ime</td>
                                                <td><input class="input-block-level" placeholder="Korisničko ime" type="text" name="user" required="true"</td>
                                            </tr>
                                            <tr>
                                                <td>Lozinka</td>
                                                <td><input class="input-block-level" placeholder="Lozinka" type="text" name="lozinka" required="true"/></td>
                                            </tr>
                                            <tr>
                                                <td>Skupina</td>
                                                <td><select name="skupina">
                                                        <option value="korisnik">Korisnik</option>
                                                        <option value="admin">Admin</option>
                                                    </select></td> </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td><input class="input-block-level" placeholder="Email" type="text" name="email" required="true"/></td>
                                            </tr>
                                            <tr>
                                                <td>Naziv</td>
                                                <td><input class="input-block-level" placeholder="Naziv" type="text" name="naziv" required="true"/></td>
                                            </tr>
                                            <tr>
                                                <td>Adresa</td>
                                                <td><input class="input-block-level" placeholder="Adresa" type="text" name="adresa" required="true"/></td>
                                            </tr>

                                            <tr>
                                                </td></tr>

                                            <tr><td colspan="2">    <br/>    <br/><center><input type="submit" value="Kreiraj račun" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
                                        </table>
                                    </div>
                                </form>

                                <br/>
                                <c:if test="${pageContext.request.method=='POST'}">
                                    <sql:setDataSource var="con"
                                                       driver="com.mysql.jdbc.Driver"
                                                       url="${applicationScope.URL_FOR_DB}"
                                                       user="${applicationScope.USERNAME_FOR_DB}"
                                                       password="${applicationScope.PASSWORD_FOR_DB}"/>
                                    <c:choose>
                                        <c:when  test="${(param.user==null)}">
                                        </c:when>
                                        <c:otherwise>
                                            <sql:update dataSource="${con}" var="forma">INSERT INTO mnarudzbe_korisnici(`user`, `password`, `vrsta`, `email`, `naziv`, `adresa`) VALUES( '<c:out value="${param.user}"/>', '<c:out value="${param.lozinka}"/>', '<c:out value="${param.skupina}"/>', '<c:out value="${param.email}"/>', '<c:out value="${param.naziv}"/>', '<c:out value="${param.adresa}"/>')</sql:update>
                                                Dodan je novi korisnik!
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>     
                            </center>
                        </div>
                    </div>
                </body>
                </html>
