<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
    <body>
    <form:form method="post" action="/index/addStudent" modelAttribute="studente">
        <table>
            <tr>
                <td><form:label path="id">Id</form:label></td>
                <td><form:textarea path="id" rows="1" readonly="true"/></td>
            </tr>
            <tr>
                <td><form:label path="firstname">Firstame</form:label></td>
                <td><form:input path="firstname"/></td>
            </tr>
            <tr>
                <td><form:label path="lastname">Lastname</form:label></td>
                <td><form:input path="lastname"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
