<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
    <title>Exam Form</title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
</head>

<body>
    <div id = "header">
        <div id = "title">
            <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
            <p id="pageName">DATABASE STUDENTI</p>
        </div>
        <div id = "search">
            <form method="GET" action="${exam_basepath}/filter">
                <input id="searchText" type="text" name="name" autocomplete="off">
                <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
            </form>
        </div>
    </div>
    
    <div id = "body1" >
        <div style="float:left; display:block; width:45%; margin: 20px; background-color:#b66dff;">
            
            <form:form method="POST" action="${exam_basepath}/insert" modelAttribute="esame">
                <table>
                    <tr>
                        <td><form:label path="idStudente">Studente</form:label></td>
                        <td>
                            <form:select path="idStudente">
                                <form:option value="-1" label="--- Select ---"/>
                                <form:options items="${listaStudenti}" itemValue="id" />
                            </form:select>
                        </td>
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
