<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

    <head>
        <title><spring:message code="message.index_pageTitle"/></title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
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
                 <h5><spring:message code="message.index_language"/></h5>
                    <a href="/index/?lang=it"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="64" height="64"></a>
            </div>
            
        </div>
    
        <!-- ---------------- BODY ----------------------- -->
        <div id = "body1">
    
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
                <br>
            </div>
            
        </div>
    </body>
</html>
