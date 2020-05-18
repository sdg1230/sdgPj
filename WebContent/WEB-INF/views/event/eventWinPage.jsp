<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
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
        
        /* 첫번째 선택 */
        .subMenuContent>.inner>ul>li:nth-child(2){
            background-color: #ed1c24;
        }
        
        .subMenuContent>.inner>ul>li:nth-child(2)>a{
            color: ghostwhite;
        }
        .noticeText{
        	margin-left: 350px;
        	margin-bottom: 20px;
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
        
        .eventColumn:nth-child(3)>a{
        	color : #000;
        	border : 2px solid #000;
        }
        
        .eventListPart{
        	float: left;
        	width: 400px;
        	height: 500px;
        	
        	margin-top: 10px;
        	margin-bottom: 40px;
        }        
        
        .eventImage{
        	width: 90%;
        	height: 350px;
        	margin-left: 20px;
        }
        
        .eventTitle{
        	font-weight: bold;
        	font-size: 20px;
        	text-align: center;
        	
        }
        
        .eventDate{
        	font-size: 20px;
        	width: 100%;
        	white-space: nowrap;
        	overflow: hidden;
        	text-overflow: ellipsis;
        	text-align: right;
        }
        
        
        .eventWriteBtn{
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
			
        }
        
        .eventListPart2{ 
        	position: absolute; 
        	top: 0;
        	float: left;
        	width: 400px;
        	height: 430px;
        	background-color: rgba(0,0,0,0.8);
        	opacity: 0;
        	
        }
        
        .eventListPart2:hover{
        	opacity: 1;
        	transition : 0.7s;
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
            <br><br>
            <h2 align="center">EVENT</h2>
            <div class="noticeText">
            	MEORIJOM HAIR에서 진행하는 이벤트을 한눈에 살펴보세요.<br>
            	진행중인 이벤트를 확인하고 다양한 혜택을 누리세요.
            </div>
            <br>
            <hr style="border:1px solid lightgray;">
            <div class="eventMenuBar">
            	<ul>
            		<li class="eventColumn">
            			<a href="/eventList">진행중인 이벤트</a>
            		</li>
            		<li class="eventColumn">
            			<a href="/eventEndPage">종료된 이벤트</a>
            		</li>
            		<li class="eventColumn">
            			<a href="/eventWinPage">당첨자 발표</a>
            		</li>
            	</ul>
            </div>
            <br><br>
            <br><hr>
            <div style="width: 100%; height: 500px; text-align: center;">
            	<span style="margin: 0 auto; font-size: 20px; margin-top: 100px; display: block;">당첨자 발표가 없습니다.</span>
            </div>
         </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>