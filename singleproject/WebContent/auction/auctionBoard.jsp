<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function onlyNumber(event){
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        return false;
}
 
function removeChar(event) {
    event = event || window.event;
    var keyID = (event.which) ? event.which : event.keyCode;
    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
        return;
    else
        event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

</script>
</head>
<body align="center">
<%@include file="/header.jsp" %>
<h1>경매 등록</h1>
<p>

<form method="post" name="frm" id="frm" action="/singleproject/auctionBoard.do" enctype='multipart/form-data'>
사진	<input type="file" name="filename" ><br><p><p>내용<br>
	<textarea rows="4" cols="50" name="content" required></textarea><br><p><p><p><p>
시작가	<input type="text" name="startprice" value="0" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'><br>
너무 높은 숫자는 넣지 말아주세요.<p><p><p><p><p><p><p><p>

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
		
</select> <p><p><p><p><p><p><p><p>

	<button>등록</button>
</form>
</body>
</html>