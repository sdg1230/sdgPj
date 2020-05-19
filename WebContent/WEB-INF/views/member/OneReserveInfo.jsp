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
   	<h1>예약확인</h1> 
   		<table id="table">
   			<tr id="title">
   				
					<td>예약자</td>
					<td>전화번호</td>
					<td>지점</td>
					<td>담당 디자이너</td>
					<td>예약 날짜</td>
					<td>예약 시간</td>
					<td>시술 목록</td>
					<td>선결제</td>
					<td>상태</td>
   			</tr>
   			
   		</table>
   
   
     </div>
    
     <jsp:include page="/WEB-INF/views/common/footer.jsp" />
     
     <script>
     	
		     
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
        #table{
        	border-collapse: collapse;
            border-spacing: 0;
        
        }
        #img1{
           
            width: 100%;
            height: 450px;
        }
         .content>h1{
        	font-size:40px;
        	
        }
        #title>td{
        	font-size:20px;
        	width:150px;
        	height:30px;
        	background-color:#E6E6E6;
        	text-align:center;
        }
        
        
</style>
</html>