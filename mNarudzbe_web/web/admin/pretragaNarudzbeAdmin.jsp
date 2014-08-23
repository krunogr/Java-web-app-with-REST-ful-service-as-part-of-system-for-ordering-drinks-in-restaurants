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
                                            <th colspan="2" style="text-decoration:underline">PRETRAGA NARUDŽBI</th>
                                            <br/>
                                            <tr><td></td>
                                                <td>

                                                    <br/>

                                                    <br/>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Korisničko ime korisnika</td>
                                                <td><input class="input-block-level" placeholder="Unos korisničkog imena" type="text"  required="true" name="user" size="5" value="<c:out value="${param.user}"/>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Datum od </td>
                                                <td><input class="input-block-level" placeholder="dd.MM.yyyy hh.mm.ss" type="text" name="datumOD" value="<c:out value="${param.datumOD}"/>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Datum do </td>
                                                <td><input  class="input-block-level" placeholder="dd.MM.yyyy hh.mm.ss" type="text" name="datumDO" value="<c:out value="${param.datumDO}"/>"/></td>
                                            </tr>
                                            <tr><td>Broj podataka po stranici </td><td>
                                                    <select name="redaka">
                                                        <option value="5">5</option>
                                                        <option value="10">10</option>
                                                        <option value="20">20</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                        <option value="0">Sve</option>
                                                    </select>
                                                </td></tr>
                                            <tr><td colspan="2"><center><br/><br/><input type="submit" value="Prikaži" class="btn btn-large btn-block" style="opacity:0.7"/></center></td></tr>
                                        </table>
                                    </div>
                                </form>

                                <br/>
                                <sql:setDataSource var="con"
                                                   driver="com.mysql.jdbc.Driver"
                                                   url="${applicationScope.URL_FOR_DB}"
                                                   user="${applicationScope.USERNAME_FOR_DB}"
                                                   password="${applicationScope.PASSWORD_FOR_DB}"/>
                                <c:if test="${pageContext.request.method=='GET'}">
                                    <c:choose>
                                        <c:when  test="${(param.user==null) && (param.datumOD==null) && (param.datumDO==null)  }">
                                        </c:when>
                                        <c:when  test="${(param.user!='') && (param.datumOD=='') && (param.datumDO=='')  }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from mnarudzbe_<c:out value="${param.user}"/>_narudzbe</sql:query>
                                        </c:when>
                                        <c:when  test="${(param.user!='') && (param.datumOD!='') && (param.datumDO!='')  }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from  mnarudzbe_<c:out value="${param.user}"/>_narudzbe WHERE Vrijeme_zaprimanja_narudzbe BETWEEN concat(substring('<c:out value="${param.datumOD}"/>',1,13),':',substring('<c:out value="${param.datumOD}"/>',15,2),':',substring('<c:out value="${param.datumOD}"/>',18,2)) AND concat(substring('<c:out value="${param.datumDO}"/>',1,13),':',substring('<c:out value="${param.datumDO}"/>',15,2),':',substring('<c:out value="${param.datumDO}"/>',18,2))</sql:query>
                                        </c:when>
                                        <c:when  test="${(param.user!='') && (param.datumOD!='') && (param.datumDO!='')  }">
                                            <sql:query dataSource="${con}" var="forma">SELECT * from  mnarudzbe_<c:out value="${param.user}"/>_narudzbe WHERE Vrijeme_zaprimanja_narudzbe BETWEEN concat(substring('<c:out value="${param.datumOD}"/>',1,13),':',substring('<c:out value="${param.datumOD}"/>',15,2),':',substring('<c:out value="${param.datumOD}"/>',18,2)) AND concat(substring('<c:out value="${param.datumDO}"/>',1,13),':',substring('<c:out value="${param.datumDO}"/>',15,2),':',substring('<c:out value="${param.datumDO}"/>',18,2))</sql:query>
                                        </c:when>
                                    </c:choose>

                                    <display:table name="${forma.rows}" pagesize="${param.redaka}" style="border:1px solid #666; text-align:center; width:700px">   
                                        <display:column property="ID_Narudzbe" title="ID Narudzbe" style="border:1px solid #666"/>
                                        <display:column property="Narudzba" title="Narudzba" style="border:1px solid #666"/>
                                        <display:column property="ID_Mjesta" title="Broj mjesta" style="border:1px solid #666"/>
                                        <display:column property="Racun_Narudzbe" title="Racun Narudzbe" style="border:1px solid #666"/>
                                        <display:column property="Vrijeme_zaprimanja_narudzbe" title="Vrijeme zaprimanja" style="border:1px solid #666"/>
                                        <display:column property="Vrijeme_posluzivanja" title="Vrijeme posluživanja" style="border:1px solid #666"/>
                                    </display:table>       
                                </c:if>       
                            </center>
                        </div>
                    </div>
                </body>
                </html>
