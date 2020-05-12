<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
	.content{
		overflow:"hidden";
		text-align:center;
		
		
	}
	.cTitle{
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
            background-color: #998778;
            
    }
    .hi{
    	margin:0 auto;
    	border : 1px solid white;
    	width : 10px;
    	height: 10px;
    	border-radius: 100px;
    	box-shadow: 5px 5px 5px grey;
    }
	
	.content p{
		font-size:50px;
		text-align:center;
	}
	.reserveno{
		box-shadow: 5px 5px 5px grey;
		margin:0 auto;
		margin-bottom:10px;
		padding:30px;
		width:500px;
		border-radius: 10px;
		
	}
	.reserveok{
		border:10px solid #998778;
		margin:0 auto;
		margin-bottom:10px;
		padding:30px;
		width:500px;
		
		
	}
	.userInfo{
		box-shadow: 5px 5px 5px grey;
		margin:0 auto;
		padding:30px;
		width:60%;
		margin-bottom:40px;
		border-radius: 15px;
		
	}
	
	td{
		width:50%;
		
	}
	th{
		text-align:left;
	}
	.button{
		
		text-align:right;
	}
	.img{
		text-align:right;
	}
</style>
</head>
<body>
<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle"><p>예약확인</p></div><br><br>
		<div class="content2">		
		<div class="userInfo"><h2>고객정보</h2>
			<table>
				<tr>
					<th>이름 : </th>
					<td><span class="memberName">${userReserveList[0].memberName}</span></td>
				</tr>
				<tr>
					<th>회원 아이디 : </th>
					<td><span class="gender">${userReserveList[0].memberId}</span></td>
				</tr>
				<tr>
					<th>전화번호: </th>
					<td><span class="phone">${userReserveList[0].memberPhone}</span></td>
				</tr>
			</table>
			
		</div>
		<div class='hi'></div>
		
		
		<script>
			
		</script>
		
			<c:forEach items="${userReserveList}" var='u'>
			<c:if test="${u.reserveStatus==true}">
			<div class="reserveno">예약대기
				<table>
					<tr>
						<th>예약지점 : <span>${u.salonName}</span></th>
						<td rowspan="6" class="img"><img src="../upload/designer/designer${u.designerNo}.jpg" width="150" height="150"></td>											
					</tr>
					<tr>
						<th>예약날짜 : <span>${u.reserveDate}</span></th>											
					</tr>
					<tr>
						<th>예약 디자이너 : <span>${u.designerName}</span></th>
						
						
							
						
					</tr>
					<tr>
						<th>예약 시간 : <span>${u.startTime}</span></th>
					</tr>
					<tr>
						<th>예약 가격 : <span>${u.totalPrice}</span></th>
					</tr>
					<c:forEach items="${u.menuList}" var='uu'>
						<tr>
						<th>예약 시술 : <span>${uu.hairName}</span></th>
					</tr>
					</c:forEach>					
					<tr>
						<th>예약 확인 : <span>${u.reserveStatus}</span></th>
					</tr>
					<c:if test="${u.reserveStatus==true}">
						<td><input type="button" class="button" value="후기작성" onclick="test1();"></td>
					</c:if>
				</table>				
			</div>
			<div class='hi'></div>
			<div class='hi'></div>
			<div class='hi'></div>
			</c:if>
			
			<c:if test="${u.reserveStatus==false}">
				
				<div class="reserveok">시술완료
				<table>
					<tr>
						<th>예약지점 : <span>${u.salonName}</span></th>											
					</tr>
					<tr>
						<th>예약날짜 : <span>${u.reserveDate}</span></th>											
					</tr>
					<tr>
						<th>예약 디자이너 : <span>${u.designerName}</span></th>
					</tr>
					<tr>
						<th>예약 시간 : <span>${u.startTime}</span></th>
					</tr>
					<tr>
						<th>예약 가격 : <span>${u.totalPrice}</span></th>
					</tr>
					<c:forEach items="${u.menuList}" var='uu'>
						<tr>
						<th>예약 시술 : <span>${uu.hairName}</span></th>
					</tr>
					</c:forEach>					
					<tr>
						<th>예약 확인 : <span>${u.reserveStatus}</span></th>
					</tr>
					<c:if test="${u.reserveStatus==false}">
						<td><input type="button" class="button" value="후기작성완료" readonly"></td>
					</c:if>
				</table>
			</div>
			</c:if>
			</c:forEach>
				
						
<!-- 				<table> -->
<!-- 					
<!-- 					<tr> -->
<%-- 						<th>예약 디자이너 : <span>${userReserveList[0].designerName}</span></th> --%>
						
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<th>예약 시간 : <span>${userReserveList[0].startTime}</span></th> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>예약 시술 목록 : <span></span></th> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<th>예약 가격 : <span>${userReserveList[0].totalPrice}</span></th> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>예약확인유/무 : </th><td><input type="button" class="button" value="후기작성" onclick="test1();"></td> -->
<!-- 					</tr> -->
<!-- 				</table> -->
				
			
			
			
						
		
		
		</div>
		
		
		
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>