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
        .subMenuContent>.inner>ul>li:first-child{
            background-color: #ed1c24;
        }
        
        .subMenuContent>.inner>ul>li:first-child>a{
            color: ghostwhite;
        }
        .noticeText{
        	margin-left: 350px;
        	margin-bottom: 20px;
        }
        .noticeTable{
        	width:100%;
        	text-align: center;
        	border-bottom: 3px solid grey;
        }
        
        .noticeTable>tbody>tr>th{
        	background-color: grey;
        	opacity: 0.6;
        	color: ghostwhite;
        	height: 50px;
        }
        
        .noticeTable>tbody>tr>th:first-child{
        	width: 250px;
        }
        
        .noticeTable>tbody>tr>th:last-child{
        	width: 250px;
        }
        
        .noticeTable>tbody>tr>td{
        	height: 50px;
        	color: black;
        }
        




        .noticeDetailSpan1{
        	color : #BDCCD9;
        	font-weight: bold;
        	font-style: italic;
        	margin-right: 10px;
        	margin-left: 30px;
        	font-size: 14px;
        }
        
        .noticeDetailSpan2{
        	color : #5E6062;
        	font-size: 14px;
        }
        
        .marker{
        	background-color: yellow; 
        }
        
        .adminNoticeBtn{
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
        
        .noticeBtn{
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
        
        .noticeBtn:hover{
        	cursor: pointer;
        	background-color: rgba(102,102,102,0.3);
        	color: white;
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
                    <h1 align="center">공지사항</h1>
                    <ul>
                        <li><a href="/noticeList?reqPage=1">공지사항</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">1:1문의</a></li>
                    </ul>
                </div>
            </div>
            
            <div align="right" style="margin-top: 120px;">
            	<a href="/modifyNoticeFrm?noticeNo=${n.noticeNo}" class="adminNoticeBtn">수정하기</a>
            	<!-- <a href="/deleteNotice?noticeNo=${n.noticeNo}" class="adminNoticeBtn" onclick="deleteNotice()">삭제하기</a> -->
            	<a href="javascript:void(0)" class="adminNoticeBtn" onclick="deleteNotice('${n.noticeNo}')">삭제하기</a>
            </div>
            
            <div class="noticeDetailContent" >
            	<br><br><hr style="border: 2px solid black;">
            	<h1 align="center">${n.noticeTitle}</h1>
            	<div style="text-align: right">
            		<span class="noticeDetailSpan2"><span class="noticeDetailSpan1">by</span>${n.noticeWriter}</span>
            		<span class="noticeDetailSpan2"><span class="noticeDetailSpan1">posted</span>${n.noticeDate}</span>
            	</div>
            	<br><hr style="border: 2px solid black;">
            	
            	<div>
            		${n.noticeContent }
            	</div>
            	<hr>
            	<br><br>
            	<button type="button" class="noticeBtn">목록보기</button>
            	<br><br><br>
            </div>
            
         </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
$(function() {
	$(".noticeBtn").click(function () {
		history.back();
	});
	
	
});
function deleteNotice() {
	if(confirm("탈퇴하시겠습니까?")){
		location.href="/deleteNotice?noticeNo=${n.noticeNo}"
	}else{
		location.href="/noticeDetail?noticeNo=${n.noticeNo}"
	}
};
</script>
</html>