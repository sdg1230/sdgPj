<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Bangers|Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="/css/header/hStyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	//사이드바
	function up() {
		window.scrollTo(0, 0);
	}
	$(function() {false
		//사이드 아이콘 클릭
		$(".sideicon").click(function() {
			if (($(this).parent().css("right")) == "0px") {
				$(this).parent().css("right", "-120px");
				$(this).children().attr("src", "/imgs/sideicon2.png");
			} else {
				$(this).parent().css("right", "0");
				$(this).children().attr("src", "/imgs/sideicon.png");
			}

		});

		//헤더 움직이기...
		$(window).scroll(
				function() {
					var height = 0;
					height = $(window).scrollTop();
					if (height >= 59) {
						$(".header3").css("height", "60px").css("opacity",
								"88%")
								.css("border-bottom", "1px solid #999999");
						$(".hNavi>*").animate({
							lineHeight : "60px"
						}, 10);
						$(".header").css("height", "100px");
					} else {
						$(".header3").css("height", "90px").css("opacity",
								"100%").css("border-bottom", "");
						$(".hNavi>*").animate({
							lineHeight : "90px"
						}, 10);
						$(".header").css("height", "130px");
					}
				});
		
	});
	
	function reserveFunc(memberId){
		if(memberId==""){
			alert("로그인이 필요합니다");
			location.href="/loginFrm";
		}else{
			if(memberId=="admin"){
				location.href="/adminReserveList";
			}else{
				location.href="/reserveFrm";
			}
		}
	}
</script>

<div class="sidebar">
	<span class="sideicon"><img src="/imgs/sideicon.png"></span> <a
		href="javascript:void(0);" onclick="reserveFunc('${sessionScope.member.memberId}');">
		<div class="sidemenu">
			<img src="/imgs/reserve-icon.png">
			<c:if test="${empty sessionScope.member }">
				<div>예약하기</div>
			</c:if>
			<c:if test="${not empty sessionScope.member }">
				<c:if test="${sessionScope.member.memberId ne 'admin' }">
					<div>예약하기</div>
				</c:if>
				<c:if test="${sessionScope.member.memberId eq 'admin' }">
					<div>예약관리</div>
				</c:if>
			</c:if>
		</div>
	</a> 
	<a href="#">
		<div class="sidemenu">
			<img src="/imgs/question-icon.png">
			<div>1:1문의</div>
		</div>
	</a> 
	<a href="/eventList">
		<div class="sidemenu">
			<img src="/imgs/event-icon.png">
			<div>이벤트</div>
		</div>
	</a> 
	<a href="javascript:void(0)" onclick="up();">
		<div class="sidemenu top">
			<img src="/imgs/top-icon.png">
			<div>TOP</div>
		</div>
	</a>
</div>
<div class="header">
	<div class="header1">
		<a href="/"><span class="homeIcon"><img
				src="/imgs/home-icon.jpg"></span></a>
	</div>
	<div class="headermiddle">
		<form action="/salononeServlet" method="get">
			<input type="text" placeholder="가고싶은 지점에 대해 알아보세요~!" name="search1"><input
				type="submit" id="search"><label for="search"><img
				src="/imgs/dotwhite.png"></label>
				<input type="hidden"name="type" value="salonName2">
		</form>
	</div>
	<div class="header2">
		<ul>
			<c:if test="${empty sessionScope.member }">
				<!--로그인되어있지않을때 -->
				<li><a href="/agree">회원가입</a></li>
				<li><a href="/loginFrm">로그인</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.member }">
				<!--로그인되어있을때 -->
				<li><a href="/logOut">로그아웃</a></li>
				<c:if test="${sessionScope.member.memberId eq 'admin' }">
				<li><a href="/adminMenu">${sessionScope.member.memberName }</a></li>
				</c:if>
				<c:if test="${sessionScope.member.memberId ne 'admin' }">
				<li><a href="/mypage">${sessionScope.member.memberName }님</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
	<div class="header3">
		<ul class="hNavi">
			<span class="meorijom" onclick="location.href = '/';" style="margin-right:200px;">MEORIJOM HAIR</span>
			<li><a href="/company">회사소개</a></li>
			<li><a href="/branchList?reqPage=1">지점소개</a></li>
			<li><a href="/noticeList?reqPage=1">공지사항</a></li>
			<li><a href="javascript:void(0)" onclick="alert('준비중입니다.');">아카데미</a></li>
		</ul>
	</div>
</div>