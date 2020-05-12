<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
        .noticePageNavi{
        	width:100%;
        	text-align: center;
        	height: 50px;
        	margin: 0 auto;
        	margin-top: 30px;
        	margin-bottom: 30px;
        }
        .noticePageNavi>*{
		margin: 20px;
		}
		
		.noticePageNavi>.noticeBtn{
			width: 30px;
			height: 30px;
			border: 0.5px solid grey;
			display: inline-block;
			line-height: 30px;
		}
		
		.noticePageNavi>.noticePrevBtn{
			width: 50px;
			height: 30px;
			border: 0.5px solid red;
			display: inline-block;
			line-height: 30px;
			background-color: red;
			color: ghostwhite;
			font-weight: bold;
		}
		
		.noticePageNavi>.noticeNextBtn{
			width: 50px;
			height: 30px;
			border: 0.5px solid red;
			display: inline-block;
			line-height: 30px;
			background-color: red;
			color: ghostwhite;
			font-weight: bold;
		}
		
		.noticePageNavi>.selectNoticePage{
			width: 30px;
			height: 30px;
			border: 1px solid #494949;
			display: inline-block;
			line-height: 30px;
			background-color: #494949;
			color : ghostwhite;
			font-weight: bold;
		}
		
		.noticeSearch{
			width: 100%;
			height: 130px;
			background-color: grey;
			text-align: center;
			padding-top: 40px;
		}
		
		.noticeSearchInput{
			width: 300px;
		}
		
		.noticeWriteBtn{
			width: 70px;
			height: 30px;
			display: inline-block;
			line-height: 30px;
			background-color: grey;
			color: ghostwhite;
			float: right;
			text-align: center;
			
		}
		
		.selectBox{
			border-radius: 5px;
			width: 60px;
			height : 25px;
			display: inline-block;
			
			-webkit-appearance: none;  /* 네이티브 외형 감추기 */
    		-moz-appearance: none;
    		appearance: none;
		}
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
        <div class="subMenuColor">
            Community
        </div>
		<div class="content2">
            <div class="subMenuContent">
                <div class="inner">
                	<span class="spanbarSmall"></span>
                    <h1 align="center">공지사항</h1>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">1:1문의</a></li>
                    </ul>
                </div>
            </div>
            <br><br>
            <h2 align="center">공지사항 목록</h2>
            <div class="noticeText">
            	저희 MEORIJOM HAIR의 공지사항을 한눈에 살펴보세요.<br>
            	궁금한 점이 있으시거나 자세한 사항은 1:1문의를 통해 질문하시면 친절하게 답변해드립니다.
            </div>
            <table class="noticeTable">
                <tr>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
                <c:forEach items="${list }" var="n">
				<tr>
					<td><a href="/noticeView?noticeNo=${n.noticeNo}">
					${n.noticeWriter }</a></td>
					<td>${n.noticeTitle }</td>
					<td>${n.noticeDate }</td>
				</tr>			
			</c:forEach>
            </table>
            <a href="/noticeWrite" class="noticeWriteBtn">글쓰기</a>
            <div class="noticePageNavi">${pageNavi }</div>
            <div class="noticeSearch">
            	<form action="/noticeSearchTitle">
            		<select name="searchType" class="selectBox">
            			<option value="noticeTitle" selected>제목</option>
            		</select>
            		<input type="text" class="noticeSearchInput" name="searchTitle">
            		<button type="submit">검색</button>
            	</form>
            </div>
        </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>