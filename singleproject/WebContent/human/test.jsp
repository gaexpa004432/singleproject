<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
let today = new Date();   

let year = today.getFullYear(); 
let month = today.getMonth() + 1;  
let date = today.getDate(); 
let day = today.getDay();  
let hours = today.getHours(); 
let minutes = today.getMinutes(); 
console.log(year);
console.log(month);
console.log(date);
console.log(hours);
console.log(minutes);


});
</script>
</head>
<body>
${ sysdate }
</body>
</html>