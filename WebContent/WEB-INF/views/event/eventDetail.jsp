<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
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
        .eventText{
        	margin-left: 350px;
        	margin-bottom: 20px;
        }
        .eventTable{
        	width:100%;
        	text-align: center;
        	border-bottom: 3px solid grey;
        }
        
        .eventTable>tbody>tr>th{
        	background-color: grey;
        	opacity: 0.6;
        	color: ghostwhite;
        	height: 50px;
        }
        
        .eventTable>tbody>tr>th:first-child{
        	width: 250px;
        }
        
        .eventTable>tbody>tr>th:last-child{
        	width: 250px;
        }
        
        .eventTable>tbody>tr>td{
        	height: 50px;
        	color: black;
        }
        




        .eventDetailSpan1{
        	color : #BDCCD9;
        	font-weight: bold;
        	font-style: italic;
        	margin-right: 10px;
        	margin-left: 30px;
        	font-size: 14px;
        }
        
        .eventDetailSpan2{
        	color : #5E6062;
        	font-size: 14px;
        }
        
        .marker{
        	background-color: yellow; 
        }
        
        .adminEventBtn{
        	display: inline-block;
        	width: 90px;
        	height: 28px;
        	background-color: #ffffff;
        	text-align: center;
        	line-height: 30px;
        	color : #666666;
        	border: 1px solid #D4D4Cd;
        	padding-left: 2px;
        	padding-right: 2px;
        	margin-left: 2px;
        	margin-right: 2px;
        }
        
        .eventBtn{
        	border: 1px solid #D4D4Cd;
        	width: 90px;
        	line-height: 28px;
        	vertical-align: center;
        	color : #666666;
        	padding-left: 2px;
        	padding-right: 2px;
        	margin-left: 2px;
        	margin-right: 2px;
        	background-color: #ffffff;
        }
        
        .eventBtn:hover{
        	cursor: pointer;
        	background-color: rgba(102,102,102,0.3);
        	color: white;
        }
        
        .eventContentTable0>table{
        	width: 1200px;
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
                        <li><a href="javascript:void(0);" onclick="questionFunc('${sessionScope.member.memberId}');">1:1문의</a></li>
                    </ul>
                </div>
            </div>
            
            <div align="right" style="margin-top: 120px;">
            	<a href="/modifyEventFrm?eventNo=${e.eventNo}" class="adminEventBtn">수정하기</a>
            	<a href="javascript:void(0)" class="adminEventBtn" onclick="deleteEvent('${e.eventNo}')">종료하기</a>
            </div>
            
            <div class="eventDetailContent" >
            	<br><br><hr style="border: 2px solid black;">
            	<h1 align="center">${e.eventTitle}</h1>
            	<div style="text-align: right">
            		<span class="eventDetailSpan2"><span class="eventDetailSpan1">by</span>admin</span>
            		<span class="eventDetailSpan2"><span class="eventDetailSpan1">posted</span>${e.eventDate}</span>
            	</div>
            	<br><hr style="border: 2px solid black;">
            	
            	<div style="text-align: center; width: 100%" class="eventContentTable0">
            		${e.eventContent }
            	</div>
            	<hr>
            	<br><br>
            	<button type="button" class="eventBtn">목록보기</button>
            	<br><br><br>
            </div>
            
         </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
$(function() {
	$(".eventBtn").click(function () {
		history.back();
	});
	
	
});
function deleteEvent() {
	if(confirm("종료하시겠습니까?")){
		location.href="/deleteEvent?eventNo=${e.eventNo}"
	}else{
		location.href="/eventDetail?eventNo=${e.eventNo}"
	}
};
</script>
</html>