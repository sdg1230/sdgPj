<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>머리좀 헤어</title>
<style>
.cTitle {
	margin-top: 130px;
	padding-top: 50px;
	padding-left: 100px;
	font-size: 50px;
	text-decoration: underline;
	letter-spacing: 80%;
	width: 100%;
	height: 200px;
	opacity: 90%;
	color: white;
	background-color: #998778;
	font-family: 'Anton', sans-serif;
}

.content1 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}
p{
	display:inline-block;
	font-size:20px;
}
.top {
	width: 100%;
	height: 50px;
	background-color: #F5F5F5;
	text-align: center;
}

.list-wrapper {
	width: 100%;
	height: 700px;
	overflow: auto;
}

.listtable {
	width: 100%;
	border: 1px solid #e5e5e5;
	border-collapse: collapse;
	padding:0;
}

.listtable tr {
	height: 40px;
	overflow: hidden;
	border-bottom: 1px solid #e5e5e5;
}

.listtable th:nth-child(1){
	width:5%;
}
.listtable th:nth-child(2){
	width:9%;
}
.listtable th:nth-child(3){
	width:13%;
}
.listtable th:nth-child(4){
	width:10%;
}
.listtable th:nth-child(5){
	width:14%;
}
.listtable th:nth-child(6){
	width:12%;
}
.listtable th:nth-child(7){
	width:9%;
}
.listtable th:nth-child(8){
	width:14%;
}
.listtable th:nth-child(9){
	width:5%;
}
.listtable th:nth-child(10){
	width:5%;
}
.listtable th:nth-child(11){
	width:5%;
}

.listtable th {
	line-height:40px;
	padding:0;
	text-align:center;
}

.listtable th>input, #selectSalon {
	width: 100%;
	font-size: 15px;
	border: 1px solid lightgray;
	box-sizing: border-box;
}

