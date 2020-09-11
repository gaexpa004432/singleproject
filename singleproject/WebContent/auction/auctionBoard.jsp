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
<form action="${pageContext.request.contextPath}/auctionBoard.do">
사진	<input type="file">
내용	<input name="name">
시작가	<input name="startprice">
경매기간 설정 : 
<select name="day"> 
<c:forEach begin="0" end="6" var="i">
	<option value="${ i*24 }">${ i } 일</option>
</c:forEach>
		
</select> 
<select name="time"> 
<c:forEach begin="0" end="24" var="i">
	<option value="${ i }">${ i } 시간</option>
</c:forEach>
		
</select> 

	<button>등록</button>
</form>
</body>
</html>