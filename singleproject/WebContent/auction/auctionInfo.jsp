<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
<%@include file="/header.jsp" %>
	<form method="post" action="/singleproject/auctionInfo.do">
		id : <input name="id" value="${info.id}" disabled><p>
		pw : <input name="pw" value="${info.pw}"><p>
		name: <input name="name" value="${info.name}"><p>
		<input name="update" value="exist" hidden>
		<button>수정</button>
	</form>
</body>
</html>