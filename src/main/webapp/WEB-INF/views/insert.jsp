<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>Insert new student</p>

<form:form method="GET" action="/index/insert">
    <p>First name:</p>
    
    <input type="text" name="firstname" value="">
    <br>
    <p>Last name:</p>
    
    <input type="text" name="lastname" value="">
    <br>
    <input type="submit" value="Submit">
</form:form>

</body>
</html>
