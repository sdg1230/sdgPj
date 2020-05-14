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
            <h1>회원가입</h1>
            
            <form id="checkIdFrm"><!--중복체크-->
                <input type="hidden" name="checkId">
            </form>
            
            
            <form action="" method="post" id="form">
                <table class="table">
                    <tr class="tr">
                        <td class="title" >아이디</td><td ><input type="text" id="id" name="memberId" class="t-con"></td>
                        <td ><button type="submit"id="checkBtn" onclick="checkId();">중복체크</button></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">이름</td><td><input type="text" id="name" name="memberName" class="t-con"></td><td><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr"> 
                        <td class="title">비밀번호</td><td><input type="password" id="pw" name="memberPw" class="t-con"></td><td><span></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">비밀번호확인</td><td><input type="password" id="rePW" name="rePw" class="t-con"></td><td><span></span></td>
                        
                    </tr>
                     <tr class="tr">
                        <td class="title">휴대폰번호</td><td><input type="text" id="phone" name="phone" class="t-con"></td><td><span></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">주소</td><td><input type="text" id="addr" name="addr" class="t-con">
                        <input type="button" value="주소검색" id="addrSearch">
                        
                        </td><td><span></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">이메일</td><td><input type="text" id="email" name="email" class="t-con"></td><td><span></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">성별</td><td colspan="2"><input type="checkbox" id="m" name="gender" class="t-con2" value="남">남
                        <input type="checkbox" id="f" name="gender"class="t-con2">여</td>
                        <td><span></span></td>
                    </tr>
                    
                    
                    
                     <tr class="tr">
                        <td class="title">나이</td>
                         <td><input type="text" id="age" name="age" class="t-con"></td>
                         <td><span></span></td>
                        
                    </tr>
                </table>
                 <div id="bottomBtn">
                 <input type="button" id="joinBtn" value="회원가입" onclick="join">
                 <input type="reset" id="cancel" value="취소">
                 </div>
            </form>
            
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
	<style>
		.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 130px auto 0 auto;
            height: 1200px;
           /* background-color: antiquewhite*/
        }
        #img1{
           
            width: 100%;
            height: 300px;
        }
        .content>h1{
            width:80%;
            height: 160px;
           
            margin: 0px;
            text-align: center;
            font-size: 37px;
             margin: 0 auto;
            border-bottom: 1px solid black;
        }
        .table{
            width: 80%;
            height: 900px;
            /*background-color:aqua;*/
            margin: 0 auto;
            border-collapse: collapse;
            border-spacing: 0;
        }
        #form{
           
            
        }
        #id{
           
            
        }
        .title{
            text-align:left;
            width: 150px;
            height: 40px;
            font-size: 18px;
        }
        .title>td{
            width: 370px;
            
        }
        .t-con{
            border-radius: 3px;
            
            width: 380px;
            height: 40px;
        }
        .tr>td{
            height: 50px;
            
            border-bottom: 1px solid black;
        }
        #checkBtn{
            
            width: 200px;
            height: 40px;
            background-color: gray;
            color: white;
            border-radius: 3px;
            border: 1px;
        }
        .t-con2{
            width: 100px;
            height: 20px;
            
            
        }
        #addrSearch{
            margin-left: 30px;
            width: 110px;
            height: 40px;
            background-color: dodgerblue;
            color: white;
            border-radius: 3px;
            border: 1px;
        }
        #bottomBtn{
            width:98%;
            margin: 0 auto;
            margin-left: 20px;
           
            margin-top: 20px;
        }
        #bottomBtn>input{
            
            width: 150px;
            border-radius: 5px;
            border: 1px;
           
        }
        #joinBtn{
            color: white;
            background-color: red;
            margin-top: 30px;
            margin-left: 400px;
            width: 150px;
            height: 40px;
        }
        #cancel{
            background-color: black;
            color: white;
            margin-left: 20px;
            width: 150px;
            height: 40px; 
        }
	</style>
</html>