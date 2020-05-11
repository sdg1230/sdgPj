<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>머리좀 헤어</title>
<style>
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
}

.listtable tr {
	height: 40px;
	overflow: hidden;
	border-bottom: 1px solid #e5e5e5;
}

.listtable th {
	width: 10%;
}

.listtable th:nth-child(1) {
	width: 5%;
}

.listtable th:nth-child(2) {
	width: 7%;
}

.listtable th:nth-child(4) {
	width: 17%;
}

.listtable th:nth-child(7) {
	width: 6%;
}

.listtable th:nth-child(9) {
	width: 5%;
}

.listtable th>input, #selectSalon {
	width: 100%;
	font-size: 15px;
	border: 1px solid lightgray;
	box-sizing: border-box;
}

.status-button {
	height: 30px;
	width: 80px;
}
</style>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content">
			<h1 class="top">예약 리스트</h1>
			<table class="listtable">
				<tr>
					<th>예약번호</th>
					<th>예약자</th>
					<th>전화번호</th>
					<th>지점</th>
					<th>담당 디자이너</th>
					<th>예약 날짜</th>
					<th>예약 시간</th>
					<th>시술 목록</th>
					<th>선결제</th>
					<th>상태</th>
				</tr>
				<tr>
					<th></th>
					<th><input type="text" name=searchName></th>
					<th><input type="text" name=searchPhone></th>
					<th><select id="selectSalon" name="selectSalon">
							<option value="a">a</option>
					</select></th>
					<th></th>
					<th><input type="text" name=searchDate></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</table>
			<div class="list-wrapper">
				<table class="listtable">
					<tr>
						<th>1</th>
						<th>박민수</th>
						<th>010-2450-7644</th>
						<th>홍대입구역점</th>
						<th>아무개</th>
						<th>2020-05-11</th>
						<th>13:00</th>
						<th>남성 컷</th>
						<th>안함</th>
						<th><button class="status-button">완료</button></th>
					</tr>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>