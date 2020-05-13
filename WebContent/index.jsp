<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<title>머리좀 헤어</title>
</head>
<style>
.content {
	
}
</style>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!-- 		캐러셀 -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link
			href="https://fonts.googleapis.com/css?family=Anton&display=swap"
			rel="stylesheet">
		<div class="content2">
			<div class="container">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="#"><img src="/imgs/v3.png" alt="New york"
								style="height: 100%; width: 100%;"> </a>
						</div>

						<div class="item">
							<a href="#"><img src="/imgs/v2.png" alt="Chicago"
								style="height: 100%; width: 100%;"> </a>
						</div>

						<div class="item">
							<a href="#"><img src="/imgs/v4.png" alt="New york"
								style="height: 100%; width: 100%;"> </a>
						</div>
						<div class="item">
							<a href="#"><img src="/imgs/v5.png" alt="New york"
								style="height: 100%; width: 100%;"> </a>
						</div>
						<div class="item">
							<a href="#"><img src="/imgs/v6.png" alt="New york"
								style="height: 100%; width: 100%;"> </a>
						</div>
					</div>

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="ad"></div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		
	</div>
	
</body>
<script>
//부트스트립에만
$("a").click(function() {
    $(this).css("text-decoration", "none").css("color", "");
});
</script>
<style>
/* 캐러셀 */
.content2 {
	width: 100%;
	margin: 120px auto;
	text-align: center;
}

.container {
	width: 100%;
	height: 800px;
	padding: 0;
}

.carousel-inner>div {
	text-align: center;
}

.content>div>h1 {
	color: white;
	font-size: 65px;
	font-weight: bold;
	padding: 0;
	margin: 0;
}

.content>div>h3 {
	color: gray;
}

.carousel-control.left {
	background-image: none;
}

.carousel-control.right {
	background-image: none;
}

/* 부트스트랩 */
a {
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

.homeIcon>img {
	vertical-align: -2px;
}

.headermiddle * {
	height: 24px;
}
</style>
</html>