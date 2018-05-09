<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
    <head>
        <title><spring:message code="message.studentIndex_pageTitle"/> </title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
    </head>
    
    <body>
        <!-- ---------------- HEADER ----------------------- -->
        <div id = "header">
            <div id = "title">
                <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
                <p id="pageName"> <spring:message code="message.studentIndex_title"/>
                    <a class="flags" href="/students/all/?lang=it"><img border="0" alt="Italian" src="/risorse/img/italy.png" width="32" height="24"></a>
                    <a class="flags" href="/students/all/?lang=en"><img border="0" alt="English" src="/risorse/img/uk.png" width="32" height="24"></a>
                    <button class="show-button">
                        <div class="button-text"><spring:message code="message.studentIndex_insert"/></div>
                    </button>
                </p>
            </div>
            
            <div id = "search">
                <form method="GET" action="${student_basepath}/filter">
                    <input id="searchText" type="text" name="name" autocomplete="off">
                    <input id="searchImage" type="image" src="<c:url value="/risorse/img/magnifier.png"/>">
                </form>
            </div>
        </div>

        <!-- ---------------- BODY ----------------------- -->
        <div id = "body1">
            <div class="login-form hide">
                <form:form id="myForm" name="myForm" method="POST" action="${student_basepath}/insert"  modelAttribute="studenteForm">
                    <p><spring:message code="message.modify_name"/>
                        <input type="text" name="firstname" value=""></p>
                    <%--<form:errors path="firstname"></form:errors>--%>
                    <p><spring:message code="message.modify_surname"/>
                        <input type="text" name="lastname" value=""></p>
                    <%--<form:errors path="lastname"></form:errors>--%>
                    <input type="submit" value="<spring:message code="message.general_submit"/>" class="ajax-button">
                </form:form>
            </div>
            
            <form:form method="GET" action="/index/">
                <input type="submit" value="<spring:message code="message.general_returnLink"/>">
            </form:form>
            
            <script id="template" type="x-tmpl-mustache">
                    <li>
                        {{id}}
                        {{firstname}}
                        {{lastname}}
                        <button><a href="${student_basepath}/modify?id={{id}}"><spring:message code="message.studentIndex_modify"/></a></button>
                        <button><a href="${student_basepath}/delete?id={{id}}"><spring:message code="message.studentIndex_delete"/></a></button>
                        <button><a href="${student_basepath}/studentBio?id={{id}}"><spring:message code="message.studentIndex_bio"/></a></button>
                    </li>
            </script>
            
                <ul id="showData"></ul>
        </div>


         <!-- ---------------- FOOTER ----------------------- -->
         <div id="footer">
             <p id="footerData">Daniele Rendina</p>
         </div>

        <script src="/risorse/node_modules/jquery/dist/jquery.js"></script>
        <script src="/risorse/node_modules/mustache/mustache.js"></script>
        <script type="text/javascript" src="/risorse/js/studentIndex.js"></script>
        
     </body>
 </html>
