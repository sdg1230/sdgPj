<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	width: 120px;
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
}

.content1 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}
</style>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script>
	$(function(){
		$("#searchName").keyup(function(){
			var val = $("#searchName").val();
			if(val!=""&&val!=null){
				
			}
		});
	})
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle">Reserve List</div>
		<div class="content1">
			<table class="listtable">
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
				</tr>
				<tr>
					<th><button class="search">찾기</button></th>
					<th><input type="text" id=searchName></th>
					<th><input type="text" id=searchPhone></th>
					<th><select id="selectSalon" id="selectSalon">
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
					<c:forEach items="${list }" var="r">
						<tr class="list-tr">
							<th>${r.reserveNo }</th>
							<th>${r.memberName }</th>
							<th>${r.memberPhone }</th>
							<th>${r.salonName }</th>
							<th>${r.designerName }</th>
							<th>${r.reserveDate }</th>
							<th>${r.startTime }</th>
							<th style="font-size:12px;">
								<c:forEach items="${dlist }" var="rd">
									<c:if test="${r.reserveNo eq rd.reserveNo }">
										${rd.hairName }
									</c:if>
								</c:forEach>
							</th>
							<th>${r.paymentStatus }</th>
							<th>
								${r.reserveStatus }
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>