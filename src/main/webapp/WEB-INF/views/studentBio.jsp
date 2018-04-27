<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <title>Bio</title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
    
    </head>
    
    <body>
        <div id = "header">
            <div id = "title">
                <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
                <p id="pageName">BIO STUDENTE</p>
            </div>
            
        </div>
        
        <div id = "body1">
            
                <c:set var="stud" value="${studente}"/>
                Anagrafica:
                ${stud.firstname}
                ${stud.lastname}
            <br>
                Libretto esami:
                <c:forEach items="${listaEsami}" var="exams">
                    <br>
                    ${exams.idEsame}
                    ${exams.data}
                    ${exams.voto}
                </c:forEach>
            <br>
            <c:set var="idStudente" value="${stud.id}"/>
            
                Aggiungi Esame al libretto
            <form:form method="POST" action="${student_basepath}/studentBio" modelAttribute = "esame" >
                <table>
                    <%--<c:set var="idStudente" value="${stud.id}"/>--%>
                    <tr>
                        <td><form:hidden path="idStudente"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="idEsame">Materia</form:label></td>
                        <td>
                            <form:select path="idEsame">
                                <form:option value="-1" label="--- Select ---"/>
                                <form:options items="${listaMaterie}" itemValue="idEsame"/>
                            </form:select>
                        </td>
                    </tr>
            
                    <tr>
                        <td><form:label path="data">Data</form:label></td>
                        <td><form:input type="date" path="data"/></td>
                    </tr>
            
                    <tr>
                        <td><form:label path="voto">Voto</form:label></td>
                        <td><form:input path="voto"/></td>
                    </tr>
            
                    <tr>
                        <td><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form:form>
        </div>
                
            
        </div>
    </body>
</html>
