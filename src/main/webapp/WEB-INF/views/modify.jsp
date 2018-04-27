<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
    <body>
    <form:form method="POST" action="${action}" modelAttribute="studente">
        <h1>modify student</h1>
        <table>
            <tr>
                <td><form:label path="id">Id</form:label></td>
                <td><form:hidden path="id"/>${studente.id}</td>
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
    
    <a href="/index/">Return to HOME</a>
</body>
</html>
