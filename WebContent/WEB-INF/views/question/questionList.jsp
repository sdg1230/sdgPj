<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
.content2 {
	/*-지우지마세요-*/
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

.subMenuColor {
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
	background-color: #2a2829;
}

.subMenuContent>.inner {
	width: 1200px;
	margin: 0 auto;
	margin-top: -10px;
}

.subMenuContent>.inner>ul>li {
	float: left;
	width: 398px;
	height: 50px;
	text-align: center;
	background-color: #494949;
	border-left: 0.5px solid ghostwhite;
	border-right: 0.5px solid ghostwhite;
}

.subMenuContent>.inner>ul>li>a {
	color: #bebebf;
	line-height: 50px;
	display: block;
	font-size: 18px;
}

.subMenuContent>.inner>ul>li>a:hover {
	color: ghostwhite;
}

.subMenuContent>.inner>ul>li:hover {
	opacity: 0.9;
}

.spanbarSmall {
	width: 50px;
	height: 3px;
	border: 3px solid red;
	display: inline-block;
}

/* 첫번째 선택 */
.subMenuContent>.inner>ul>li:nth-child(3) {
	background-color: #ed1c24;
}

.subMenuContent>.inner>ul>li:nth-child(3)>a {
	color: ghostwhite;
}

.questionText {
	margin-left: 350px;
	margin-bottom: 20px;
}

.questionTable {
	width: 100%;
	text-align: center;
	border-bottom: 3px solid grey;
}

.questionTable>tbody>tr>th {
	background-color: grey;
	opacity: 0.6;
	color: ghostwhite;
	height: 50px;
}

.questionTable>tbody>tr>th:first-child {
	width: 250px;
}

.questionTable>tbody>tr>td {
	height: 50px;
	color: black;
}

.questionPageNavi {
	width: 100%;
	text-align: center;
	height: 50px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}

.questionPageNavi>* {
	margin: 20px;
}

.questionPageNavi>.questionBtn {
	width: 30px;
	height: 30px;
	border: 0.5px solid grey;
	display: inline-block;
	line-height: 30px;
}

.questionPageNavi>.questionPrevBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.questionPageNavi>.questionNextBtn {
	width: 50px;
	height: 30px;
	border: 0.5px solid red;
	display: inline-block;
	line-height: 30px;
	background-color: red;
	color: ghostwhite;
	font-weight: bold;
}

.questionPageNavi>.selectQuestionPage {
	width: 30px;
	height: 30px;
	border: 1px solid #494949;
	display: inline-block;
	line-height: 30px;
	background-color: #494949;
	color: ghostwhite;
	font-weight: bold;
}

.questionSearch {
	width: 100%;
	height: 130px;
	background-color: grey;
	text-align: center;
	padding-top: 40px;
}

.questionSearchInput {
	width: 300px;
}

.questionWriteBtn {
	display: inline-block;
	width: 90px;
	height: 28px;
	background-color: #ffffff;
	text-align: center;
	line-height: 30px;
	color: #666666;
	border: 1px solid #D4D4Cd;
	padding-left: 2px;
	padding-right: 2px;
	margin-left: 2px;
	margin-right: 2px;
	float: right;
	margin-top: 10px;
}

.selectBox {
	border-radius: 5px;
	width: 60px;
	height: 26px;
	display: inline-block;
	border: 2px solid black;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	text-align: center;
}

.chatting {
	width: 100%;
	height : 800px;
	overflow: scroll;
	background-color: #E8EDF0;
	padding-top: 20px;
	
}

.line {
	width: 100%;
	
}

.sendQuestion{
	width: 600px; 
	height: 80px; 
	background-color: ghostwhite; 
	text-align: center; 
	float: left;
	border-radius: 25px;
    position: relative;
    margin-left: 70px;
    color: black;
    margin-bottom: 10px;
    line-height: 80px;
}
.sendQuestion:after{
	 
     border-top: 10px solid ghostwhite;
     border-left: 10px solid transparent; 
     border-right: 10px solid transparent; 
     border-bottom: 0 solid transparent; 
     content: "";
     position: absolute;
     bottom:-10px;
     left:100px;
}

.receiveQuestion{
	width: 600px; 
	background-color: #fef01b; 
	text-align: center; 
	float: right;
	border-radius: 25px;
    margin-bottom: 10px;
    position: relative;
    margin-right: 70px;
    color: black;
    
}

.receiveQuestion:before{
	border-top: 0 solid transparent;
    border-left: 10px solid transparent; 
    border-right: 10px solid transparent; 
    border-bottom:10px solid #fef01b; 
    content: "";
    position: absolute;
    top:-10px;
    left:500px;
    
}

.sendArea{
	width: 100%;
	height: 42px;
	margin-bottom: 100px;
	background-color: ghostwhite;
}

.sendArea>*{
	float: left;
}

.filebox label {
	display: inline-block; 
	padding: .5em .75em; 
	color: #999; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
}

.filebox input[type="file"] {
 /* 파일 필드 숨기기 */ 
 	position: absolute; 
 	width: 1px; 
 	height: 1px; 
 	padding: 0; 
 	margin: -1px; 
 	overflow: hidden; 
 	clip:rect(0,0,0,0); 
 	border: 0; 
 }
 
.filebox .upload-name {
	display: inline-block; 
	padding: .5em .75em;
	/* label의 패딩값과 일치 */ 
	font-size: inherit; 
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	-webkit-appearance: none; 
	/* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
	function questionFunc(memberId) {
		if (memberId == "") {
			alert("로그인이 필요합니다");
			location.href = "/loginFrm";
		} else {
			if (memberId == "admin") {
				location.href = "/questionAnswer";
			} else {
				location.href = "/questionList";
			}
		}
	}
	
	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden'); 
		fileTarget.on('change', function(){ // 값이 변경되면 
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name;
			} else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
				}
		// 추출한 파일명 삽입 
		$(this).siblings('.upload-name').val(filename);
		});
	});
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="subMenuColor  meorijom" style="font-size: 50px;">
			Community</div>
		<div class="content2">
			<div class="subMenuContent">
				<div class="inner">
					<span class="spanbarSmall"></span>
					<h1 align="center">1:1 문의</h1>
					<ul>
						<li><a href="/noticeList?reqPage=1">공지사항</a></li>
						<li><a href="/eventList">이벤트</a></li>
						<li><a href="javascript:void(0);"
							onclick="questionFunc('${sessionScope.member.memberId}');">1:1문의</a></li>
					</ul>
				</div>
			</div>
			<br>
			<br>
			<h2 align="center">문의 목록</h2>
			<div class="chatting">
				<c:forEach items="${list }" var="q">
					
					<c:if test="${q.questionRef == 1}">
						<div class="line">
							<div class="sendQuestion">${q.questionContent }</div>
						</div>
					</c:if>
					
					<c:if test="${q.questionRef == 0}">
						<div class="line">
							<div class="receiveQuestion">
								<c:if test="${not empty q.questionFilename }">
								<div style="height: 300px; width: 500px; margin: 0 auto; margin-top: 20px;">
									<img src="/ckstorage/question/${q.questionFilename }" width="100%" height="100%"> 
								</div>
								</c:if>
								<div style="height: 80px; line-height: 80px;">
									${q.questionContent }
								</div>
							</div>
						</div>
					</c:if>
					
				</c:forEach>
			</div>
			<c:if test="${sessionScope.member.memberId ne 'admin' }">
			<form action="/insertQuestion" method="post" enctype="multipart/form-data">
			<div class="sendArea">
				<div class="filebox">
					<input class="upload-name" value="파일선택" disabled="disabled">
					<c:forEach items="${list }" var="q">
						<input type="hidden" value="${sessionScope.member.memberId}" name="questionWriter">
						<input type="hidden" value="0" name="questionRef">
					</c:forEach>
					
					
					<label for="upload_file">사진등록</label> 
					<input type="file" id="upload_file" class="upload-hidden" name="questionFilename"> 
				</div>
				<input type="text" placeholder="     상담하실 내용을 입력해주세요." style="width: 800px; height: 35px; margin-left: 5px;" name="questionContent" required>
				<button type="submit" style="width: 60px; height: 40px; border: none; background-color: #fef01b; color: black; font-weight: bold; font-size: 15px;">전송</button>
			</div>
			</form>
			</c:if>
			
			<c:if test="${sessionScope.member.memberId eq 'admin' }">
			<form action="/insertAnswer" method="post" enctype="multipart/form-data">
			<div class="sendArea">
				<div class="filebox">
					<input class="upload-name" value="파일선택" disabled="disabled">
					<c:forEach items="${list }" var="q">
						<input type="hidden" value="${questionWriter}" name="questionWriter1">
						<input type="hidden" value="1" name="questionRef1">
					</c:forEach>
					
					
					<label for="upload_file">사진등록</label> 
					<input type="file" id="upload_file" class="upload-hidden" name="questionFilename1"> 
				</div>
				<input type="text" placeholder="     답변하실 내용을 입력해주세요." style="width: 800px; height: 35px; margin-left: 5px;" name="questionContent1">
				<button type="submit" style="width: 60px; height: 40px; border: none; background-color: #fef01b; color: black; font-weight: bold; font-size: 15px;" required>전송</button>
			</div>
			</form>
			</c:if>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>