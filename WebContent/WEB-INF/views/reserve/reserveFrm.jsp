<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Bangers|Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
<style>
#cal {
	display: none;
}

input[type=radio], input[type=checkbox] {
	display: none;
}

.selectFrm {
	margin: 20px;
	float: left;
	box-sizing: border-box;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 30%);
	overflow: auto;
	background-color: #f5f5f5;
}

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

.selectFrm-wrapper {
	width: 75%;
	overflow: hidden;
	float: left;
}

.selectFrm-submit {
	width: 25%;
	overflow: hidden;
	float: left;
}

.date {
	width: 340px;
	height: 340px;
}

.salons, .designers {
	width: 220px;
	height: 340px;
}

.salons>label>span, .designers>label>span {
	float: left;
	border-bottom: 1px solid #e5e5e5;
	width: 100%;
	height: 50px;
	box-sizing: border-box;
	text-align: center;
	line-height: 50px;
}

.salons>label>span:hover, .designers>label>span:hover, .menu>label>span:hover,
	.time>label>span:hover {
	background-color: #f0f0f0;
	color: black;
}

.menu {
	width: 410px;
	height: 200px;
}

.time {
	width: 410px;
	height: 200px;
}

.submit {
	width: 300px;
	height: 540px;
}

.salons input:checked+label>span, .designers input:checked+label>span,
	.menu input:checked+label>span, .time input:checked+label>span {
	background-color: #998778;
	color: white;
}
.time input:disabled+label>span{
	background-color : white;
	color : lightgray;
}

.menu>label>span, .time>label>span {
	text-align: center;
	line-height: 50px;
	float: left;
	width: calc(410px/ 5);
	height: 50px;
	border: 1px solid #e5e5e5;
	box-sizing: border-box;
}

