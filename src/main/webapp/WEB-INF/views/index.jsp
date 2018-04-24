<!-- <@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
        <title>HomePage</title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
       
    </head>

    <body>


    <div id = "header">
        <div id = "title">
            <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
            <p id="pageName">DATABASE STUDENTI</p>
        </div>
        <div id = "search">
            <form method="GET" action="/index/filter">
                <input id="searchText" type="text" name="name" autocomplete="off">
                <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
            </form>
        </div>
    </div>


    <div id = "body1">
        <c:if test="${filtered}">
            <c:set var="showButton" value="show"/>
        </c:if>
        <div id = "resetButton">
            <button id = "reset" class = "reset ${showButton}" href = "/index/all">Reset filter</button>
        </div>
        
        <div id="showData">
            <table>
                <tr>
                    <td>Id</td>
                    <td>Nome</td>
                    <td>Cognome</td>
                </tr>
                <c:forEach items="${lista}" var="student">
                    <tr>
                        <td> ${student.id} </td>
                        <td> ${student.firstname} </td>
                        <td> ${student.lastname} </td>
                        <td><a href="/index/modify?id=${student.id}">Modify</a></td>
                        <td><a href="/index/delete?id=${student.id}">Delete</a></td>

                    <%--<td><button id="modify" onclick="window.location=/index/modify?id=${student.id}")>Modify</button></td>--%>
                        
                    </tr>
                </c:forEach>
            </table>
            
        </div>
        
        <form:form method="GET" action="/index/">
            <input type="submit" value="Return to home">
        </form:form>
       
    </div>
    
    <div>
        <form:form method="GET" action="/index/insert">
            <p>First name:</p><input type="text" name="firstname" value="">
            <p>Last name:</p><input type="text" name="lastname" value="">
            <input type="submit" value="Submit">
        </form:form>
    </div>
    
    
    <div id="footer">
        <p id="footerData">Daniele Rendina</p>
        <!--
        <a href="/index/all"> <img border="0" alt="Return to Top" src="img/arrow-top.png" width="48" height="48"> </a>
        -->
    </div>

    </body>
</html>
