<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

    <head>
        <title><spring:message code="message.index_pageTitle"/></title>
        <link href="<c:url value="/risorse/style.css?=${version}" />" rel="stylesheet">
    </head>

    <body>
    <!-- ---------------- HEADER ----------------------- -->
        <div id = "header">
            <div id = "title">
                <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
                <p id="pageName"> <spring:message code="message.index_title"/>
                </p>
            </div>
        
            <div id = "language">
                    <a class="flags" id="italianFlag" href="/index/changeLanguageItalian"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="32" height="24"></a>
                    <a class="flags" href="/index/changeLanguageEnglish"><img border="0" alt="English" src="/risorse/img/uk.png" width="32" height="24"></a>
                <c:choose>
                    <c:when test="${empty name}">
                        <form:form method="GET" action="/index/login" modelAttribute="user" id="registerForm">
                            Email:<form:input path="email" id="emailInput"/>
                            <br>
                            Password: <form:input path="password"/>
                            <input type="submit" value="Login">
                        </form:form>
                        <form:form method="GET" action="/user/registration" >
                            <input id="register" type="submit" value="<spring:message code="message.index_register"/>">
                        </form:form>
                    </c:when>
                    <c:otherwise>
                        <form:form method="post" action="/index/logout" id="registerForm">
                            <div>
                                <%=session.getAttribute("name")%>
                                <%=session.getAttribute("surname")%>
                                <input type="submit" value="Logout">
                            </div>
                        </form:form>
                    </c:otherwise>
                </c:choose>
            </div>
            
        </div>
    
      
        
      
    
        <!-- ---------------- BODY ----------------------- -->
        <div id="body1">
            
            
            <div class="buttonCustom">
                <div class="buttons" id="firstLeft">
                    <img src="/risorse/img/stud.png" width="300px" height="300px">
                    <form:form method="GET" action="/students/all">
                        <input type="submit" value="<spring:message code="message.index_students"/>">
                    </form:form>
                    <p class="desc">Entra in questa sezione per gestire gli studenti</p>
                </div>
                
                <div class="buttons">
                    <img src="/risorse/img/matter.jpg" width="300px" height="300px">
                    <form:form method="GET" action="/matters/matterView">
                        <input id="GMDE" type="submit" value="<spring:message code="message.index_matters"/>">
                    </form:form>
                    <p class="desc">Entra in questa sezione per gestire le materie</p>
                </div>
                
                <div class="buttons">
                    <img src="/risorse/img/exams.jpg" width="300px" height="300px">
                    <form:form method="GET" action="/exams/examIndex">
                        <input type="submit" value="<spring:message code="message.index_exams"/>">
                    </form:form>
                    <p class="desc">Entra in questa sezione per gestire gli esami</p>
                </div>
            </div>
        </div>
    
    <script src="/risorse/node_modules/jquery/dist/jquery.js"></script>
    <script src="/risorse/node_modules/mustache/mustache.js"></script>
    </body>
</html>
