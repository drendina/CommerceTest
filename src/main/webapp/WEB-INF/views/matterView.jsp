<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="html" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Exams</title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">

</head>

<body>


<div id = "header">
    <div id = "title">
        <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
        <p id="pageName">DATABASE STUDENTI</p>
    </div>
    <div id = "search">
        <form method="GET" action="/index/filterMatter">
            <input id="searchText" type="text" name="name" autocomplete="off">
            <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
        </form>
    </div>
</div>

<div id = "showExams">
    <table>
        <tr>
            <td>Id</td>
            <td>Nome Esame</td>
        </tr>
        <c:forEach items="${matterList}" var="exam">
            <tr>
                <td> ${exam.idEsame} </td>
                <td> ${exam.nomeEsame} </td>
            </tr>
        </c:forEach>
    </table>
    <div id="insertExam"></div>
    <h4>Inserisci un nuovo esame</h4>
        <form:form method="GET" action="/index/insertMatter">
            <p>Nome esame:</p><input type="text" name="matterName" value="">
            <input type="submit" value="Submit">
        </form:form>
    </div>

<form:form method="GET" action="/index/">
    <input type="submit" value="Return to home">
</form:form>


</body>
</html>
