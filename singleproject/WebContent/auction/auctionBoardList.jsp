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
		<table border="1">
		<thead><tr><th>글번호</th><th>사진</th><th>내용</th><th>종료일</th><th>시작입찰가</th><th>작성자</th></tr></thead>
	<c:forEach items="${ boardList }" var="list" >
		<tr><td>${ list.no }</td><td>${ list.picture }</td><td>${ list.name }</td><td>${ list.limit_date }</td><td>${ list.startprice }</td><td>${ list.id }</td></tr>
	</c:forEach>
	</table>
</body>
</html>