<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

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
	padding-top:4px;
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
            font-size:50px;    
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
        
        .subMenuContent>.inner>ul>li>a{
            color: #bebebf;
            line-height: 50px;
            display: block;
            font-size: 18px;
        } 
        
        .subMenuContent>.inner>ul>li>a:hover{
            color: ghostwhite;
            
        }
        
        .subMenuContent>.inner>ul>li:hover{
            opacity: 0.9;
        }
        
        .spanbarSmall{
        	width: 50px;
        	height: 3px;
        	border: 3px solid red;
        	display: inline-block;
        }
        /* 두번째 선택 */
        .subMenuContent>.inner>ul>li:nth-child(2){
            background-color: #ed1c24;
        }
        
        .subMenuContent>.inner>ul>li:nth-child(2)>a{
            color: ghostwhite;
        }
        
        
        /* 이벤트 페이지 */
        .eventMenuBar{
        	width: 100%;
        	text-align: center;
        	height: 60px;
        }
        
        .eventColumn{
        	width: 400px;
        	height: 64px;
        	line-height: 60px;
        	box-sizing: box;
        	float: left;
        	display: block;
        }
        
        .eventColumn>a{
        	color: #9e9e9e;
        	display: block;
        	border : 2px solid #dcdcdc;
        }
        
        .eventColumn:first-child>a{
        	color : #000;
        	border : 2px solid #000;
        }
        
        #eventTitle{
        	margin-left: 20px;
        	height: 22px;
        	width: 930px;
        }
        
        .eventBtn{
        	width: 150px;
        	height: 50px;
        	background-color: #CD3C41;
        	border: none;
        	border-radius: 5px;
        	color: white;
        	margin-left: 10px;
        	margin-right: 10px;
        }
        
        .eventBtn:hover{
        	opacity: 0.8;
        }
        
        .btnBoxN{
        	text-align: center;
        	margin-top: 30px;
        	margin-bottom: 30px;
        }
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
        <div class="subMenuColor  meorijom" style="font-size:50px;">
            Community
        </div>
		<div class="content2">
            <div class="subMenuContent">
                <div class="inner">
                	<span class="spanbarSmall"></span>
                    <h1 align="center">이벤트</h1>
                    <ul>
                        <li><a href="/noticeList?reqPage=1">공지사항</a></li>
                        <li><a href="/eventList">이벤트</a></li>
                        <li><a href="#">1:1문의</a></li>
                    </ul>
                </div>
            </div>
            <br><br><hr>
            <h2 style="margin-left: 70px;">이벤트 페이지 등록</h2>
	<form id="frm" action="/insertEvent" method="post" enctype="multipart/form-data">
		<table width="100%">
			<tr>
				<th style="width: 200px; height: 50px; border-top: 2px solid red; background-color: #DDE3E9;">*제목</th> 
				<td style="border-top: 2px solid red;"><input type="text" id="eventTitle" name="eventTitle" placeholder=" 제목을 입력하세요"></td> 
			</tr>
			<tr>
				<th style="width: 200px; height: 50px; background-color: #DDE3E9;">썸네일 등록</th> 
				<td><input type="file" id="eventFilename" name="eventFilename" style="margin-left: 20px;"></td> 
			</tr> 
			<tr> 
				<th style="background-color: #DDE3E9;">*내용</th> 
				<td> <textarea rows="10" cols="30" id="p_content" name="eventContent" style="resize: none; "></textarea> </td> 
			</tr> 
		</table>
		<div class="btnBoxN">
			<input type="submit" class="eventBtn" value="등록"> 
			<input type="button" class="eventBtn" value="취소" id="reset"> 
		</div>
	</form>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
<script type="text/javascript">
 		CKEDITOR.replace('p_content', {
 			height: 500,
 			enterMode:'2',
 			shiftEnterMode:'3'
        });
 		CKEDITOR.config.resize_enabled = false;
 		
</script>
<script>
$(function() {
	$("#eventTitle").focus();
	
	$("#reset").click(function () {
		history.back();
	});
	
	
});
</script>
</body>
</html>