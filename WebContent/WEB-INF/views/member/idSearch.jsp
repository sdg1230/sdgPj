<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <img src="../../../imgs/backImg1.jpg" id="img1">
    <form action="/idSearch" method="post"></form>
    <div class="content">
	 			<table>
                        <tr>
                             <td class="loginfont">이름</td>
                             <td><input type="text" id="id" name="memberId" ></td>
                             <!--  <td rowspan="2"><button type="submit" id="btn" >로그인</button></td>-->
                        </tr>
                        <tr>
                             <td class="loginfont">전화번호</td>
                             <td><input type="password" id="phone" name="memberPhone"></td>
                         </tr>
                         
                </table>
                
  </div>
  </form>
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />               
           
	
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
</style>
</html>