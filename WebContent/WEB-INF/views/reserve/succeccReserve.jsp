<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Bangers|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css?family=Anton&display=swap"
	rel="stylesheet">
<style>
    /* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 25px;
	margin-bottom:10px;
	padding:0;
}
.homeIcon>img {
	margin-top:5px;
}
.headermiddle{
	line-height:30px;
	padding-top:4px;
}
/* 헤더 제대로적용------------------------ */
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
	background-color: #CD3C41;
	font-family: 'Anton', sans-serif;
}

.content1 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

}
.reserveInfo1 {
	width: 500px;
	height: 500px;
	border: 1px solid lightgray;
	overflow: hidden;
}

h1,p {
	text-align: center;
}
    p{
        margin-top: 50px;
        margin-bottom: 50px;
        font-size: 20px;
        font-weight: bold;
    }
    h1{
       text-decoration-line: underline;
        text-decoration-color: #CD3C41;
        
    }
table{
	margin: 0 auto;
    padding: 10px;
    border-collapse: collapse;
   
}
table td {
	width: 150px;
	height: 40px;
    border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle">
			#Reservation<span style="font-size: 20px;">예약하기</span>
		</div>
		<div class="content1">
			<div class="reserveInfo1">
				<c:if test="${msg=='예약완료' }">
					<h1>${msg }</h1>
					<table>
						<tr>
							<td>아이디</td>
							<td>${reserveInfo1.memberId }</td>
						</tr>
						<tr>
							<td>예약날짜</td>
							<td>${reserveInfo1.reserveDate }</td>
						</tr>
						<tr>
							<td>예약지점 이름</td>
							<td>${reserveInfo1.salonName }</td>
						</tr>
						<tr>
							<td>예약시간</td>
							<td>${reserveInfo1.startTime }</td>
						</tr>
						<tr>
							<td>금액</td>
							<td>${reserveInfo1.totalPrice }</td>
						</tr>
					</table>
					<p>마이페이지에 가서 선결제를 하시면 할인된 금액으로 결제가능합니다</p>
				</c:if>
				<c:if test="${msg=='예약실패' }">
					<h1>${msg }</h1>
				</c:if>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>