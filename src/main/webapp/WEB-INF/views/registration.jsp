<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <div>
        <form:form method="POST" action="/user/registration/register" modelAttribute="user">
            <form:label path="name"> Nome </form:label>
            <form:input path="name"/>
            <br>
            <form:label path="surname"> Cognome </form:label>
            <form:input path="surname"/>
            <br>
            <form:label path="email"> Email </form:label>
            <form:input path="email"/>
            <br>
            <form:label path="password"> Password </form:label>
            <form:input path="password"/>
            <input type="submit" value="submit">
        </form:form>
        </div>
    </body>
</html>
