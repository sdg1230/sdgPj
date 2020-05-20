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
	    <div id="top">
	    <h1>아이디 찾기</h1>
	    </div >	
	    	
	    	<div id="d1">
	    		<table id="t1">
	    			<tr>	
	    				<td>
				 				<table id="t2">
			                        <tr>
			                             <td class="title">이름</td>
			                             <td><input type="text" id="name" name="memberName" class="input"></td>
			                             <!--  <td rowspan="2"><button type="submit" id="btn" >로그인</button></td>-->
			                        </tr>
			                        <tr>
			                             <td class="title">전화번호</td>
			                             <td><input type="text" id="phone" name="memberPhone" class="input" placeholder="ex)010-0000-0000"></td>
			                         </tr>
			                     </table>    
			                       
                        </td>
                        <td>
                        	 <span class="a"><button id="btn" >확인</button></span>
                        </td>
                        
                      </tr>   
                
                </table>
             </div>
                		
                		 
                		 <div >
                		<input type="text" id="result" readonly>
                		</div>
                		<div class="subBtnWrapper">
	                		<button class="gotologin subBtn">로그인</button>
	                		<button class="gotopwsearch subBtn">비밀번호 찾기</button>
                		</div>
                
  </div>
 
  <jsp:include page="/WEB-INF/views/common/footer.jsp" />               
           
	
</body>
<script>
	$(function(){
		$("#btn").click(function(){

			var memberName=$("#name").val();
			var memberPhone=$("#phone").val();
			$.ajax({
				url:"/idSearch",
				type:"get",
				data:{memberName:memberName,memberPhone:memberPhone},
				
				success:function(data){
					if(data!=null){
						$("#result").val("Id는 "+data.memberId+"입니다.");
						$(".subBtnWrapper").show();
					}else{
						$("#result").val("이름 또는 전화번호를 확인해주세요");
						$(".subBtnWrapper").hide();
					}

				},error:function(){
					
				}
				
			});
		
		});
		
		$(".gotologin").click(function(){
			location.href="/loginFrm";
		});
		
		$(".gotopwsearch").click(function(){
			location.href="/pwSearchFrm";
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
       
        #btn{
			width:90px;
			height:70px; 
			 background-color:#CD3C41;
			 border-radius:5px;
			 border:1px;  
			 color:white;
			 font-size:15px;
        }
        #btn:hover{
        	cursor:pointer;
        	background-color:red;
        }
        .content>h1{
        	font-size:40px;
        	margin: 0px auto;
        }
        #img1{
           
            width: 100%;
            height: 450px;
        } 
        #top{
        	width:200px;
	        height: 50px;
	        margin: 0px auto;
	       
	        margin-top: 70px;
	        margin-bottom: 50px;
	        
        
        }
        .input{
       		width:200px;
	        height: 30px;
        	border:1px solid black;
        	border-radius:5px;
        }
        .title{
        	margin: 0px auto;
        	margin-left:100px;
        	font-size:20px;
        }
        #t1{
        	margin-left:400px;
        }
        #t2{
        	margin:0 auto;
        }
       
        #result{
        margin-left:500px;
        	width:300px;
        	height:30px;
        	font-size:20px;
        	border-style:none;
        }
        .subBtn{
			height:40px; 
			background-color:#CD3C41;
			border-radius:5px;
			border:1px;  
			color:white;
			font-size:15px;
        }
        .subBtn:hover{
        	cursor:pointer;
        	background-color:red;
        }
        .subBtnWrapper{
        	width: 200px;
        	margin: 0 auto;
        	display:none;
        }
</style>
</html>