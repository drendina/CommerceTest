<!-- <@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <title>English</title>
    </head>

    <body>
        <table>
            <tr>
                <td>Id</td>
                <td>Firstname</td>
                <td>Lastname</td>
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

        <form method="GET" action="/index/filter">
            <!-- INPUT TEXT NAME -->
            <br>
            Insert name to search<br>
            <input type="text" name="name"><br>
            <!-- SUBMIT -->
            <input type="submit" name="invia">
        </form>

        <a href="/index/all">Complete database view</a>
    </body>
</html>
