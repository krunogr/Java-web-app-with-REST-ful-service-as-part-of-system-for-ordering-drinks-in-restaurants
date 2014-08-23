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
                                        <table style="width: 450px; ">
                                            <th colspan="2" style="text-decoration:underline;">BRISANJE KORISNIKA</th>
                                            <br/>
                                            <tr><td></td>
                                                <td>

                                                    <br/>
                                                    <br/>
                                                    <br/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 58px  ">ID Korisnika koji želite obrisati </td>
                                                <td ><input class="input-block-level" placeholder="ID Korisnika" type="text" name="id_korisnika" required="true"  requiredMessage="Unesi jedinstveni broj korisnika"/>
                                                    <h:message for="id_korisnika" /></td>
                                            </tr>
                                            <tr>
                                                <td> </td>
                                                <td ></tr>
                                            <tr>
                                                <td  </td>
                                                <td ></></td>
                                            </tr>
                                            <tr><td></td><td>   </td></tr> <tr><td colspan="2">    <br/>    <br/><center><input type="submit" value="Obriši korisnika" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
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
                                    <sql:update dataSource="${con}" var="forma">DELETE FROM mnarudzbe_korisnici WHERE ID_korisnika='<c:out value="${param.id_korisnika}"/>'</sql:update>
                                        Korisnik je obrisan!
                                </c:if>    
                            </center>
                        </div>
                    </div>
                </body>
                </html>
