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
	height: 250px;
	background-image:
		url("../imgs/%EC%A4%80%EC%96%B4%20%ED%97%A4%EC%96%B4.jpg");
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

.statd {
	overflow: hidden;
	width: 120px;
	text-align: center;
	width: 120px;
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

.salonname {
	text-align: center;
}
</style>
<script>
	$(function() {
		 $("#search1").click(function(){
			 $("#search1").val("");
             $("#search1").css("color","black");
         });
		$("form").submit(function() {
			if ($("#search1").val()=="") {
				$("#search1").val("아무것도 입력 되지 않았습니다.");
				$("#search1").css("color", "red");
				return false;
			}
			
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="content">
			<div class="title">
				<h1>SALON INFORMATION</h1>
				<span>MEORIJOM HAIR만의 뷰티 서비스 퀄리티와 브랜드 가치를 높이기 위해서</span><br> <span>MEORIJOM
					HAIR는 체인 시스템이 아닌 직영시스텝을 고집합니다.</span>
			</div>
			<br>
			<div class="affmenu">
				<form action="/affilateone" method="get">
					<table class="tab">
						<td class="search1">
						<select class="sele">
								<option class="sele">광역시/군</option>
								<option class="sele">서울특별시</option>
								<option class="sele">인천광역시</option>
								<option class="sele">대전광역시</option>
								<option class="sele">광주광역시</option>
								<option class="sele">대구광역시</option>
								<option class="sele">울산광역시</option>
								<option class="sele">부산광역시</option>
								<option class="sele">경기도</option>
								<option class="sele">강원도</option>
								<option class="sele">충청북도</option>
								<option class="sele">충청남도</option>
								<option class="sele">전라북도</option>
								<option class="sele">전라남도</option>
								<option class="sele">경상북도</option>
								<option class="sele">경상남도</option>
								<option class="sele">제주도</option>
						</select></td>
						<td class="search1"><input type="text" id="search1"
							name="search1" placeholder="지역이나 매장명을 입력해주세요."></td>
						<td><input class="sub" id="sub" type="submit" value="검색"></td>
					</table>
				</form>

			</div>

			<div>
				<table>
					<c:forEach var="list1" items="${list }" varStatus="status">

						<tr>
							<td class="affimg" rowspan="2"><img class="affimg"
								src="/upload/salon/${list1.salonFilepath }"></td>
							<td class="affcontent" colspan="2" rowspan="2">${list1.salonInfo }</td>

							<td class="statd"><c:if
									test="${star[status.index].reviewStar < 1}">

									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star[status.index].reviewStar == 1}">

									<img class="sta" src="/upload/salon/star2.jpg">
								</c:if> <c:if
									test="${star[status.index].reviewStar < 2 && star[status.index].reviewStar >1}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star[status.index].reviewStar == 2}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
								</c:if> <c:if
									test="${star[status.index].reviewStar < 3 && star[status.index].reviewStar >2}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star[status.index].reviewStar == 3}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
								</c:if> <c:if
									test="${star[status.index].reviewStar < 4 && star[status.index].reviewStar >3}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star[status.index].reviewStar == 4}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">

								</c:if> <c:if
									test="${star[status.index].reviewStar < 5 && star[status.index].reviewStar >4}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star[status.index].reviewStar == 5}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">

								</c:if><br> ${star[status.index].reviewStar }점</td>

						</tr>



						<tr>
							<td class="salonname">${list1.salonName }<a class="statd1"
								href="selectSalon?salonName=${list1.salonName }">지점 상세 보기</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="pageNavi">${pageNavi }</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>