.selectFrm-submit>input {
	color: white;
	font-size: 15px;
	/*margin-top: 500px;*/
	width: 100px;
	height: 50px;
	border: none;
	background-color: #998778;
}
.designer{
	display:none;
}
.selTime{
	display:none;
}
.menuInfo,.totalPrice{
	background-color:white;
	box-shadow:none;
}
.totalPrice{
	width:100%;
	height:200px;
}
.totalPrice>span{
	font-size : 30px;
}
</style>
<script>
	$(function() {
		var time=0;
		$("input[type=reset]").click(function() {
			$(".designer").hide();
			var myDatepicker = $('.fun').datepicker().data('datepicker');
			myDatepicker.clear();
			checkTime();
		});
		
		$("form").submit(function(){
			if($("#cal").val()==""){
				alert("날짜를 선택해주세요");
				return false;
			}
			
			var cnt=0;
			$("input[name=salonName]").each(function(index,item){
				if($(item).prop("checked")){
					cnt++;
				}
			});
			if(cnt==0){
				alert("지점을 선택해주세요");
				return false;
			}
			
			cnt=0;
			$("input[name=designerNo]").each(function(index,item){
				if($(item).prop("checked")){
					cnt++;
				}
			});
			if(cnt==0){
				alert("담당 디자이너를 선택해주세요");
				return false;
			}
			
			cnt=0;
			$("input[name=hairNo]").each(function(index,item){
				if($(item).prop("checked")){
					cnt++;
				}
			});
			if(cnt==0){
				alert("받을 시술을 선택해주세요");
				return false;
			}
			
			cnt=0;
			$("input[name=startTime]").each(function(index,item){
				if($(item).prop("checked")){
					cnt++;
				}
			});
			if(cnt==0){
				alert("예약할 시간을 선택해주세요");
				return false;
			}
		});
		
		$("input[name=salonName]").change(function(){
			var salonName1 = $(this).val();
			$(".designer").hide();
			$("input[name=startTime]").each(function(index,item){
				$(item).prop("checked",false);
			});
			$("input[name=designerNo]").each(function(index,item){
				$(item).prop("checked",false);
				var salonName2 = $(item).attr("salon");
				if(salonName1==salonName2){
					$(item).next().children().show();
				}
			});
			checkTime();
		});
		$(".date").click(function(){
			checkTime();
		});
		$("input[name=designerNo]").change(function(){
			checkTime();
		});
		$("input[name=hairNo]").click(function(){
			checkTime();
		});
	})
	
	function checkTime(){
		var reserveDate = null;
		var salonName = null;
		var designerNo = null;
		var time = 0;
		var totalPrice=0;
		$("input[name=startTime]").each(function(index,item){
			$(item).prop("checked",false);
		});
		$(".selTime").hide();
		
		var cnt=0;
		if($("#cal").val()!=""){
			reserveDate=$("#cal").val();
			cnt++;
		}
		$("input[name=salonName]").each(function(index,item){
			if($(item).prop("checked")){
				salonName = $(item).val();
				cnt++;
			}
		});
		$("input[name=designerNo]").each(function(index,item){
			if($(item).prop("checked")){
				designerNo = $(item).val();
				cnt++;
			}
		});
		$("input[name=hairNo]").each(function(index,item){
			if($(item).prop("checked")){
				var a = $(item).attr("time");
				var c = $(item).attr("pay");
				var b = Number(a)+Number(time);
				var d = Number(c)+Number(totalPrice);
				time = b;
				totalPrice = d;
			}
		});
		$("#totalPrice").html(totalPrice);
		$("input[name=totalPrice]").val(totalPrice);
		$("input[name=reserveTime]").val(time);
		if(time>0){
			cnt++;
		}
		if(cnt==4){
			$(".selTime").show();
			var param = {reserveDate:reserveDate,salonName:salonName,designerNo:designerNo};
			$.ajax({
				url : "/checkTime",
				data : param,
				dataType : "json",
				success : function(data){
					var st=1;
					$("input[name=startTime]").attr("disabled",false);
					for(var i=0; i<data.length; i++){
						var stt=0;
						var startTime = data[i].startTime;
						var reserveTime = data[i].reserveTime;
						
						var j=startTime;
						if(startTime-time<0){
							stt=0;
						}else{
							stt=startTime-time;
						}
						for(stt; stt<startTime-1; stt++){
							$("input[name=startTime]").eq(stt).attr("disabled",true);
						}
						if(j-st<time){
							for(var k=st; k<j; k++){
								$("input[name=startTime]").eq(k-1).attr("disabled",true);
							}
						}
						
						for(j; j<startTime+reserveTime; j++){
							$("input[name=startTime]").eq(j-1).attr("disabled",true);
						}
						st=j;
					}
					if(20-st+1<time){
						for(var k=st; k<=20; k++){
							$("input[name=startTime]").eq(k-1).attr("disabled",true);
						}
					}
					for(var k=20-time+1; k<20; k++){
						$("input[name=startTime]").eq(k).attr("disabled",true);
					}
				},error : function(){
					alert("예약시간정보를 불러오지못함");
				}
			});
		}
	}
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<link href="/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
		<script src="/dist/js/datepicker.min.js"></script>
		<script src="/dist/js/i18n/datepicker.en.js"></script>
		<div class="cTitle">#Reservation<span style="font-size: 20px;">예약하기</span>
		</div>
		<div class="content1">
			<form action="/insertReserve" method="post">
				<input type="text" name="memberId" value=${memberId } hidden>
				<input type="text" name="reserveTime" hidden>
				<div class="selectFrm-wrapper">
					<div>
						<div class="date selectFrm">
							<input id="cal" name="reserveDate" type='text' class="datepicker-here fun" data-position="right top" readonly />
						</div>
						<div class="salons selectFrm">
						<c:forEach items="${slist }" var="s">
							<input type="radio" id=${s.salonName } name="salonName" value=${s.salonName }><label for=${s.salonName }><span class="salon">${s.salonName }</span></label>
						</c:forEach>
						</div>
						<div class="designers selectFrm">
						<c:forEach items="${dlist }" var="d">
							<input type="radio" id="designer${d.designerNo }" name="designerNo" value=${d.designerNo } salon=${d.salonName }><label for="designer${d.designerNo }"><span class="designer">${d.designerName }</span></label>
						</c:forEach>
						</div>
					</div>
					<div>
						<div class="menu selectFrm">
						<c:forEach items="${hlist }" var="h">
							<input type="checkbox" id="hair${h.hairNo }" name="hairNo" value=${h.hairNo } time=${h.hairTime } pay=${h.hairPay } ><label for="hair${h.hairNo }"><span>${h.hairName }</span></label>
						</c:forEach>
						</div>
						<div class="time selectFrm">
							<input type="radio" id="time1" name="startTime" value=1><label for="time1"><span class="selTime" >10:00</span></label>
							<input type="radio" id="time2" name="startTime" value=2><label for="time2"><span class="selTime" >10:30</span></label>
							<input type="radio" id="time3" name="startTime" value=3><label for="time3"><span class="selTime" >11:00</span></label>
							<input type="radio" id="time4" name="startTime" value=4><label for="time4"><span class="selTime" >11:30</span></label>
							<input type="radio" id="time5" name="startTime" value=5><label for="time5"><span class="selTime" >12:00</span></label>
							<input type="radio" id="time6" name="startTime" value=6><label for="time6"><span class="selTime" >12:30</span></label>
							<input type="radio" id="time7" name="startTime" value=7><label for="time7"><span class="selTime" >13:00</span></label>
							<input type="radio" id="time8" name="startTime" value=8><label for="time8"><span class="selTime" >13:30</span></label>
							<input type="radio" id="time9" name="startTime" value=9><label for="time9"><span class="selTime" >14:00</span></label>
							<input type="radio" id="time10" name="startTime" value=10><label for="time10"><span class="selTime" >14:30</span></label>
							<input type="radio" id="time11" name="startTime" value=11><label for="time11"><span class="selTime" >15:00</span></label>
							<input type="radio" id="time12" name="startTime" value=12><label for="time12"><span class="selTime" >15:30</span></label>
							<input type="radio" id="time13" name="startTime" value=13><label for="time13"><span class="selTime" >16:00</span></label>
							<input type="radio" id="time14" name="startTime" value=14><label for="time14"><span class="selTime" >16:30</span></label>
							<input type="radio" id="time15" name="startTime" value=15><label for="time15"><span class="selTime" >17:00</span></label>
							<input type="radio" id="time16" name="startTime" value=16><label for="time16"><span class="selTime" >17:30</span></label>
							<input type="radio" id="time17" name="startTime" value=17><label for="time17"><span class="selTime" >18:00</span></label>
							<input type="radio" id="time18" name="startTime" value=18><label for="time18"><span class="selTime" >18:30</span></label>
							<input type="radio" id="time19" name="startTime" value=19><label for="time19"><span class="selTime" >19:00</span></label>
							<input type="radio" id="time20" name="startTime" value=20><label for="time20"><span class="selTime" >19:30</span></label>
						</div>
					</div>
				</div>
				<div class="selectFrm-submit">
					<div class="menuInfo selectFrm">
						<ul>
						<c:forEach items="${hlist }" var="h">
							<li>${h.hairName } - ${h.hairPay }원</li>
						</c:forEach>
						</ul>
					</div>
					<div class="totalPrice selectFrm">
						<span>가격 : <span id="totalPrice">0</span>원</span>
						<input type="text" name="totalPrice" hidden>
					</div>
					<input class="selectFrm" type="reset" value="선택 초기화">
					<input class="selectFrm" type="submit" value="예약하기">
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>