<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="jquery-ui.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var start = 0;
	$("#dialog").dialog({
		 autoOpen: false,
		 height: 230,
		 width: 350,
		 modal : true  // 닫아야지 부모창 이용가능
		 
	
		
	});
	console.log($("button"));	
	$("#tb1 button").on("click",function(){
		console.log();
	  	console.log($(this).parents("tr").children().eq(0).text());
	  	start = $(this).parents("tr").children().eq(4).text();
		var current = $(this).parents("tr").children().eq(5).text();
		$("#dialog").html("시작 입찰가 : "+start+"<br> 현재 입찰가 : "+current+"<br><br><br><br><br> 입찰 금액 입력 :").append($("<input>").attr("name","registerPrice"));
		$("#dialog").append($("<input>").attr("name","auction_no").attr("hidden","hidden").val($(this).parents("tr").children().eq(0).text()));
		$("#dialog").append($("<button>").text("입찰 등록"));
		$("#dialog").append($("<button>").attr("type","button").text("취소").on("click",function(){
			 $("#dialog").dialog("close");
		}));
		$( "#dialog" ).dialog( "open" );
		console.log( start );
		console.log($("input[name=registerPrice]").val());
		  
	
	});
});
</script>
</head>
<body>
		<table id="tb1" border="1">
		<thead><tr><th>글번호</th><th>사진</th><th>내용</th><th>종료일</th><th>시작입찰가</th><th>현재입찰가</th><th>작성자</th><th>입찰</th></tr></thead>
	<c:forEach items="${ boardList }" var="list" >
		<tr><td>${ list.no }</td><td>${ list.picture }</td><td>${ list.name }</td><td>${ list.limit_date }</td><td>${ list.startprice }</td><td>${ list.limit }</td><td>${ list.id }</td><td><button>입찰</button></td></tr>
	</c:forEach>
	</table>
	<form id="dialog" action="biddingInsert.do"></form>
</body>
</html>