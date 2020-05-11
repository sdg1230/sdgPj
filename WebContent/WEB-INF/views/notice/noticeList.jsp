<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            width: 100%;
            height: 400px;
            background-color: #2a2829;
        }

        .subMenuColor>span {
            color: white;
            font-size: 40px;
            padding: 30px;
            padding-left: 80px;
            padding-top: 220px;
            display: block;
        }

        .subMenuColor>p {
            color: white;
            font-size: 20px;
            padding-left: 80px;
            display: block;
        }

        .subMenuContent>.inner {
            width: 1200px;
            margin: 0 auto;
            
        }

        .subMenuContent>.inner>ul>li {
            float: left;

        }
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="subMenuColor">
            <span>Community</span>
            <p>MEORIJOM HAIR의 새로운 소식을 알려드립니다.</p>
        </div>
		<div class="content2">
            <div class="subMenuContent">
                <div class="inner">
                    <h1 align="center">공지사항</h1>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">1:1문의</a></li>
                    </ul>
                </div>
            </div>
        </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>