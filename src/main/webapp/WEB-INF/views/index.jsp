<!-- <@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
        <title>HomePage</title>
        <link rel="stylesheet" type="text/css" href="style.css"/>
    </head>

    <body>
    <style>
        div{
            width: 100%;
        }
        
        #title{font-style: italic;
        }
        
    
        #header{
            display: grid;
            position: fixed;
            grid-template-columns: 2fr 1fr;
            background-color: #c1eeff;
            margin-bottom: auto;
        }
    
        #body{
            display:grid;
            grid-template-columns: 20% 60% 20%;
        
        }
        #footer{
        
        }
    </style>
    
    
    <div id = "header">
        <div id = "title"><p>DATABASE STUDENTI</p></div>
        <div id = "search">
            <form method="GET" action="/index/filter">
                <input type="text" name="name">
                <input type="image" src="img/magnifier.png">
            </form>
        </div>
    </div>
    
    <div id = "body">
    <c:if test="${filtered}">
        <c:set var="showButton" value="show"/>
    </c:if>
    <div id = "resetButton">
     <a class="reset ${showButton}" href="/index/all">RESET FILTER</a>
    </div>
   
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
                </tr>
            </c:forEach>
        </table>
        
    </div>
    
    <div id="footer">
        <p>Daniele Rendina - Sopra Steria</p>
    </div>
    </body>
</html>
