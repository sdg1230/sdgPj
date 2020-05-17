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
            <h1>MYPAGE</h1>
            <div id="top">
            
            <table>
                    <tr>
                        <td id="top-c1"><p id="nameF">${sessionScope.member.memberName }</p></td>
                        <td id="top-c2"><p>님</p><a id="updatebtn" href="/updateFrm">정보변경</a></td>
                        <td id="top-c3"><a href="/reserveFrm">예약하기</a></td>
                        <td id="top-c4"><a href="#">1:1문의</a></td>
                    </tr>
                </table>
            
            
            
            </div>
             <h3 >고객정보</h3>
            <div>
                <table class="table">
                   	<tr class="tr">
                        <td class="title">아이디</td><td><input type="text" id="id" name="memberId" class="t-con" value="${member.memberId}"></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">이름</td><td><input type="text" id="name" name="memberName" class="t-con" value="${member.memberName}"></td>
                        
                    </tr>
                    
                     <tr class="tr">
                        <td class="title">휴대폰번호</td><td><input type="text" id="phone" name="phone" class="t-con" value="${member.memberPhone }"></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">주소</td><td><input type="text" id="addr" name="addr" class="t-con" readonly value="${member.address }"></td>
                        
                        
                    </tr>
                   
                    <tr class="tr">
                        <td class="title">성별</td><td><input type="text" id="gender" name="gender" class="t-con" readonly value="${member.gender }"></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">나이</td><td><input type="text" id="age" name="age" class="t-con" readonly value="${member.age }"></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">가입일</td><td><input type="text" id="enrollDate" name="enrollDate" class="t-con" readonly value="${member.enrollDate }"></td>
                        
                    </tr>
                    
                 </table>
                 <div id="bottomBtn">
                     <button type="submit" id="main" value="메인">메인으로</button>
                     <button type="button" id="delete" value="회원탈퇴" onclick="deleteMember('${m.memberId}')">회원탈퇴</button>
                 </div>
            
            </div>
        </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
    		function deleteMember(memberId){
    			if(confirm("탈퇴하시겠습니까?")){
    				location.href="/deleteMember?memberId="+memberId
    			}
    		}
    </script>
</body>
<style>
	.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 0px auto 0 auto;
            height: 1200px;
           
        }
        .content>h1{
        	font-size:40px;
        }
        #img1{
           
            width: 100%;
            height: 450px;
        }
        #top{
	        height: 200px;
	        border-bottom:1px solid black;
	        border-top:1px solid black;
	        margin-bottom: 50px;
	        background-color: #2E2E2E;
        
        }
        #nameF{
        	margin-left:50px;
			font-size:50px; 
			color:white;   
        }
        
        #top-c1{
            width: 200px;
            
            height: 200px;
            
        }
        #top-c1>a{
        	float:right;
        }
        #top-c2{
        	
			width:80px;
			height:200px;        
        }
      
        #updatebtn{
        	 height:50px;
        	 display:block;
        	 color:#bebebf;
			       
        }
        #top-c2>p{
        	margin-top:100px;
        	font-size:20px;
        	color:white;
        }
        #top-c3{
        	width:160px;
			height:200px;
			
			font-size:30px;
			
        }#top-c3>a{
        	width:150px;
        	height:100px;
        	 background-color: #F2F2F2;
        	 display:block;
        	 text-align:center;
        	 line-height: 100px;
        	 border-radius:20px;
        }
        #top-c4>a{
        	width:150px;
        	height:100px;
        	 background-color: #F2F2F2;
        	 display:block;
        	 text-align:center;
        	 line-height: 100px;
        	 border-radius:20px;
        }
        
        #t-con{
            width: 400px;
           
            height: 200px;
            font-size:25px;
        }
        
        .table{
            width: 100%;
            margin-bottom:100px;
             margin-top:30px;
             border-collapse: collapse;
            border-spacing: 0;
            border-bottom:1px solid black;
           
            
        }
        .t-con{
        	font-size:20px;
            width: 500px;
            height: 35px;
            border-radius: 5px;
            border: 1px;
        }
        .title{
            font-size: 20px;
            width: 200px;
            height: 60px;
           
            background-color: gainsboro;
        }
        .content>h3{
            font-size: 30px;
            margin-top: 50px;
            margin: 0;
        }
         .tr>td{
            border-top: 1px solid black;
        }
        #bottomBtn{
            width:98%;
            margin: 0 auto;
            margin-left: 20px;
           
            margin-top: 20px;
        }
        #bottomBtn>button{
            
            width: 150px;
            border-radius: 5px;
            border: 1px;
           
        }
        #main{
            color: white;
            background-color: red;
            margin-top: 0px;
            margin-left: 400px;
            width: 150px;
            height: 40px;
        }
        #delete{
            background-color: black;
            color: white;
            margin-left: 20px;
            width: 150px;
            height: 40px; 
        }
</style>
</html>