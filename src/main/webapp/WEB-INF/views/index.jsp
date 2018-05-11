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
                    <a class="flags" href="/index/?lang=it"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="32" height="24"></a>
                    <a class="flags" href="/index/?lang=en"><img border="0" alt="English" src="/risorse/img/uk.png" width="32" height="24"></a>
                <form:form method="GET" action="/index/login" modelAttribute="user">
                    Email: <form:input path="email"/>
                    <br>
                    Password: <form:input path="password"/>
                    <input type="submit" value="Login">
                </form:form>
                
                
            </div>
            
        </div>
    
        <!-- ---------------- BODY ----------------------- -->
        <div id="body1">
            <br>
            <%=session.getAttribute("name")%>
            <%=session.getAttribute("surname")%>
            <br>
            <form:form method="post" action="/index/logout">
                <input type="submit" value="Logout">
            </form:form>
            <br>
            <div class="buttonCustom">
                <form:form method="GET" action="/students/all">
                    <input type="submit" value="<spring:message code="message.index_students"/>">
                </form:form>
                
                <form:form method="GET" action="/matters/matterView">
                    <input id="GMDE" type="submit" value="<spring:message code="message.index_matters"/>">
                </form:form>
        
                <form:form method="GET" action="/exams/examIndex">
                    <input type="submit" value="<spring:message code="message.index_exams"/>">
                </form:form>
    
                <form:form method="GET" action="/user/registration">
                    <input type="submit" value="Registrati!">
                </form:form>
                <br>
            </div>
            
        </div>
        
        <form:form method="get" action="/index/changeLanguageEnglish">
            <input type="submit" value="English">
        </form:form>

        <form:form method="get" action="/index/changeLanguageItalian">
            <input type="submit" value="Italiano">
        </form:form>
        
    
    <script src="/risorse/node_modules/jquery/dist/jquery.js"></script>
    <script src="/risorse/node_modules/mustache/mustache.js"></script>
    </body>
</html>
