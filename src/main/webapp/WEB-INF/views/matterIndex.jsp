<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title><spring:message code="message.matterIndex_pageTitle"/> </title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">

</head>

<body>


<div id = "header">
    <div id = "title">
        <a href="/index/"><img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>"></a>
        <p id="pageName"><spring:message code="message.matterIndex_title"/></p>
        <a class="flags" href="/index/changeLanguageItalian"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="32" height="24"></a>
        <a class="flags" href="/index/changeLanguageEnglish"><img border="0" alt="English" src="/risorse/img/uk.png" width="32" height="24"></a>
    </div>
    
    
    <div id = "search">
        
        <c:choose>
            <c:when test="${empty name}">
            
                <%= "" %>
            </c:when>
            <c:otherwise>
                <form:form method="post" action="/index/logout" id="registerForm">
                    <%=session.getAttribute("name")%>
                    <%=session.getAttribute("surname")%>
                
                    <form:form method="post" action="/index/logout">
                        <input type="submit" value="Logout">
                    </form:form>
                </form:form>
            </c:otherwise>
        </c:choose>
    
      
       
        <form method="GET" action="${matter_basepath}/filterMatter">
            <input id="searchText" type="text" name="name" autocomplete="off">
            <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
        </form>
    </div>
</div>


<div id = "showExams">
    <script id="templateMatter" type="x-tmpl-mustache">
                    <li>
                        {{idEsame}}
                        {{nomeEsame}}
                        <button><a href="${matter_basepath}/deleteMatter?id={{idEsame}}">
                            <spring:message code="message.studentIndex_delete"/></a></button>

                    </li>
    </script>
    <ul id="showMatterData"></ul>

    <div id="insertExam">
        <h4>Inserisci un nuovo esame</h4>
        <form id="myForm" method="POST" action="${matter_basepath}/insertMatter">
            <p>Nome esame:</p>
            <input type="text" name="matterName" value="">
            <input id="buttonSub" type="submit" value="<spring:message code="message.general_submit"/>">
        </form>
    </div>

</div>

<form:form method="GET" action="/index/">
    <input type="submit"  value="<spring:message code="message.general_returnLink"/>">
</form:form>


<script src="/risorse/node_modules/jquery/dist/jquery.js"></script>
<script src="/risorse/node_modules/mustache/mustache.js"></script>
<script type="text/javascript" src="/risorse/js/matterIndex.js"></script>

</body>
</html>
