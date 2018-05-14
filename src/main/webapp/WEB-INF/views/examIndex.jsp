<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="message.examIndex_pageTitle"/></title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
</head>
<body>

<div id = "header">
    <div id = "title">
        <a href="/index/"><img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>"></a>
        <p id="pageName"><spring:message code="message.examIndex_title"/></p>
        <a class="flags" href="/index/changeLanguageItalian"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="32" height="24"></a>
        <a class="flags" href="/index/changeLanguageEnglish"><img border="0" alt="English" src="/risorse/img/uk.png" width="32" height="24"></a>
    </div>

    <div id = "search">
    
        <c:choose>
            <c:when test="${empty name}">
            
                <%= "" %>
            </c:when>
            <c:otherwise>
                <form:form method="post" action="/index/logout" id="registerForm">
                    <%=session.getAttribute("name")%>
                    <%=session.getAttribute("surname")%>
                
                    <form:form method="post" action="/index/logout">
                        <input type="submit" value="Logout">
                    </form:form>
                </form:form>
            </c:otherwise>
        </c:choose>
        
        <form method="GET" action="/index/filter">
            <input id="searchText" type="text" name="name" autocomplete="off">
            <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
        </form>
    </div>
</div>

    
    <div id = "body1">

        <div id="showData">
            <table>
                <tr>
                    <td>id Materia</td>
                    <td>id Studente</td>
                    <td>Data</td>
                    <td>Voto</td>
                </tr>
                <c:forEach items="${lista}" var="esame">
                    <tr>
                        <td> ${esame.idEsame} </td>
                        <td> ${esame.idStudente} </td>
                        <td> ${esame.data} </td>
                        <td> ${esame.voto} </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
        
        
        <form:form method="GET" action="${exam_basepath}/insertExam">
            <input type="submit" value="<spring:message code="message.examIndex_insert"/>">
        </form:form>
    
    </div>
    <script src="/risorse/node_modules/jquery/src/jquery.js"></script>
    <script src="/risorse/node_modules/mustache/mustache.js"></script>
    <script type="text/javascript" src="/risorse/js/studentBio.js"></script>
    
</body>
</html>