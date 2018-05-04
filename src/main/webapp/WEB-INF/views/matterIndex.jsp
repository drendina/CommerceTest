<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Exams</title>
    <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">

</head>

<body>


<div id = "header">
    <div id = "title">
        <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
        <p id="pageName">DATABASE MATERIE</p>
    </div>
    <div id = "search">
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
                    </li>
    </script>
    <ul id="showMatterData"></ul>

    <div id="insertExam">
        <h4>Inserisci un nuovo esame</h4>
        <form id="myForm" method="POST" action="${matter_basepath}/insertMatter">
            <p>Nome esame:</p>
            <input type="text" name="matterName" value="">
            <input id="buttonSub" type="submit" value="Submit">
        </form>
    </div>

</div>

<form:form method="GET" action="/index/">
    <input type="submit"  value="Return to home">
</form:form>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
<script src="/risorse/node_modules/mustache/mustache.js"></script>
<script type="text/javascript" src="/risorse/js/matterIndex.js"></script>

</body>
</html>
