<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="message.examIndex_pageTitle"/></title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
</head>
<body>

<div id = "header">
    <div id = "title">
        <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
        <p id="pageName"><spring:message code="message.examIndex_title"/></p>
        
        <script language="JavaScript">
            function goThere(form){
                var linkList=form.selectThis.selectedIndex
                if(!linkList==""){window.location.href=form.selectThis.options[linkList].value;}
            }
        </script>
    
        <form name="MenuTendina">
            <select name="selectThis" size="1" onChange="goThere(this.form);">
                <option selected value=""><spring:message code="message.index_language"/>
                <option value="/exams/examIndex/?lang=it"><spring:message code="message.index_languageIt"/>
                <option value="/exams/examIndex/?lang=en"><spring:message code="message.index_languageEn"/>
            </select>
        </form>
        
    </div>

    <div id = "search">
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
                    <%-- TODO al posto di id materia ci andrebbe il nome della materia --%>
                    <td>id Studente</td>
                    <%-- TODO al posto di id studente ci andrebbe il nome dello studente --%>
                    <td>Data</td>
                    <td>Voto</td>
                </tr>
                <c:forEach items="${lista}" var="esame">
                    <tr>
                        <td> ${esame.idEsame} </td>
                        <td> ${esame.idStudente} </td>
                        <td> ${esame.data} </td>
                        <td> ${esame.voto} </td>
                        <%--<td><a href="/index/modify?id=${student.id}">Modify</a></td>--%>
                        <%--<td><a href="/index/delete?id=${student.id}">Delete</a></td>--%>
                    </tr>
                </c:forEach>
            </table>
        
        </div>
        
        <form:form method="GET" action="/index/">
            <input type="submit" value="<spring:message code="message.general_returnLink"/>">
        </form:form>
        
        <form:form method="GET" action="${exam_basepath}/insertExam">
            <input type="submit" value="<spring:message code="message.examIndex_insert"/>">
        </form:form>
    
    </div>


</body>
</html>