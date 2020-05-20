<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=aii1pydhrn&submodules=geocoder"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <img src="../../../imgs/backImg1.jpg" id="img1">
    <div class="content">
            <h1>회원정보수정</h1>
             <form action="/update" method="post" id="form">
                <table class="table">
                     <tr class="tr">
                        <td class="title" ><label for="id">아이디</label></td><td ><input type="text" id="id" name="memberId" class="t-con" value="${member.memberId }" readonly></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">이름</td><td><input type="text" id="name" name="memberName" class="t-con" value="${member.memberName }"readonly></td>
                        
                    </tr>
                    
                    <tr class="tr"> 
                        <td class="title">비밀번호</td><td><input type="password" id="pw" name="memberPw" class="t-con"><span class="comment"></span></td>
                       
                    </tr>
                    <tr class="tr">
                        <td class="title">비밀번호확인</td><td><input type="password" id="rePw" name="rePw" class="t-con"><span class="comment" ></span></td>
                        
                    </tr>
                     <tr class="tr">
                        <td class="title">휴대폰번호</td><td><input type="text" id="phone" name="phone" class="t-con"value="${member.memberPhone }" required><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">주소</td><td><input type="text" id="addr" name="address" class="t-con" value="${member.address }" >
                        <input type="button" value="주소검색" id="addrSearchBtn" onclick="addrSearch();">
                        
                        <span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">성별</td><td><input type="text" id="gender" name="gender" class="t-con" readonly value="${member.gender }"readonly></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">나이</td><td><input type="text" id="age" name="age" class="t-con" readonly value="${member.age }"readonly></td>
                        
                    </tr>
                    
                   
                 </table>
                 <div id="bottomBtn">
                     <button type="submit" id="update" value="확인">확인</button>
                     <button type="reset" id="cancel" value="취소">취소</button>
                 </div>
            </form>
        </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    
    <script>
    //주소찾기
        function addrSearch(){
            new daum.Postcode({
                oncomplete:function(data){
                    $("#addr").val(data.roadAddress);
                }
            }).open();
        }
    
        
    	
    
    
    $(function(){
    	 var count=[false,false];
    	 var comments = document.getElementsByClassName("comment");
    	 for(var i=0; i<comments.length; i++){
             comments[i].innerHTML="";
         }
    	 
    	 
    	 /*
    	 $('#name').focusout(function(){
             var nameReg=/^[가-힣]{1,5}$/;
             if(!nameReg.test($(this).val())){
                 comments[0].innerHTML="한글(다섯 글자 이하)로 입력해주세요";
                 count[0]=false;
                 
             }else{
             	count[0]=true;
             	console.log("a");
             }
             $(this).focus(function(){
                     comments[0].innerHTML="";
                    
                 });
              
             
         });
    	 
    	 */
    	 
    	 
    	 
    	 $('#pw').focusout(function(){
             var pwReg=/^[a-zA-Z0-9]{8,12}/;
             if(!pwReg.test($(this).val())){
                 comments[0].innerHTML="대문자,소문자,숫자로 8~12글자";
                 
                 count[0]=false;
                
             }else{
             	count[0]=true;
             }
              $(this).focus(function(){
                     comments[0].innerHTML="";
                 });
         });
         $('#rePw').focusout(function(){
             if($(this).val()==$("#pw").val()){
                 comments[1].innerHTML="";
                 count[1]=true;
             }else{
             	comments[1].innerHTML="비밀번호를 확인해주세요";
             	count[1]=false;
             }
              $(this).focus(function(){
                     comments[1].innerHTML="";
                 });
         });
         
         
         
         
         $('#phone').change(function(){
            var phoneReg=/^(010)-?([0-9]{3,4})-?([0-9]{4})$/;
             if(!phoneReg.test($(this).val())){
                 comments[2].innerHTML="0xx-xxxx-xxxx로 입력해주세요";
                 $(this).val("");
                 count[2]=false;
             }else{
             	count[2]=true;
             }
              $(this).focus(function(){
                     comments[2].innerHTML="";
                 });
         });
         
  
         $("form").submit(function(){
             var num=0;
             for(var i=0; i<count.length; i++){
                 if(count[i]==false){
                     num++;
                 }
             }
             console.log(num);
             if(num==0){
                 return true;
             }else{
             	alert("정보수정실패");
             	
                 return false;
             }
         });
    });
    
    </script>
    
</body>
<style>
/* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 25px;
	margin-bottom: 10px;
	padding: 0;
}

.homeIcon>img {
	margin-top: 5px;
}

.headermiddle {
	padding-top: 4px;
}
/* 헤더 제대로적용------------------------ */
	 .content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 30px auto 0 auto;
            height: 1200px;
           /* background-color: antiquewhite*/
        }
        #img1{
           
            width: 100%;
            height: 450px;
        }
        .content>h1{
            width:80%;
            height: 160px;
            line-height: 160px;
           
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
        #addrSearchBtn{
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
            margin-left: 0px;
           
            
        }
        #bottomBtn>button{
            height: 40px;
            width: 150px;
            border-radius: 5px;
            border: 1px;
           
        }
        #update{
            color: white;
            background-color:#CD3C41;
            margin-top: 20px;
            margin-left: 450px;
            width: 200px;
            height: 40px;
        }
        #cancel{
            background-color: black;
            color: white;
             margin-top: 0px;
            margin-left: 20px;
            width: 150px;
            height: 40px; 
        }
         #update:hover{
        	background-color:red;
        }
         #cancel:hover{
        	background-color:#969696;
        	color:black;
        }
       #bottomBtn>main{
         margin-top:0px;
        }
</style>
</html>