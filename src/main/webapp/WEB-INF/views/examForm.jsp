<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="message.examForm_pageTitle"/></title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
</head>

<body>
    <div id = "header">
        <div id = "title">
            <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
            <p id="pageName"><spring:message code="message.examForm_title"/></p>
        </div>
        <div id = "search">
            <form method="GET" action="${exam_basepath}/filter">
                <input id="searchText" type="text" name="name" autocomplete="off">
                <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
            </form>
        </div>
    </div>
    
    <div id = "body1" >
        <div>
            
            <form:form method="POST" action="${exam_basepath}/insert" modelAttribute="esame">
                <table>
                    <tr>
                        <td><form:label path="idStudente"><spring:message code="message.examForm_student"/></form:label></td>
                        <td>
                            <form:select path="idStudente">
                                <form:option value="-1" label="--- Select ---"/>
                                <form:options items="${listaStudenti}" itemValue="id" />
                            </form:select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td><form:label path="idEsame"><spring:message code="message.examForm_matter"/></form:label></td>
                        <td>
                            <form:select path="idEsame">
                               <form:option value="-1" label="--- Select ---"/>
                               <form:options items="${listaMaterie}" itemValue="idEsame"/>
                            </form:select>
                        </td>
                    </tr>
                    
                    <tr>
                        <td><form:label path="data"><spring:message code="message.examForm_date"/></form:label></td>
                        <td><form:input type="date" path="data"/></td>
                    </tr>
                    
                    <tr>
                        <td><form:label path="voto"><spring:message code="message.examForm_vote"/></form:label></td>
                        <td><form:input path="voto"/></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="<spring:message code="message.general_submit"/>"/></td>
                    </tr>
                </table>
            </form:form>
        </div>
    </div>


</body>
</html>
