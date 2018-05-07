<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title><spring:message code="message.modify_pageTitle"/></title>
</head>
    <body>
    <form:form method="POST" action="${action}" modelAttribute="studenteForm">
        <h1><spring:message code="message.modify_title"/></h1>
        <table>
            <tr>
                <td><form:hidden path="id"/></td>
            </tr>
            <tr>
                <td><form:label path="firstname"><spring:message code="message.modify_name"/></form:label></td>
                <td><form:input path="firstname"/></td>
                <td><form:errors path="firstname"></form:errors></td>
            </tr>
            <tr>
                <td><form:label path="lastname"><spring:message code="message.modify_surname"/></form:label></td>
                <td><form:input path="lastname"/></td>
                <td><form:errors path="lastname"></form:errors></td>
            </tr>
            <tr>
                <td><input type="submit" value="<spring:message code="message.general_submit"/>"/></td>
            </tr>
        </table>
    </form:form>
    
    <a href="/index/"><spring:message code="message.general_returnLink"/></a>
</body>
</html>
