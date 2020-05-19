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
    	<div class="content">
    	<h1>비밀번호 찾기</h1>
	 			<table id="table">
	 			
                        <tr>
                             <td class="loginfont">아이디</td>
                             <td><input type="text" id="id" name="memberId" ></td>
                             <!--  <td rowspan="2"><button type="submit" id="btn" >로그인</button></td>-->
                        </tr>
                        <tr>
                             <td class="loginfont">전화번호</td>
                             <td><input type="text" id="phone" name="memberPhone"></td>
                         </tr>
                         
                        
                         
                </table>
                		<button id="btn" >확인</button>
                		<form action="/pwSearchUpdate" method="post">
                		
                		<div id="result"></div>
                		</form>
                		
                
  </div>
 
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />        
    
</body>
	<script>
		$(function(){
			$("#btn").click(function(){
				var memberId=$("#id").val();
				var memberPhone=$("#phone").val();
				$("#result").html("");
			$.ajax({
				url:"/pwSearch",
				type:"get",
				data:{memberId:memberId,memberPhone:memberPhone},
				success:function(data){
					if(data==1){
						
						$("#result").html("새로운 비밀번호<input type='text' id='name'><br>"
					               +"새로운 비밀번호 확인<input type='text' id='name'>"+
					               "<button>실행</button>");
					}else{
						$("#result").html("일지하는 정보가 없습니다.");
					}
				}
			});	
			});
		});
	
	</script>
	
	<style>
	.content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 0px auto 0 auto;
            height: 500px;
           
        }
        .content>h1{
        	font-size:40px;
        }
        #img1{
           
            width: 100%;
            height: 450px;
        }
        #table{
        	margin:0 auto;
        }
	</style>
</html>