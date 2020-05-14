<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <% boolean result =(Boolean)request.getAttribute("result"); 
     	String checkId=(String)request.getAttribute("checkId");
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function setMemberId(memberId){}
	</script>
	<div>
		<%if(result) {%>
			[<span><%=checkId %></span>]는 사용가능합니다.<br><br>
			<button type="button" onclick="setMemberId('<%=checkId %>');">닫기</button>
		<%}else{ %>
			[<span><%=checkId %></span>]는 이미 사용 중 입니다.<br><br>
			<form action="/checkId" method="post">
				<input type="text" name="checkId" placeholder="아이디입력"><br>
					<input type="text" name="checkId" placeholder="아이디입력"><br>
					
					
			</form>
		<%} %>
	</div>
</body>
</html>