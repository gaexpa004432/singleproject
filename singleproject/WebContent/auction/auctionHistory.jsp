<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="tb1" border="1">
<c:forEach items="his" var="list">
<tr><td>${ list.no }</td><td>${ list.id }</td><td>${ list.picture }</td><td>${ list.limit }</td></tr>
</c:forEach>
</table>
</body>
</html>