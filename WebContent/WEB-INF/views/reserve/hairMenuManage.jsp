<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<style>
/* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 24px;
	margin-bottom: 10px;
	padding: 0;
}

.homeIcon>img {
	margin-top: 5px;
}

.headermiddle {
	padding-top: 5px;
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
	background-color: #998778;
	font-family: 'Anton', sans-serif;
}

.content1 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}
.addMenu{
	margin-top:30px;
}
.addMenu>button{
	margin-left:90%;
	width:80px;
	height:30px;
	background-color:gray;
	color: white;
    font-size: 15px;
    background-color: #998778;
    border:none;
    box-shadow: lightgray 0px 0px 2px 2px;
    border-radius: 5px;
}
.addMenu>button:hover{
	cursor:pointer;
}
.menu-wrapper{
	margin-top: 20px;
	width:100%;
    overflow: hidden;
}
.menu{
	margin:2.5%;
    float: left;
    width: 20%;
    height: 180px;
    border: 10px solid #998778;
    box-sizing: border-box;
}
.name{
	display:block;
	margin-left:10%;
	font-size : 20px;
	line-height:40px;
	text-decoration: underline red;
	height:40px;
}
.menu>table{
	width:80%;
	margin: 0 auto;
}
.menu td>input{
	text-align:right;
	width:80px;
	font-size : 15px;
}
.menu td:last-child{
	text-align:right;
}
.menu>button{
	width:40%;
	height:30px;
	margin:5%;
	background-color:gray;
	color: black;
    font-size: 15px;
    background-color: #f5f5f5;
    border:none;
    box-shadow: lightgray 0px 0px 2px 2px;
    border-radius: 5px;
}
.menu>button:hover{
	cursor:pointer;
    color: white;
    background-color: #998778;
}
input[type=submit]{
	width:80px;
	height:30px;
	margin:5%;
	background-color:gray;
	color: black;
    font-size: 15px;
    background-color: #f5f5f5;
    border:none;
    box-shadow: lightgray 0px 0px 2px 2px;
    border-radius: 5px;
}
input[type=submit]:hover{
	cursor:pointer;
    color: white;
    background-color: #998778;
}
</style>
<script>
	$(function(){
		$(".cancel").click(function(){
			$(this).parent().find(".hairPay").val(hairPay);
			$(this).parent().find(".hairPay").attr("readonly",true);
			$(this).parent().find(".hairPay").css("outline","none");
			$(this).hide();
			$(this).prevAll(".modBtn").show();
			$(this).prevAll(".delBtn").show();
			$(this).prevAll(".comMod").hide();
			$(this).prevAll(".cancel").hide();
		});
		
		change();
	})
	
	function modifyHair(val){
		$(val).parent().find(".pay").css("display","none");
		$(val).parent().find(".hairPay").css("display","inline-block");
		$(val).parent().find(".hairPay").focus();
		$(val).parent().find(".modifyHair").css("display","none");
		$(val).parent().find(".deleteHair").css("display","none");
		$(val).parent().find(".complete").css("display","inline-block");
		$(val).parent().find(".cancel").css("display","inline-block");
	};
	
	function cancel(val){
		$(val).parent().find(".pay").show();
		$(val).parent().find(".hairPay").hide();
		$(val).parent().find(".modifyHair").show();
		$(val).parent().find(".deleteHair").show();
		$(val).parent().find(".complete").hide();
		$(val).parent().find(".cancel").hide();
	};
	
	function deleteHair(hairNo){
		if(confirm("삭제하시겠습니까?")){
			var param = {hairNo:hairNo};
			$.ajax({
				url : "/deleteHairMenu",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data){
					if(data==0){
						alert("삭제실패");
					}else{
						change();
					}
				},error:function(){
					alert("삭제오류")
				}
			});
		}
	};
	
	function complete(val){
		var hairNo = $(val).parent().find(".hairNo").val();
		var nHairPay = $(val).parent().find(".hairPay").val();
		var param = {hairNo:hairNo,nHairPay:nHairPay};
		$.ajax({
			url : "/modifyHairMenu",
			data : param,
			type : "post",
			dataType : "json",
			success : function(data){
				if(data==0){
					alert("수정실패");
				}else{
					change();
				}
			},error:function(){
				alert("수정오류")
			}
		});
	}
	
	function change(){
		var param = {"asd":"asd"};
		$.ajax({
			url : "/selectHairMenu",
			data : param,
			type : "post",
			dataType : "json",
			success : function(data){
				var html = "";
				for(var i=0; i<data.length; i++){
					html += "<div class='menu'>";
					html += "<input class='hairNo' value='"+data[i].hairNo+"' hidden>";
					html += "<span class='name'>"+data[i].hairName+"</span>";
					html += "<table><td>가격</td><td><input type='text' class='hairPay' style='display:none;'><span class='pay' style='display:inline-block'>"+data[i].hairPay+"</span>원</td></tr>";
					html += "<tr><td>시술시간</td><td>"+(data[i].hairTime*30)+"분</td></tr></table>";
					html += "<button class='modifyHair' onclick='modifyHair(this);' style='display:inline-block'>수정</button><button class='deleteHair' onclick='deleteHair("+data[i].hairNo+");' style='display:inline-block'>삭제</button>";
					html += "<button class='complete' onclick='complete(this);' style='display:none'>수정하기</button><button class='cancel' onclick='cancel(this);' style='display:none'>취소하기</button></div>";
				}
				$(".menu-wrapper").html(html);
			},error:function(){
				alert("에러");
			}
		});
	};
	
	function addMenu(){
		var html = "";
		html += "<div class='menu'>";
		html += "<form action='/insertHairMenu' method='post'>";
		html += "시술명<input type='text' name='hairName' style='width:100px;' placeholder='최대6글자'>";
		html += "<table><td>가격</td><td><input type='number' name='hairPay' min=0>원</td></tr>";
		html += "<tr><td>시술시간</td><td><input type='number' name='hairTime' min=0 step=30 placeholder='30분 단위'>분</td></tr></table>";
		html += "<input type='submit' value='추가하기'></form>";
		$(".menu-wrapper").append(html);
		$("input[name=hairName]").focus();
	};
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle">#HairMenu List<span style="font-size:20px;">시술 목록 관리</span></div>
		<div class="content1">
		<div class="addMenu"><button onclick="addMenu();">추가하기</button></div>
		<div class="menu-wrapper">
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
</html>