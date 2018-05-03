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
                <form:form method="GET" action="${student_basepath}/insert">
                    <p>Nome:<input type="text" name="firstname" value=""></p>
                    <p>Cognome:<input type="text" name="lastname" value=""></p>
                    <input type="submit" value="Submit" class="ajax-button">
                </form:form>
            </div>

            <form:form method="GET" action="/index/">
                <input type="submit" value="Return to home">
            </form:form>
    
            <input type="submit" value="Lista degli studenti" class="ajax-button">
                
                <table id="target"></table>
            
            
            <script id="template" type="x-tmpl-mustache">
                <tr>
                    <td>{{id}}</td>
                    <td>{{firstname}}</td>
                    <td>{{lastname}}</td>
                    <td><a href="${student_basepath}/modify?id={{id}}">Modify</a></td>
                    <td><a href="${student_basepath}/delete?id={{id}}">Delete</a></td>
                    <td><a href="${student_basepath}/studentBio?id={{id}}">Bio</a></td>
                </tr>
            </script>
            
                <table id="showData">
                        <c:forEach items="${lista}" var="student">
                            <tr>
                                <td> ${student.id} </td>
                                <td> ${student.firstname} </td>
                                <td> ${student.lastname} </td>
                                <td><a href="${student_basepath}/modify?id=${student.id}">Modify</a></td>
                                <td><a href="${student_basepath}/delete?id=${student.id}">Delete</a></td>
                                <td><a href="${student_basepath}/studentBio?id=${student.id}">Bio</a></td>
                            </tr>
                        </c:forEach>
                    
                </table>
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
