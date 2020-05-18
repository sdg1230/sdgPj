<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
/* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 25px;
	margin-bottom: 10px;
	padding: 0;
}

.homeIcon>img {
	margin-top: 5px;
}

.headermiddle {
	padding-top: 4px;
}
/* 헤더 제대로적용------------------------ */
#pageNavi {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#pageNavi>* {
	margin: 10px;
}

.selectPage {
	font-size: 18px;
}

.btn, .selectPage {
	text-align: center;
	display: inline-block;
	border: 1px solid white;
	background-color: darkgray;
	width: 50px;
	height: 50px;
	line-height: 50px;
}

.title {
	padding-top: 5px;
	font-size: 1.5em;
	text-align: center;
	height: 350px;
	background-image: url("/upload/salon/lsit.jpg");
	background-size: 100%;
}

.title>span {
	color: white;
}

.title>h1 {
	color: white;
}

.affmenu {
	text-align: center;
}

.sele {
	width: 100%;
	height: 40px;
	font-size: 1.1em;
	text-align: center;
	background-color: darkgray;
	color: white;
}

.search1 {
	width: 300px;
	height: 40px;
	border: 1px solid white;
}

.tab {
	display: inline-block;
	border: 1px solid white;
	text-align: center;
}

#search1 {
	width: 820px;
	height: 100%;
}

.sub {
	width: 100px;
	height: 40px;
	background-color: cornflowerblue;
}

.affimg {
	width: 300px;
	height: 250px;
}
.affcontent{
	font-size: 1.2em;

}

.statd {
	overflow: hidden;
	width: 120px;
	text-align: center;
	height: 30px;
}

.sta {
	width: 20px;
	height: 20px;
}

.statd1 {
	display: block;
	border: 1px solid white;
	background-color: darkgray;
	color: white;
	width: 120px;
	height: 60px;
	text-align: center;
	line-height: 60px;
}

.td1 {
	display: block;
	width: 300px;
	height: 120px;
	line-height: 120px;
}
.td1>h1{
	margin: 0;
	float: left;
}
.salonname {
	text-align: center;
}

.content {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
	height: 100%;
	background-color: white;
	text-align: center;
}

.content1 {
	overflow: hidden;
	margin: 130px auto;
	margin-bottom: 0;
	height: 100%;
	background-color: white;
	text-align: center;
}

.spann {
	text-decoration: underline;
}

.salonSelect {
	display: block;
	width: 100%;
	height: 100%;
	background-color: darkgray;
	margin: 0 auto;
}

.tabb {
	margin: 0 auto;
	width: 100%;
}
label:hover{
	cursor:pointer;
}
</style>
<script>
	$(function() {
		$("#search1").click(function() {
			$("#search1").val("");
			$("#search1").css("color", "black");
		});
		$("form").submit(function() {
			if ($("#search1").val() == "") {
				$("#search1").val("아무것도 입력 되지 않았습니다.");
				$("#search1").css("color", "red");
				return false;
			}

		});
		$("label").mouseenter(function() {
			$(this).find(".tabb").css("border", "3px solid red");
			$(this).find(".salonSelect").css("background-color", "red");
			$(this).find("h1").css("font-size", "1.2em");
			
		});
		$("label").mouseleave(function() {
			$(this).find(".tabb").css("border", "1px solid white");
			$(this).find(".salonSelect").css("background-color", "darkgray");
			$(this).find("h1").css("background-color", "white");
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content1">
			<div class="title">
				<br>
				<h1>SALON INFORMATION</h1>
				<span>MEORIJOM HAIR만의 뷰티 서비스 퀄리티와 브랜드 가치를 높이기 위해서</span><br> <span
					class="spann">MEORIJOM HAIR는 체인 시스템이 아닌 직영시스텝을 고집합니다.</span>
			</div>
		</div>
		<div class="content">
			<br>
			<div class="affmenu">

				<form action="/salononeServlet" method="get">
					<table class="tab">
						<td class="search1"><select name="type" class="sele">
								<c:if test="${type eq 'salonName2' }">
									<option value="salonName2" selected>매장명</option>
									<option value="salonMap">지역명</option>
								</c:if>
								<c:if test="${type eq 'salonMap' }">
									<option value="salonName2">매장명</option>
									<option value="salonMap" selected>지역명</option>
								</c:if>
								<c:if test="${empty type}">
									<option value="salonName2">매장명</option>
									<option value="salonMap">지역명</option>
								</c:if>
						</select></td>
						<td class="search1"><input type="text" id="search1"
							name="search1" value="${key }"></td>
						<td>
							<button class="sub" id="sub" type="submit">조회</button>
						</td>
					</table>
				</form>

			</div>

			<div>

				<c:forEach var="list" items="${list }" varStatus="status">

					<a href="selectSalon?salonName=${list.salonName }">
					<label>
						<table class="tabb">

							<tr>
								<td class="affimg" rowspan="2"><img class="affimg"
									src="/upload/salon/${list.salonFilepath }"></td>
								<td colspan="2"  class="td1"><h1>${list.salonName }</h1>
									<input type="hidden" name="salonAddr" value="${ilst.salonAddr }">
								</td>
									
								<td class="statd"><c:if test="${list.reviewStar < 1 }">
										<img class="sta" src="/upload/salon/star3.jpg">
										<br> ${list.reviewStar }0점
								</c:if> <c:if test="${list.reviewStar < 1 && list.reviewStar >0}">
										<img class="sta" src="/upload/salon/star1.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar == 1}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar < 2 && list.reviewStar >1}">

										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star1.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar == 2}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar < 3 && list.reviewStar >2}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star1.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar == 3}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar < 4 && list.reviewStar >3}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star1.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar == 4}">

										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar < 5 && list.reviewStar >4}">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star1.jpg">
										<br> ${list.reviewStar }점
								</c:if> <c:if test="${list.reviewStar == 5}">

										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star2.jpg">
										<br> ${list.reviewStar }점<br>

									</c:if></td>
							</tr>
							<tr>
									<td class="affcontent" colspan="2" >${list.salonInfo }</td>
									</tr>
							




						



							<tr>
								<td class="salonname"></td>
							</tr>

						</table>

					</label>
</a>
					<br>
				</c:forEach>


			</div>
		</div>
		<div id="pageNavi">${pageNavi }</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>