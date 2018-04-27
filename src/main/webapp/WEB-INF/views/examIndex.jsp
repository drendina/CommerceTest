<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>EXAMS</title>
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
                    <td>id Materia</td>
                    <%-- TODO al posto di id materia ci va il nome della materia --%>
                    <td>id Studente</td>
                    <%-- TODO al posto di id studente ci va il nome dello studente --%>
                    <td>Data</td>
                    <td>Voto</td>
                </tr>
                <c:forEach items="${lista}" var="esame">
                    <tr>
                        <td> ${esame.idEsame} </td>
                        <td> ${esame.idStudente} </td>
                        <td> ${esame.data} </td>
                        <td> ${esame.voto} </td>
                        <%--<td><a href="/index/modify?id=${student.id}">Modify</a></td>--%>
                        <%--<td><a href="/index/delete?id=${student.id}">Delete</a></td>--%>
                    </tr>
                </c:forEach>
            </table>
        
        </div>
        
        <form:form method="GET" action="/index/">
            <input type="submit" value="Return to home">
        </form:form>
        
        <form:form method="GET" action="${exam_basepath}/insertExam">
            <input type="submit" value="Insert new exam">
        </form:form>
    
    </div>


</body>
</html>