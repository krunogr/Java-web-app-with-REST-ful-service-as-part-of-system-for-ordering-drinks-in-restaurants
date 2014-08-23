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
                                <form method="GET" name="forma" >
                                    <div class="row-fluid">
                                        <table style="width: 350px;" >
                                            <th colspan="2" style="text-decoration:underline;">PRETRAGA KORISNIKA</th>
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
                                                <td><input class="input-block-level" placeholder="Korisničko ime" type="text" name="user" size="8"  value="<c:out value="${param.user}"/>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Skupina</td>
                                                <td><select name="skupina">
                                                        <option selected="selected" value="">
                                                            --
                                                        </option>
                                                        <option value="korisnik">Korisnik</option>
                                                        <option value="admin">Admin</option>
                                                    </select></td>
                                            </tr>
                                            <tr><td>Broj podataka po stranici </td><td>
                                                    <select name="redaka">
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="20">20</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                        <option value="0">Svi</option>
                                                    </select>
                                                </td></tr>

                                            <tr><td colspan="2">    <br/>    <br/><center><input type="submit" value="Prikaži" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
                                        </table>
                                    </div>
                                </form>
                                <br/>
                                <c:if test="${pageContext.request.method=='GET'}">
                                    <sql:setDataSource var="con"
                                                       driver="com.mysql.jdbc.Driver"
                                                       url="${applicationScope.URL_FOR_DB}"
                                                       user="${applicationScope.USERNAME_FOR_DB}"
                                                       password="${applicationScope.PASSWORD_FOR_DB}"/>
                                    <c:choose>
                                        <c:when  test="${(param.user!='') && (param.skupina=='') }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_korisnici WHERE user='<c:out value="${param.user}"/>'</sql:query>

                                        </c:when>
                                        <c:when  test="${(param.user=='') && (param.skupina!='') }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_korisnici WHERE vrsta='<c:out value="${param.skupina}"/>'</sql:query>
                                        </c:when> 
                                        <c:when  test="${(param.user!='') && (param.skupina!='') }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_korisnici WHERE vrsta='<c:out value="${param.skupina}"/>' AND user='<c:out value="${param.user}"/>'</sql:query>
                                        </c:when> 
                                        <c:otherwise>
                                            <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_korisnici</sql:query>
                                        </c:otherwise>

                                    </c:choose>
                                    <display:table name="${forma.rows}" pagesize="${param.redaka}" style="border:1px solid #666; text-align:center; width:600px">   
                                        <display:column property="id_korisnika" title="ID korisnik" style="border:1px solid #666"/>
                                        <display:column property="user" title="Korisničko ime" style="border:1px solid #666"/>
                                        <display:column property="vrsta" title="Skupina" style="border:1px solid #666"/>
                                        <display:column property="email" title="E-mail" style="border:1px solid #666"/>
                                        <display:column property="naziv" title="Naziv" style="border:1px solid #666"/>
                                        <display:column property="adresa" title="Adresa" style="border:1px solid #666"/>
                                    </display:table>       
                                </c:if>   
                            </center>
                        </div>
                    </div>
                </body>
                </html>
