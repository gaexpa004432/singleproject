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
<tr><th>글번호</th><th>입찰자 id</th><th>그림</th><th>입찰 종료 시간</th><th>입찰금액</th></tr>
<c:forEach items="${ his }" var="list">
<c:if test="${ sessionScope.id == list.id}">
<tr><td>${ list.no }</td><td>${ list.id }</td><td>${ list.picture }</td><td>${ list.limit }</td><td>${ list.his_no }</td></tr>
</c:if>

</c:forEach>
</table>
</body>
</html>