<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		 <img src="../../../imgs/backImg1.jpg" id="img1">
        
        <div class="content">
            <div id="wrapper">
                <div>
                    <img src="../../../imgs/profile.png" id="profile">
                </div>
                <div>
                    <p id="j-font1">회원가입이 완료되었습니다.</p>
                </div>
                <div>
                    <p id="j-font2">MEORIZOMHAIR의 회원이 되신 것을 환영합니다.</p>
                </div>
            </div>
            <div id="bottomBtn">
            <a href="/"><input type="button" id="main"value="메인으로"></a>
            <a href="/loginFrm"><input type="button" id="login"value="로그인"></a>
            </div>
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
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
	.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 130px auto 0 auto;
            height: 700px;
            /*background-color: antiquewhite*/
        }
        #img1{
           
            width: 100%;
            height: 300px;
        }
       
        #profile{
            margin: 0 auto;/*안돼*/
            margin-left: 410px;
            width:330px;
            height: 230px;
            
        }
        #j-font1{
            margin-left: 430px;
            font-size: 30px;
            
        }
        #j-font2{
            margin-left: 400px;
            font-size: 20px;
            width: 
            height: 100px;
           
        }
        #wrapper{
            width: 100%;
            height: 430px;
            border-bottom: 1px solid black;
            margin: 0 auto;
        }
         #bottomBtn>a>input{
            margin-top: 70px;
            width: 150px;
            border-radius: 5px;
            border: 1px;
           
        }
        #main{
            color: white;
            background-color: red;
            margin-top: 30px;
            margin-left: 420px;
            width: 150px;
            height: 40px;
        }
        #login{
            background-color: black;
            color: white;
            margin-left: 20px;
            width: 150px;
            height: 40px; 
        }
</style>
</html>