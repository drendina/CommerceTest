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
        <img id="databaseImage" src="<c:url value="/risorse/img/database48.png"/>">
        <p id="pageName"><spring:message code="message.matterIndex_title"/></p>
        
            <script language="JavaScript">
                function goThere(form){
                    var linkList=form.selectThis.selectedIndex
                    if(!linkList==""){window.location.href=form.selectThis.options[linkList].value;}
                }
            </script>
        
            <form name="MenuTendina">
                <select name="selectThis" size="1" onChange="goThere(this.form);">
                    <option selected value=""><spring:message code="message.index_language"/>
                    <option value="/matters/matterView/?lang=it"><spring:message code="message.index_languageIt"/>
                    <option value="/matters/matterView/?lang=en"><spring:message code="message.index_languageEn"/>
                </select>
            </form>
        
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
            <input id="buttonSub" type="submit" value="<spring:message code="message.general_submit"/>">
        </form>
    </div>

</div>

<form:form method="GET" action="/index/">
    <input type="submit"  value="<spring:message code="message.general_returnLink"/>">
</form:form>


<script src="/risorse/node_modules/jquery/src/jquery.js"></script>
<script src="/risorse/node_modules/mustache/mustache.js"></script>
<script type="text/javascript" src="/risorse/js/matterIndex.js"></script>

</body>
</html>
