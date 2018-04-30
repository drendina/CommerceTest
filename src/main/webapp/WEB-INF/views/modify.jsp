<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
    <body>
    <form:form method="POST" action="${action}" modelAttribute="studenteForm">
        <h1>modify student</h1>
        <table>
            <tr>
                <td><form:hidden path="id"/></td>
            </tr>
            <tr>
                <td><form:label path="firstname">Firstame</form:label></td>
                <td><form:input path="firstname"/></td>
                <td><form:errors path="firstname"></form:errors></td>
            </tr>
            <tr>
                <td><form:label path="lastname">Lastname</form:label></td>
                <td><form:input path="lastname"/></td>
                <td><form:errors path="lastname">Wrong lastname, retry</form:errors></td>
            </tr>
            <tr>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form:form>
    
    <a href="/index/">Return to HOME</a>
</body>
</html>
