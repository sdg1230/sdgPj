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
            <h1>회원가입</h1>
            
            <!--<form id="checkIdFrm"><!--중복체크-->
               <!-- <input type="hidden" name="checkId">
            </form>
            -->
            
            <form action="/join" method="post" id="form">
                <table class="table">
                    <tr class="tr">
                        <td class="title" ><label for="id">아이디</label></td><td ><input type="text" id="id" name="memberId" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">이름</td><td><input type="text" id="name" name="memberName" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr"> 
                        <td class="title">비밀번호</td><td><input type="password" id="pw" name="memberPw" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">비밀번호확인</td><td><input type="password" id="rePw" name="rePw" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                     <tr class="tr">
                        <td class="title">휴대폰번호</td><td><input type="text" id="phone" name="phone" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                    <tr class="tr">
                        <td class="title">주소</td><td><input type="text" id="address" name="address" class="t-con" readonly>
                        <input type="button" value="주소검색" id="addrSearchBtn" onclick="addrSearch();">
                        
                        <span class="comment"></span></td>
                        
                    </tr>
                    
                    <tr class="tr">
                        <td class="title">성별<td colspan="1"></</td><input type="radio" id="m" name="gender" class="t-con2" value="남">남
                        <input type="radio" id="f" name="gender"class="t-con2" value="여">여</td>
                        <td><span class="comment"></span></td>
                    </tr>
                    <tr class="tr">
                        <td class="title">나이</td>
                         <td><input type="text" id="age" name="age" class="t-con"><span class="comment"></span></td>
                        
                    </tr>
                 </table>
                 <div id="bottomBtn">
                     <button type="submit" id="joinBtn" value="회원가입">회원가입</button>
                     <button type="reset" id="cancel" value="취소">취소</button>
                 </div>
            </form>
            
        </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
	<script>
	$(function(){
		var count=[false,false,false,false,false,false];
        var gender = $(':radio[name="gender"]:checked').val();
        var comments = document.getElementsByClassName("comment");
        for(var i=0; i<comments.length;i++){
            comments[i].innerHTML="";
        }
        $('#id').focusout(function(){
        	
             var idReg=/^[a-z][a-z0-9]{4,12}$/;
            if(!idReg.test($(this).val())){
                comments[0].innerHTML="영문 소문자 및 숫자 6~12자리";
                var memberId=$("#id").val();
                count[0]=false;
                
               
                
            }else{
            	var memberId= $("#id").val();
                 $.ajax({
                    url:"/checkId",
                    type:"get",
                    data:{memberId:memberId},
                    success:function(data){
                        if(data==1){
                        	comments[0].innerHTML="아이디가 중복됩니다.";
                          //$("#id").focus();
                        	count[0]=false;
                        	
                        }else{
                        	comments[0].innerHTML="사용가능합니다.";
                        	count[0]=true;
                        }
                    }
                });
            };
             $(this).focus(function(){
                    comments[7].innerHTML="";
                });
        });
        $('#name').focusout(function(){
            var nameReg=/^[가-힣]{1,5}$/;
            if(!nameReg.test($(this).val())){
                comments[1].innerHTML="한글(다섯 글자 이하)로 입력해주세요";
                count[1]=false;
                
            }else{
            	count[1]=true;
            }
            $(this).focus(function(){
                    comments[1].innerHTML="";
                   
                });
             
            
        });
        $('#pw').focusout(function(){
            var pwReg=/^[a-zA-Z0-9]{8,12}/;
            if(!pwReg.test($(this).val())){
                comments[2].innerHTML="대문자,소문자,숫자로 8~12글자";
                count[2]=false;
            }else{
            	count[2]=true;
            }
             $(this).focus(function(){
                    comments[2].innerHTML="";
                });
        });
        $('#rePw').focusout(function(){
            if($(this).val()==$("#pw").val()){
                comments[3].innerHTML="";
                count[3]=true;
            }else{
            	comments[3].innerHTML="비밀번호를 확인해주세요";
            	count[3]=false;
            }
             $(this).focus(function(){
                    comments[3].innerHTML="";
                });
        });
        $('#phone').focusout(function(){
           var phoneReg=/^(010)-?([0-9]{3,4})-?([0-9]{4})$/;
            if(!phoneReg.test($(this).val())){
                comments[4].innerHTML="0xx-xxxx-xxxx로 입력해주세요";
                count[4]=false;
            }else{
            	count[4]=true;
            }
             $(this).focus(function(){
                    comments[4].innerHTML="";
                });
        });
        
        
        $('#age').focusout(function(){
            var ageReg=/^[0-9]{1,3}$/;
            if(!ageReg.test($(this).val())){
                comments[7].innerHTML="나이를 정확히[숫자만] 입력하세요";
                count[5]=false;
            }else{
            	count[5]=true;
            }
             $(this).focus(function(){
                    comments[7].innerHTML="";
                });
            
        });
       
        $("form").submit(function(){
        	

           
           var genderNum=$("input:radio[name='gender']:checked").length;
           console.log(genderNum);
           if(genderNum==0){
               comments[6].innerHTML="성별을 체크해주세요";
               count[5]=false;
           }else{
               count[5]=true;
           }
           
           
           
        	
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
            	alert("회원가입불가");
                return false;
            }
        });
        
		

        
    });
    //주소찾기
    function addrSearch(){
        new daum.Postcode({
            oncomplete:function(data){
                $("#address").val(data.roadAddress);
            }
        }).open();
    }
    
    
    
	
	</script>
	<style>
	/* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 24px;
	margin-bottom: 10px;
	padding: 0;
}

.homeIcon>img {
	margin-top: 5px;
}

.headermiddle {
	padding-top: 5px;
}
/* 헤더 제대로적용------------------------ */
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
        #addrSearchBtn:hover{
        	cursor: pointer;
        	background-color: #1391FF;
        	opacity: 0.8;
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
        #joinBtn{
            color: white;
            background-color: #CD3C41;
            margin-top: 30px;
            margin-left: 400px;
            width: 150px;
            height: 40px;
        }
        #joinBtn:hover{
        	cursor:pointer;
        	background-color:red;
        }
        #cancel{
            background-color: gray;
            color: white;
            margin-left: 20px;
            width: 150px;
            height: 40px; 
        }
        #cancel:hover{
        	cursor:pointer;
        	background-color: black;
        }
	</style>
</html>