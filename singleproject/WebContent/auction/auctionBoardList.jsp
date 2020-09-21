<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<link rel="stylesheet" href="/singleproject/jquery-ui.min.css">
<link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/singleproject/jquery-ui.js"></script>
<script src="//cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<title>Insert title here</title>

<script type="text/javascript">


function inputCheck() {
	var startVal = $("input[name=start]").val();
	startVal = startVal * 1 ;//형변환
	var currentVal = $("input[name=current]").val();
	currentVal = currentVal * 1;
	if(startVal+1 > ($("input[name=registerPrice]").val()*1) || currentVal+1 > ($("input[name=registerPrice]").val()*1) || $("input[name=registerPrice]").val() ==""){
		alert("시작가나 현재가보다 높은금액을 입력해 주세요.")
		return false;
	}else{
		return true;
	}

	

	
	// 회원가입 폼 제출
	// frm.submit();
	return false;
	
}
$(function(){

	var start = 0;
	$("#dialog").dialog({
		 autoOpen: false,
		 height: 230,
		 width: 350,
		 modal : true  // 닫아야지 부모창 이용가능
		 
	
		
	});
/* 	var list = ${"boardList"};
	
	for(var list : list){
	function getTime() { 
		now = new Date(); 
		dday = new Date(2013,02,14,18,00,00); 
		// 원하는 날짜, 시간 정확하게 초단위까지 기입.
		days = (dday - now) / 1000 / 60 / 60 / 24; 
		daysRound = Math.floor(days); 
		hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound); 
		hoursRound = Math.floor(hours); 
		minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound); 
		minutesRound = Math.floor(minutes); 
		seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound); 
		secondsRound = Math.round(seconds); 

		document.getElementById("counter1").innerHTML = hoursRound; 
		document.getElementById("counter2").innerHTML = minutesRound; 
		document.getElementById("counter3").innerHTML = secondsRound; 
		newtime = window.setTimeout("getTime();", 1000); 
		} 
	}
		getTime(); */
	console.log($("button"));	
	$("#tb1 button").on("click",function(){
	  	console.log($(this).parents("tr").children().eq(0).text());
	  	start = $(this).parents("tr").children().eq(4).text();
		var current = $(this).parents("tr").children().eq(5).text();
		$("#dialog").html("시작 입찰가 : "+start+"<br> 현재 입찰가 : "+current+"<br><br><br><br><br> 입찰 금액 입력 :").append($("<input>").attr("name","registerPrice")
				.on("keypress",function (event) {
					if (event.which && (event.which <= 47 || event.which >= 58) && event.which != 8) {
						event.preventDefault(); 
						} 
					}));
		


		$("#dialog").append($("<input>").attr("name","auction_no").attr("hidden","hidden").val($(this).parents("tr").children().eq(0).text()));
		$("#dialog").append($("<input>").attr("name","start").attr("hidden","hidden").val(start));
		$("#dialog").append($("<input>").attr("name","current").attr("hidden","hidden").val(current));
		$("#dialog").append($("<button>").text("입찰 등록"));
		$("#dialog").append($("<button>").attr("type","button").text("취소").on("click",function(){
			 $("#dialog").dialog("close");
		}));
		$( "#dialog" ).dialog( "open" );
		console.log( start );
		console.log($("input[name=registerPrice]").val());
		  
	});
	$(document).ready( function () {
		$("#tb1").width("76%"); 
	    $('#tb1').DataTable();
	} );
});
</script>

</head>
<body align="center">
<%@include file="/header.jsp" %>
		<table id="tb1" >
		<thead><tr><th>글번호</th><th>사진</th><th>내용</th><th>종료일</th><th>시작입찰가</th><th>현재입찰가</th><th>작성자</th><th>입찰</th></tr></thead>
		
	<c:forEach items="${ boardList }" var="list" >
		<tr><td>${ list.no }</td>
		<c:if test="${not empty list.picture}">
    		<td><img src="images/${list.picture}" style="width:100px; height:100px;"></td>
    	</c:if>
		
		
		<td>${ list.name }</td><td>${ list.limit_date }</td><td>${ list.startprice }</td><td>${ list.limit }</td><td>${ list.id }</td><td><button>입찰</button></td></tr>
	</c:forEach>
	</table> 
	<nav>
	
</nav>
<section>
	
		
	

	

</section>
	<form id="dialog" action="biddingInsert.do" onsubmit="return inputCheck()"></form>
</body>
</html>