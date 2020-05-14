<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-top: 500px;
	width: 100px;
	height: 50px;
	border: none;
	background-color: #998778;
}
</style>
<script>
	$(function() {
		$("input[type=reset]").click(function() {
			var myDatepicker = $('.fun').datepicker().data('datepicker');
			myDatepicker.clear();
		});
	})
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
			<form action="#" method="post">
				<div class="selectFrm-wrapper">
					<div>
						<div class="date selectFrm">
							<input id="cal" name="reserveDate" type='text'
								class="datepicker-here fun" data-position="right top" readonly />
						</div>
						<div class="salons selectFrm">
							<input type="radio" id="1호점" name="salonName" value="1호점">
							<label for="1호점"><span class="salon">1호점</span></label> <input
								type="radio" id="2호점" name="salonName" value="2호점"> <label
								for="2호점"><span class="salon">2호점</span></label> <input
								type="radio" id="3호점" name="salonName" value="3호점"> <label
								for="3호점"><span class="salon">3호점</span></label>
						</div>
						<div class="designers selectFrm">
							<input type="radio" id="디자이너1" name="designerNo" value=1>
							<label for="디자이너1"><span class="designer">디자이너1</span></label> <input
								type="radio" id="디자이너2" name="designerNo" value=2> <label
								for="디자이너2"><span class="designer">디자이너2</span></label> <input
								type="radio" id="디자이너3" name="designerNo" value=3> <label
								for="디자이너3"><span class="designer">디자이너3</span></label>
						</div>
					</div>
					<div>
						<div class="menu selectFrm">
							<input type="checkbox" id="시술1" name="hairNo" value=1> <label
								for="시술1"><span>시술1</span></label> <input type="checkbox"
								id="시술2" name="hairNo" value=2> <label for="시술2"><span>시술2</span></label>
							<input type="checkbox" id="시술3" name="hairNo" value=3> <label
								for="시술3"><span>시술3</span></label> <input type="checkbox"
								id="시술4" name="hairNo" value=4> <label for="시술4"><span>시술4</span></label>
							<input type="checkbox" id="시술5" name="hairNo" value=5> <label
								for="시술5"><span>시술5</span></label> <input type="checkbox"
								id="시술6" name="hairNo" value=6> <label for="시술6"><span>시술6</span></label>
						</div>
						<div class="time selectFrm">
							<input type="radio" id="time1" name="startTime" value=1>
							<label for="time1"><span>10:00</span></label> <input type="radio"
								id="time2" name="startTime" value=2> <label for="time2"><span>10:30</span></label>
							<input type="radio" id="time3" name="startTime" value=3>
							<label for="time3"><span>11:00</span></label> <input type="radio"
								id="time4" name="startTime" value=4> <label for="time4"><span>11:30</span></label>
							<input type="radio" id="time5" name="startTime" value=5>
							<label for="time5"><span>12:00</span></label> <input type="radio"
								id="time6" name="startTime" value=6> <label for="time6"><span>12:30</span></label>
							<input type="radio" id="time7" name="startTime" value=7>
							<label for="time7"><span>13:00</span></label> <input type="radio"
								id="time8" name="startTime" value=8> <label for="time8"><span>13:30</span></label>
							<input type="radio" id="time9" name="startTime" value=9>
							<label for="time9"><span>14:00</span></label> <input type="radio"
								id="time10" name="startTime" value=10> <label
								for="time10"><span>14:30</span></label>
						</div>
					</div>
				</div>
				<div class="selectFrm-submit">
					<input class="selectFrm" type="reset" value="선택 초기화"> <input
						class="selectFrm" type="submit" value="예약하기">
				</div>
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>