#searchDate{
	width:100%;
}
.statusBtn{
	color: black;
    font-size: 15px;
    background-color: #f5f5f5;
    border:none;
    height: 30px;
    box-shadow: lightgray 0px 0px 2px 2px;
    border-radius: 5px;
}
.statusBtn:hover{
	cursor: pointer;
    color: white;
    background-color: #998778;
}
</style>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script>
	$(function(){
		$("#searchName").keyup(function(){
			$("#searchDate").val("");
			if($("#searchName").val()!=""&&$("#searchPhone").val()==""){
				var val = $("#searchName").val();
				$(".list-tr").css("display","none");
				$(".list-tr").each(function(index,item){
					if($(item).children(".memberName").html().match(val)){
						$(item).css("display","flex");
					}
				});
			}else if($("#searchName").val()!=""&&$("#searchPhone").val()!=""){
				var val1 = $("#searchPhone").val();
				var val2 = $("#searchName").val();
				$(".list-tr").css("display","none");
				$(".list-tr").each(function(index,item){
					if($(item).children(".memberPhone").html().match(val1)&&$(item).children(".memberName").html().match(val2)){
						$(item).css("display","flex");
					}
				});
			}else if($("#searchName").val()==""&&$("#searchPhone").val()!=""){
				$("#searchPhone").keyup();
			}else{
				$(".list-tr").css("display","flex");
			}
		});

		$("#searchPhone").keyup(function(){
			$("#searchDate").val("");
			if($("#searchPhone").val()!="" && $("#searchName").val()!=""){
				var val1 = $("#searchPhone").val();
				var val2 = $("#searchName").val();
				$(".list-tr").css("display","none");
				$(".list-tr").each(function(index,item){
					if($(item).children(".memberPhone").html().match(val1)&&$(item).children(".memberName").html().match(val2)){
						$(item).css("display","flex");
					}
				});
			}else if($("#searchName").val()=="" && $("#searchPhone").val()!=""){
				var val1 = $("#searchPhone").val();
				$(".list-tr").css("display","none");
				$(".list-tr").each(function(index,item){
					if($(item).children(".memberPhone").html().match(val1)){
						$(item).css("display","flex");
					}
				});
			}else if($("#searchPhone").val()==""){
				$("#searchName").keyup();
			}else{
				$(".list-tr").css("display","flex");
			}
		});
		

		$("#searchDate").change(function(){
			$("#searchName").val("");
			$("#searchPhone").val("");
			var val = $("#searchDate").val();
			$(".list-tr").css("display","none");
			$(".list-tr").each(function(index,item){
				if($(item).children(".reserveDate").html().match(val)){
					$(item).css("display","flex");
				}
			});
		});
		
		$("#selectStatus").change(function(){
			$("#selectSalon").change();
		});
		$("#selectSalon").change(function(){
			$("#searchName").val("");
			$("#searchPhone").val("");
			$("#searchDate").val("");
			var status = $("#selectStatus").val();
			var salonName = $(this).val();
			var param = {salonName:salonName,status:status};
			$.ajax({
				url : "/selectReserveList",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){
					var html="";
					for(var i=0; i<data.length; i++){
						var html2 = "";
						for(var j=0; j<data[i].menuList.length; j++){
							html2 += data[i].menuList[j].hairName;
							if(j<data[i].menuList.length-1){
								html2 += ",";
							}
						}
						html += "<tr class='list-tr'>";
						html += "<th class='reserveNo'>"+data[i].reserveNo+"</th>";
						html += "<th class='memberName'>"+data[i].memberName+"</th>";
						html += "<th class='memberPhone'>"+data[i].memberPhone+"</th>";
						html += "<th class='salonName'>"+data[i].salonName+"</th>";
						html += "<th>"+data[i].designerName+"</th>";
						html += "<th class='reserveDate'>"+data[i].reserveDate+"</th>";
						var time="";
						switch(data[i].startTime){
						case 1:
							time="10:00";
							break;
						case 2:
							time="10:30";
							break;
						case 3:
							time="11:00";
							break;
						case 4:
							time="11:30";
							break;
						case 5:
							time="12:00";
							break;
						case 6:
							time="12:30";
							break;
						case 7:
							time="13:00";
							break;
						case 8:
							time="13:30";
							break;
						case 9:
							time="14:00";
							break;
						case 10:
							time="14:30";
							break;
						case 11:
							time="15:00";
							break;
						case 12:
							time="15:30";
							break;
						case 13:
							time="16:00";
							break;
						case 14:
							time="16:30";
							break;
						case 15:
							time="17:00";
							break;
						case 16:
							time="17:30";
							break;
						case 17:
							time="18:00";
							break;
						case 18:
							time="18:30";
							break;
						case 19:
							time="19:00";
							break;
						case 20:
							time="19:30";
							break;
						}
						html += "<th class='time'>"+time+"</th>";
						html += "<th style='font-size:12px;'>"+html2+"</th>";
						var paymentStatus = "";
						if(data[i].paymentStatus=="true"){
							paymentStatus = "했음";
						}else{
							paymentStatus = "안함";
						}
						html += "<th class='pay'>"+paymentStatus+"</th>";
						if(data[i].reserveStatus=="false"){
							html += "<th><button class='statusBtn stat' onclick='changefunc("+data[i].reserveNo+");'>방문</button>"
							html += "<th><button onclick='deleteReserve("+data[i].reserveNo+");' class='statusBtn stat'>취소</button></tr>"
						}else{
							html += "<th class='stat'>방문함</th>";
							html += "<th></th></tr>";
						}
					}
					$(".reserveList").html(html);
				},
				error : function(){
					console.log("실패");
				}
			});
		});
		
		$("#selectStatus").change();
	})
	function changefunc(reserveNo){
		var param = {reserveNo:reserveNo};
		$.ajax({
			url : "/changeReserveStatus",
			data : param,
			type : "post",
			dataType : "json",
			success : function(data){
				$("#selectStatus").change();
			},
			error : function(data){
				alert("실패");
			}
		});
	}
	
	function deleteReserve(reserveNo){
		if(confirm("예약을 취소시키겠습니까?")){
			var param = {reserveNo:reserveNo};
			$.ajax({
				url : "/adminDeleteReserve",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){
					if(data==0){
						alert("삭제실패");
					}else{
						$("#selectStatus").change();
					}
				},
				error : function(data){
					alert("실패");
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle">#Reservation Manage<span style="font-size:20px;">예약관리</span></div>
		<div class="content1">
			<table class="listtable" style="width:100%;">
				<tr>
					<th>번호</th>
					<th>예약자</th>
					<th>전화번호</th>
					<th>지점</th>
					<th>담당 디자이너</th>
					<th>예약 날짜</th>
					<th>예약 시간</th>
					<th>시술 목록</th>
					<th>선결제</th>
					<th>상태</th>
					<th>취소</th>
				</tr>
				<tr>
					<th></th>
					<th><input type="text" id=searchName></th>
					<th><input type="text" id=searchPhone></th>
					<th><select id="selectSalon" name="selectSalon">
						<c:forEach items="${slist }" var="s">
							<option value="${s.salonName }">${s.salonName }</option>
						</c:forEach>
					</select></th>
					<th></th>
					<th><input type="date" id=searchDate></th>
					<th></th>
					<th></th>
					<th></th>
					<th><select id="selectStatus">
						<option value="false">예약중</option>
						<option value="true">방문함</option>
					</select></th>
				</tr>
			</table>
			<div class="list-wrapper">
				<table class="listtable">
					<tbody class="reserveList">
					</tbody>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>