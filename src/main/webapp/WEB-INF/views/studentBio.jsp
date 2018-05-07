<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
    <head>
        <title><spring:message code="message.studentBio_pageTitle"/></title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
    
    </head>
    
    <body>
        <div id = "header">
            <div id = "title">
                <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
                <p id="pageName"><spring:message code="message.studentBio_title"/></p>
            </div>
            
        </div>
        
        <div id = "body1">
            
                <c:set var="stud" value="${studente}"/>
                <spring:message code="message.studentBio_registry"/>
                ${stud.firstname}
                ${stud.lastname}
            <br>
                <spring:message code="message.studentBio_booklet"/>
                <c:forEach items="${listaEsami}" var="exams">
                    <br>
                    ${exams.idEsame}
                    ${exams.data}
                    ${exams.voto}
                    <a href="${exam_basepath}/delete?id=${exams.idEsameSostenuto}&idStud=${studente.id}">
                        <spring:message code="message.studentIndex_delete"/></a>
                </c:forEach>
            <br>
            <c:set var="idStudente" value="${stud.id}"/>
    
            <spring:message code="message.studentBio_add"/>
            <form:form  name="myBioForm"
                       method="POST"
                       action="${student_basepath}/studentBio"
                       modelAttribute="esame" >
                <table>
                    <tr>
                        <td><form:hidden path="idStudente"/></td>
                    </tr>
                    <tr>
                        <td><form:label path="idEsame"><spring:message code="message.examForm_matter"/></form:label></td>
                        <td>
                            <form:select path="idEsame">
                                <form:option value="-1" label="--- Select ---"/>
                                <form:options items="${listaMaterie}" itemValue="idEsame"/>
                                <form:errors path="idEsame"></form:errors>
                            </form:select>
                        </td>
                    </tr>
            
                    <tr>
                        <td><form:label path="data"><spring:message code="message.examForm_date"/></form:label></td>
                        <td><form:input type="date" path="data"/></td>
                        <td><form:errors path="data"><spring:message code="message.studentBio_dateError"/></form:errors></td>
                    </tr>
            
                    <tr>
                        <td><form:label path="voto"><spring:message code="message.examForm_vote"/></form:label></td>
                        <td><form:input path="voto"/></td>
                        <td><form:errors path="voto"><spring:message code="message.studentBio_voteError"/></form:errors></td>
                        <td><div id="response"></div></td>
                    </tr>
            
                    <tr>
                        <td><input class = "buttonTest"type="submit" value="<spring:message code="message.general_submit"/>"/></td>
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
