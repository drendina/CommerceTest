<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

    <head>
        <title>STUDENTI HOMEPAGE</title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
    </head>

    <body>
        <h1>Homepage</h1>
        
        <div class="buttonCustom">
            <form:form method="GET" action="/students/all">
                <input type="submit" value="Gestione Studenti">
            </form:form>
            
            <form:form method="GET" action="/matters/matterView">
                <input type="submit" value="Gestione Materie d'Esame">
            </form:form>
    
            <form:form method="GET" action="/exams/examIndex">
                <input type="submit" value="Gestione Esami Effettuati">
            </form:form>
        </div>
    </body>
</html>
