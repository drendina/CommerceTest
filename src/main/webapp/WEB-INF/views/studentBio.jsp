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
                    <a href="${exam_basepath}/delete?id=${exams.idEsameSostenuto}&idStud=${studente.id}">Delete</a>
                </c:forEach>
            <br>
            <c:set var="idStudente" value="${stud.id}"/>
            
                Aggiungi Esame al libretto
            <form:form  name="myBioForm"
                       method="POST"
                       action="${student_basepath}/studentBio"
                       modelAttribute="esame" >
                <table>
                    <tr>
                        <td><form:hidden path="idStudente"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="idEsame">Materia</form:label></td>
                        <td>
                            <form:select path="idEsame">
                                <form:option value="-1" label="--- Select ---"/>
                                <form:options items="${listaMaterie}" itemValue="idEsame"/>
                                <form:errors path="idEsame"></form:errors>
                            </form:select>
                        </td>
                    </tr>
            
                    <tr>
                        <td><form:label path="data">Data</form:label></td>
                        <td><form:input type="date" path="data"/></td>
                        <td><form:errors path="data">La data non puo' essere futura!</form:errors></td>
                    </tr>
            
                    <tr>
                        <td><form:label path="voto">Voto</form:label></td>
                        <td><form:input path="voto"/></td>
                        <td><form:errors path="voto">Il voto deve essere compreso tra 18 e 30</form:errors></td>
                        <td><div id="response"></div></td>
                    </tr>
            
                    <tr>
                        <td><input class = "buttonTest"type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form:form>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
                crossorigin="anonymous"></script>
        <script src="/risorse/node_modules/mustache/mustache.js"></script>
        <script type="text/javascript" src="/risorse/js/studentBio.js"></script>
            
        </div>
    </body>
</html>
