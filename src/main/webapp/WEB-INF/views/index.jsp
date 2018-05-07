<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>

    <head>
        <title><spring:message code="message.index_pageTitle"/></title>
        <link href="<c:url value="/risorse/style.css" />" rel="stylesheet">
        
        
        
    </head>

    <body>
        <h1><spring:message code="message.index_title"/></h1>
        
        <script language="JavaScript">
            function goThere(form){
                var linkList=form.selectThis.selectedIndex
                if(!linkList==""){window.location.href=form.selectThis.options[linkList].value;}
            }
        </script>

        <form name="MenuTendina">
            <select name="selectThis" size="1" onChange="goThere(this.form);">
                <option selected value=""><spring:message code="message.index_language"/>
                <option value="/index/?lang=it"><spring:message code="message.index_languageIt"/>
                <option value="/index/?lang=en"><spring:message code="message.index_languageEn"/>
            </select>
        </form>
        
        <br>
        <div class="buttonCustom">
            <form:form method="GET" action="/students/all">
                <input type="submit" value="<spring:message code="message.index_students"/>">
            </form:form>
            
            <form:form method="GET" action="/matters/matterView">
                <input id="GMDE" type="submit" value="<spring:message code="message.index_matters"/>">
            </form:form>
    
            <form:form method="GET" action="/exams/examIndex">
                <input type="submit" value="<spring:message code="message.index_exams"/>">
            </form:form>
            <br>
        </div>
    </body>
</html>
