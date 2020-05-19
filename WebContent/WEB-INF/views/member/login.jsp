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
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<img src="../../../imgs/backImg1.jpg" id="img1">
		<div class="content">
                <h1>로그인</h1>
                <div id="loginContent">
                    <form action="/login" method="post" id="form">
                     <table >
                         <tr>
                             <td class="loginfont">아이디</td>
                             <td><input type="text" id="id" name="memberId" ></td>
                             <!--  <td rowspan="2"><button type="submit" id="btn" >로그인</button></td>-->
                         </tr>
                         <tr>
                             <td class="loginfont">비밀번호</td>
                             <td><input type="password" id="pw" name="memberPw"></td>
                         </tr>
                         
                    </table>
                       <button type="submit" id="btn" >로그인</button>
                       <button type="button" id="idsearchbtn" ><a href="/idSearchFrm" >아이디찾기</a></button>
                    </form>
                </div>
        </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
		
</body>
	<script>
		
	</script>
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
	.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 130px auto 0 auto;
            height: 800px;
            /*height: 1200px;*/
            /*background-color: antiquewhite;*/
        }
        .content>h1{
            text-align: center;
        }
        #img1{
           
            width: 100%;
            height: 500px;
        }
        #loginContent{
            
            width: 1200px;
            height: 500px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
        
        
        #id{
           border-radius: 3px; 
            width: 280px;
           padding: 10px;
        }
        #pw{
             border-radius: 3px; 
            width: 280px;
           padding: 10px;
        }
        #btn{
        	margin-left:80px;
            width: 310px;
            height: 50px;
            border-radius: 6px;
            border:1px;
            background-color: red;
            color: white;
            font-size: 20px;
            padding: 10px;
            
        }
        
        #idsearchbtn{
        	margin-left:80px;
            width: 310px;
            height: 50px;
            border-radius: 6px;
            border:1px;
            background-color: #2E2E2E;
            color: white;
            font-size: 20px;
            padding: 10px;
        
        }
        .loginfont{
            font-size: 20px;
        }
        #form{
            margin-top: 80px;
            margin-left: 360px;
            width: 50%;
            height: 200px;
            border-bottom: 1px solid black;
            
        }
</style>
</html>