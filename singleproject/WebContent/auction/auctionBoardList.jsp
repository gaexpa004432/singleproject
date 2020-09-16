<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet/less" type="text/css" href="/singleproject/styles.less" />
<script src="//cdn.jsdelivr.net/npm/less" ></script>

<meta charset="UTF-8">
<link rel="stylesheet" href="/singleproject/jquery-ui.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/singleproject/jquery-ui.js"></script>
<title>Insert title here</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:300,400);

*{
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body{
	font-family: 'Lato', sans-serif;
	color: lighten(black, 40%);
	
	background-color: grey;
}

nav{
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background-color: fade(#212121, 90%);
	
	padding: 10px;
	
	text-align: center;
	
	.button{
		display: inline-block;
		padding: 5px 10px;
		border: 1px solid fade(white, 50%);
		
		color: white;
		
		border-radius: 5px;
		margin-right: 5px;
		
		&:hover{
			border: 1px solid white;
			background-color: white;
			cursor: pointer;
			
			color: #D44557;
		}
	}
}

section{
	max-width: 600px;
	margin: 50px auto;
}

.post-wrapper{
	
	&:first-child{
		.post-inner{
		background-color: lightgrey;
			border-top-color: fade(black, 10%);
		}
	}
	
	.post-inner{
		background-color: lightgrey;
		display: block;		
		cursor: pointer;
		
		overflow: hidden;
		
		text-decoration: none;
		color: lighten(black, 40%);
		
		transition-duration: 0.25s;
		transition-timing-function: ease-out;
		
		border-bottom: 1px solid fade(black, 10%);
		
		padding: 20px;
		
		&.open{
			margin-top: 20px;
			margin-bottom: 20px;
			
			border-radius: 5px;
			box-shadow: 0 4px 1px fade(black, 20%);
			
			border-bottom-color: transparent;
			
			&:hover{
				background-color: white;
			}
		}
		
		&:hover{
			background-color: rgb(240, 242, 245);
		}
		
		h2{
			font-weight: 400;
			color: #54626C;
		}
		
		.text{
			display: none;
		}
		
		p{
			font-weight: 300;	
			padding: 10px 0;
			
			&.lead{
				font-size: 1.2em;
			}
		}
	}
}
</style>
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
	$('.post-wrapper').click(function(){
		$('.post-inner', this).toggleClass('open').children('.text').slideToggle(500);
	});

	$('.open-all').click(function(){
		$('.post-inner').addClass('open').children('.text').slideDown(500);;
	});

	$('.close-all').click(function(){
		$('.post-inner').removeClass('open').children('.text').slideUp(500);;
	});

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
});
</script>

</head>
<body align="center">
<%@include file="/header.jsp" %>
		<%-- <table id="tb1" border="1" align="center">
		<thead><tr><th>글번호</th><th>사진</th><th>내용</th><th>종료일</th><th>시작입찰가</th><th>현재입찰가</th><th>작성자</th><th>입찰</th></tr></thead>
		
		<tr><td>${ list.no }</td>
		<c:if test="${not empty list.picture}">
    		<td><img src="images/${list.picture}" style="width:250px"></td>
    	</c:if>
		
		
		<td>${ list.name }</td><td>${ list.limit_date }</td><td>${ list.startprice }</td><td>${ list.limit }</td><td>${ list.id }</td><td><button>입찰</button></td></tr>
	</table> --%>
	<nav>
	<div class="open-all button">Open all</div>
	<div class="close-all button">Close all</div>
</nav>
<section>
	
	<c:forEach items="${ boardList }" var="list" >
	</c:forEach>
		<div class="post-wrapper" style="background-color:white;" >
		<div class="post-inner" >
			<h2>I am the contents of this post.</h2>
			<p class="lead">Lorem ipsum dolor sium quis, sem. Nulla consequat massa quis enim  rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum.</p>

			<div class="text">
				<p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus.</p>
			</div>
		</div>
	</div>
	

	

</section>
	<form id="dialog" action="biddingInsert.do" onsubmit="return inputCheck()"></form>
</body>
</html>