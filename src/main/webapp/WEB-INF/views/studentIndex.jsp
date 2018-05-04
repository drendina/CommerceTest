<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
    <head>
        <title>HomePage</title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
        
    </head>

   
    <body>

        <!-- ---------------- HEADER ----------------------- -->
        <div id = "header">
            <div id = "title">
                <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
                <p id="pageName">DATABASE STUDENTI
                    <button class="show-button">
                        <div class="button-text">INSERISCI NUOVO STUDENTE</div>
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
                <form:form name="myForm" method="POST" action="${student_basepath}/insert" onsubmit="return validateForm()" modelAttribute="studenteForm">
                    <p>Nome:<input type="text" name="firstname" value=""></p>
                    <form:errors path="firstname"></form:errors>
                    <p>Cognome:<input type="text" name="lastname" value=""></p>
                    <form:errors path="lastname"></form:errors>
                    <input type="submit" value="Submit" class="ajax-button">
                </form:form>
            </div>
            
            <form:form method="GET" action="/index/">
                <input type="submit" value="Return to home">
            </form:form>
            
            <script id="template" type="x-tmpl-mustache">
                    <li>
                        {{id}}
                        {{firstname}}
                        {{lastname}}
                        <button><a href="${student_basepath}/modify?id={{id}}">Modify</a></button>
                        <button><a href="${student_basepath}/delete?id={{id}}">Delete</a></button>
                        <button><a href="${student_basepath}/studentBio?id={{id}}">Bio</a></button>
                    </li>
            </script>
            
                <ul id="showData"></ul>
        </div>


         <!-- ---------------- FOOTER ----------------------- -->
         <div id="footer">
             <p id="footerData">Daniele Rendina</p>
         </div>
         
         <script src="https://code.jquery.com/jquery-3.2.1.min.js"
                 integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
                 crossorigin="anonymous"></script>
        <script src="/risorse/node_modules/mustache/mustache.js"></script>
        <script type="text/javascript" src="/risorse/js/studentIndex.js"></script>
        
     </body>
 </html>
