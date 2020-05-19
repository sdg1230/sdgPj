<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        
        /* 첫번째 선택 */
        .subMenuContent>.inner>ul>li:nth-child(3){
            background-color: #ed1c24;
        }
        
        .subMenuContent>.inner>ul>li:nth-child(3)>a{
            color: ghostwhite;
        }
        .questionText{
        	margin-left: 350px;
        	margin-bottom: 20px;
        }
        .questionTable{
        	width:100%;
        	text-align: center;
        	border-bottom: 3px solid grey;
        	margin-bottom: 100px;
        }
        
        .questionTable>tbody>tr>th{
        	background-color: grey;
        	opacity: 0.6;
        	color: ghostwhite;
        	height: 50px;
        }
        
        .questionTable>tbody>tr>th:first-child{
        	width: 250px;
        }
        
        
        
        .questionTable>tbody>tr>td{
        	height: 50px;
        	color: black;
        }
        .questionPageNavi{
        	width:100%;
        	text-align: center;
        	height: 50px;
        	margin: 0 auto;
        	margin-top: 30px;
        	margin-bottom: 30px;
        }
        .questionPageNavi>*{
		margin: 20px;
		}
		
		.questionPageNavi>.questionBtn{
			width: 30px;
			height: 30px;
			border: 0.5px solid grey;
			display: inline-block;
			line-height: 30px;
		}
		
		.questionPageNavi>.questionPrevBtn{
			width: 50px;
			height: 30px;
			border: 0.5px solid red;
			display: inline-block;
			line-height: 30px;
			background-color: red;
			color: ghostwhite;
			font-weight: bold;
		}
		
		.questionPageNavi>.questionNextBtn{
			width: 50px;
			height: 30px;
			border: 0.5px solid red;
			display: inline-block;
			line-height: 30px;
			background-color: red;
			color: ghostwhite;
			font-weight: bold;
		}
		
		.questionPageNavi>.selectQuestionPage{
			width: 30px;
			height: 30px;
			border: 1px solid #494949;
			display: inline-block;
			line-height: 30px;
			background-color: #494949;
			color : ghostwhite;
			font-weight: bold;
		}
		
		.questionSearch{
			width: 100%;
			height: 130px;
			background-color: grey;
			text-align: center;
			padding-top: 40px;
		}
		
		.questionSearchInput{
			width: 300px;
		}
		
		.questionWriteBtn{
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
		
		.selectBox{
			border-radius: 5px;
			width: 60px;
			height : 26px;
			display: inline-block;
			border : 2px solid black;
			-webkit-appearance: none;  /* 네이티브 외형 감추기 */
    		-moz-appearance: none;
    		appearance: none;
    		text-align: center;
		}
		
		
</style>
<script>
function questionFunc(memberId){
	if(memberId==""){
		alert("로그인이 필요합니다");
		location.href="/loginFrm";
	}else{
		if(memberId=="admin"){
			location.href="/questionAnswer";
		}else{
			location.href="/questionList";
		}
	}
}
</script>
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
                    <h1 align="center">1:1 문의</h1>
                    <ul>
                        <li><a href="/noticeList?reqPage=1">공지사항</a></li>
                        <li><a href="/eventList">이벤트</a></li>
                        <li><a href="javascript:void(0);" onclick="questionFunc('${sessionScope.member.memberId}');">1:1문의</a></li>
                    </ul>
                </div>
            </div>
            <br><br>
            <h2 align="center">문의 목록</h2>
            <table class="questionTable">
                <tr>
                    <th>작성자</th>
                    <th>내용</th>
                </tr>
                
                <c:forEach items="${list }" var="q">
				<c:if test="${q.questionWriter ne 'admin' }">
				<tr>
					<td style="border-bottom: 0.1px solid #DDE3E9;">
					${q.questionWriter }</td>
					<td style="border-bottom: 0.1px solid #DDE3E9;"><a href="/questionList?questionWriter=${q.questionWriter }" style="font-weight: bold">${q.questionContent }</a></td>
				</tr>
				</c:if>
				</c:forEach>
            </table>
        </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>