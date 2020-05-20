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
    <div class="content" id="container">
    <h1>회원관리</h1>
    <div id="top">
    <h2>회원검색</h2>
    	<ul id="ul">
    		<li>이름</li>
    		<li><input type="text" id="searchText" ></li>
    		
    	</ul>
    </div>
    <button id="allReserve" value="전체조회"><a href="/adminReserveList">전체예약</a></button>
    <div>
    	<table class="mtable">
    		<!-- <tr id="title">
    			<td >이름</td><td>아이디</td><td>성별</td><td style="width:250px">휴대폰번호</td><td style="width:230px;">주소</td><td  style="width:90px">나이</td><td>가입일</td><td>정보삭제</td>
    		</tr>
    		 -->
    		 <ul id="title">
    		 	<li class="name">이름</li><li class="id">아이디</li><li class="gender">성별</li><li class="phone">휴대폰번호</li><li class="addr">주소</li><li class="age">나이</li><li class="date">가입일</li><li id="m" class="del">정보수정</li>
    		 </ul>
    		<c:forEach items="${list}" var="m" >
	    		<tr id="tr">
	    			<td class="id">${m.memberName }</td>
	    			<td class="name">${m.memberId }</td>
	    			<td id="g"class="gender">${m.gender }</td>
	    			<td id="p"class="phone">${m.memberPhone }</td>
	    			<td id="addr"class="addr">${m.address }</td>
	    			<td id="age"class="age">${m.age }</td>
	    			<td class="date">${m.enrollDate }</td>
	    			<td class="del"><button id="delBtn" onclick="location.href='/adminDeleteMembe?memberId=${m.memberId }'">삭제</button>
	    			
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
    </div>
    </div>
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
     <script>
     //이름으로 검색
     $(function(){
         $("#searchText").keyup(function() {
             var k = $(this).val();
             $("tr").hide();
            
             var temp=$("tr>td:nth-child(8n+1):contains('"+k+"')");
             $(temp).parent().show();
             
         });
         
        
     });
     </script>
</body>
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
	line-height:30px;
	padding-top:4px;
}
/* 헤더 제대로적용------------------------ */
	.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 0px auto 0 auto;
          
            
        }
        #img1{
           
            width: 100%;
            height: 450px;
        }
         .content>h1{
        	font-size:40px;
        	background-color:white;
        	
        }
        #allReserve{
        	width:100px;
        	height:40px;
        	float:right;
        	background-color: #CD3C41;
        	margin-bottom:20px;
        	border:1px;
        	color:white;
        	  box-shadow: 2px;
        }
        #allReserve>a{
        	color:white;
        	display:block;
        }
        #allReserve:hover{
        	background-color:red;
        }
      #ul>li{
            display: inline-block;
        }
        .gender{
        	width:100px;
        }
        #g{
        	width:50px;
        }
        .phone{
        	width:200px;
        }
        #p{
        	width:170px;
        }
        .name{
        	width:100px;
        }
        .id{
        	width:100px;
        }
        #age{
        	width:30px;
        }
        .age{
        	width:60px;
        }
        #addr{
 			width:320px;       
        }
        .addr{
        	width:350px;
        }
        .date{
        	width:150px;
        }
        .del{
			width:100px;        
        }
        #m{
        	width:135px;
        }
        #ul>li:first-child{
        	margin-left:100px;
        	font-size:21px;
        	width:100px;
        
        }
        #ul>li>input{
        	width:400px;
        	height:30px;
        	border-radius:7px;
        	border:4px solid #2E2E2E;
        }
		#top{
	        height: 150px;
	         
	        margin-bottom:20px;
	        border-top:1px solid black;
	        border-bottom:1px solid black;
        
        }
        #top>h2{
         	margin-left:60px;
        	font-size:25px;
        }
        #searchText{
        	width:400px;
        	height:40px;
        	border:5px solid #2E2E2E;
        }
        
        .mtable{
        	width:100%;
        	margin-bottom: 100px;
        	border-collapse: collapse;
            border-spacing: 0;
        }
        #title>li{
        	font-size:21px;
        	text-align:center;
        	background-color:#E6E6E6;
        	display: inline-block; 
        	height:55px;   
        	line-height: 55px;    	
        }
        #tr>td{
        	
        	text-align:center;
        	border-top:1px solid black;
        	height:55px;
        	
        	
        }
        #title{
        	
        	height:55px;
        	display: inline-block; 
        	
        }
        #delBtn{
        	background-color: #998778;
        	border:1px;
        	color:white;
        	width:60px;
        	height:30px;
        }
        #delBtn:hover{
        	background-color:#E6E6E6;
        	color:black;
        	
        }
        </style>
</html>