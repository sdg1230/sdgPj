<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<!--    모달-->

<title>디자이너 관리</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<div class="cTitle meorijom">
			#designer<span>디자이너 관리</span>
		</div>
		<div class="content2">
			<div class="cBody1">
				<select name="salon">
					<option>지점명</option>
					<c:forEach items="${salonList }" var="s">
					<option value="${s }">${s }</option>
					</c:forEach>
				</select>
				<button type="button" class="add" id="myBtn">추가</button>
			</div>
			 <!-- Modal-------------------------------------------------------------- -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog" id="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content" id="modal-content">
                       <div class="insertForm">
                <div class="formTitle">디자이너 추가</div>
                <form action="/insertDesigner" method="post">
                    <table width="100%">
                        <tr>
                            <td width="35%"><span class="hash">#</span>지점명</td>
                            <td width="65%">
                                <select name="salonName">
                                    <option value="salon1">지점명</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 이름</td>
                            <td><input type="text" name="designerName" style="width:95%;"></td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 사진</td>
                            <td><input type="file" name="designerFilename" style=""></td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;"><span class="hash">#</span>디자이너 소개</td>
                            <td><textarea name="designerInfo" rows="8" cols="39"  maxlength="165"></textarea></td>
                        </tr>

                    </table>
                    <div class="insertBtn">
                        <button type="submit" class="btn btn-default">등록</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button></div>
                </form>
            </div>
                    </div>
                </div>
            </div>
             <!--디자이너리스트출력---------------------------------------------------------- -->
             <div class="cBody2">
             	<c:forEach items="${designerList }" var="d">
             		<div class="designerInfo">
                    <img src="/upload/designer/${d.designerFilepath }">
                    <div class="designerName">${d.designerName }</div>
                    <p class="designerContent">
                       ${d.designerInfo }</p>
                    <button type="button" id="myBtn2">수정</button>
                    <button type="button" class="delete">삭제</button>
                </div>
             	</c:forEach>
             </div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
//부트스트립에만
$("a").click(function() {
    $(this).css("text-decoration", "none").css("color", "#333333");
});
//모달
$(function() {
    $("#myBtn").click(function() {
        $("#myModal").modal();
    });

});

//지점명별 검색..
$("select").change(function(){
	var salonName =$(this).val();
	$.ajax({
		url : "/designerList2",
		data : {salonName : salonName},
		type : "get",
		success : function(data) {
			$(".cBody2").empty();
			 //list가 들어있는상태
			  var html="";
			  for(var i=0; i<data.length;i++){
				  html += "<div class='designerInfo'>"
				  html += "<img src='upload/designer/"+data[i].designerFilepath+"'>"
				  html += "<div class='designerName'>"+data[i].designerName+"</div>"
				  html += "<p class='designerContent'>"+data[i].designerInfo+"</p>"
				  html += "<button type='button' id='myBtn2'>수정</button>";
				  html += "<button type='button' class='delete'>삭제</button></div>"
			  }
			  $(".cBody2").append(html);
		}
	});
});

</script>
<style>
.content2 {
	/*-지우지마세요-*/
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

.cTitle {
	margin-top: 130px;
	padding-top: 50px;
	padding-left: 100px;
	font-size: 50px;
	text-decoration: underline;
	width: 100%;
	height: 200px;
	opacity: 90%;
	color: white;
	background-color: #998778;
}

.cTitle>span {
	font-size: 20px;
	font-weight: bold;
}

.cBody1 {
	padding-top: 40px;
	padding-bottom: 3px;
}

.cBody1>select {
	width: 150px;
	height: 35px;
	margin-left: 30px;
}

.add {
	width: 100px;
	float: right;
	height: 35px;
	border: none;
	background-color: #998778;
	color: white;
	font-size: 15px;
}

/* cBody2 */
   .cBody2 {
        margin: 30px 0;
        overflow: hidden;
    }

    .designerInfo {
        border-top: 1px solid lightgray;
        float: left;
        width: 300px;
        height: 400px;
        padding: 20px 30px;
        margin-top:10px;
        margin-bottom:40px;
    }

    .designerInfo>img {
        width: 100%;
        height: 280px;
    }

    .designerName {
        font-weight: bold;
        font-size: 17px;
        border-bottom: 3px solid #998778;
    }

    .designerContent {
        font-size: 13px;
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin-top: 3px;
    }

    .designerInfo>button {
        margin-left: 10px;
        width: 100px;
        height: 35px;
        font-size: 13px;
        border: none;
        background-color: #998778;
        color: white;
    }

    button.delete {
        background-color: #333333;
    }


/* 모달내부 */
    .formTitle{
        text-align: center;  
        margin: 15px auto;
        margin-bottom: 20px;
        font-size: 25px;
        text-decoration-color: #ee1c24;
        text-decoration-style: solid;
        text-decoration-line: underline;
        
    }
    table{
        border-collapse: collapse;
        height: 100%;
    }
    
    td{
        padding: 2px;
        border: 1px solid lightgray;
    }
    .insertForm {
        width: 550px;
        height: 450px;
        padding: 20px;
        overflow: hidden;
        margin: 0 auto;
    }

    .insertForm>table {
        height: 100%;
    }

    .insertBtn {
        width: 100%;
        margin: 20px auto;
        text-align: center;
    }
 .hash{
        color: #998778;
    }

/* 부트스트랩 */
a{
color:black;
}
a:hover {
            text-decoration: none;
            color: black;
        }
.homeIcon>img{
	vertical-align:-2px;
}
.headermiddle *{
height:24px;
}

</style>
</html>