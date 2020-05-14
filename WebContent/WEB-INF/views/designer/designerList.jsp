<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>

<title>디자이너 관리</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!--    모달-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<div class="cTitle meorijom">
			#designer<span>디자이너 관리</span>
		</div>
		<div class="content2">
			<div class="cBody1">
				<select name="salon" id="salonName">
					<option value="">지점명</option>
					<c:forEach items="${salonList }" var="s">
					<option value="${s }">${s }</option>
					</c:forEach>
				</select>
				<button type="button" class="add" id="myBtn">추가</button>
			</div>
			
             <!--디자이너리스트출력------------------------------------------- -->
             <div class="cBody2">
             </div>
             <div class="cBody3"><button type="button" class="more" id="more-btn" 
         totalCount="${totalCount }" currentCount="0" value=""><img src="/imgs/more-icon.png"></button></div>
		</div>
		 <!-- insert Modal-------------------------------------------------------------- -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog" id="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content" id="modal-content">
                       <div class="insertForm">
                <div class="formTitle">디자이너 추가</div>
                <form action="/insertDesigner" method="post" enctype="multipart/form-data" onsubmit="return insertFunc();">
                    <table width="100%">
                        <tr>
                            <td width="35%"><span class="hash">#</span>지점명</td>
                            <td width="65%">
                               <select name="salonName" id="insertSalonName">
									<option value="">지점명</option>
									<c:forEach items="${salonList }" var="s">
									<option value="${s }">${s }</option>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 이름</td>
                            <td><input type="text" name="designerName" style="width:95%;" required></td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 사진</td>
                            <td><input type="file" name="designerFilename" required></td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;"><span class="hash">#</span>디자이너 소개</td>
                            <td><textarea name="designerInfo" rows="8" cols="39"  maxlength="165"></textarea></td>
                        </tr>

                    </table>
                    <div class="insertBtn">
                        <button type="submit" class="btn btn-default">등록</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="insertCancel">취소</button></div>
                </form>
            </div>
                    </div>
                </div>
            </div>
             <!-- update Modal-------------------------------------------------------------- -->
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog" id="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content" id="modal-content">
                       <div class="updateForm">
                <div class="formTitle">디자이너 수정</div>
                <form action="/updateDesigner" method="post" enctype="multipart/form-data" onsubmit="return updateFunc();">
                    <table width="100%">
                        <tr>
                            <td width="35%"><span class="hash">#</span>지점명</td>
                            <td width="65%">
                               <select name="salonName" id="updateSalonName">
									<option value="">지점명</option>
									<c:forEach items="${salonList }" var="s">
									<option value="${s }">${s }</option>
									</c:forEach>
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 이름</td>
                            <td><input type="text" name="designerName" style="width:95%;" required></td>
                        </tr>
                        <tr>
                            <td><span class="hash">#</span>디자이너 사진</td>
                            <td><img src = "/imgs/file.png" width="16px" class="delFile">
						<input type="file" name="designerFilename" id="file" style="display:none;">
						<span class="delFile"></span>
						<button type="button"  class="btn btn-default delFile"  id="fileDelBtn">
						파일삭제
						</button>
						</td>
                        </tr>
                        <tr>
                            <td style="vertical-align:top;"><span class="hash">#</span>디자이너 소개</td>
                            <td><textarea name="designerInfo" rows="8" cols="39"  maxlength="165"></textarea></td>
                        </tr>
                        <input type="hidden" name="designerNo">
                        <input type="hidden" name="status" value="stay">
						<input type="hidden" name="oldFilename">
						<input type="hidden" name="oldFilepath">
                    </table>
                    <div class="insertBtn">
                        <button type="submit" class="btn btn-default">등록</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="updateCancel">취소</button></div>
                </form>
            </div>
                    </div>
                </div>
            </div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
//부트스트립에만
$("a").click(function() {
    $(this).css("text-decoration", "none").css("color", "");
});

//인서트모달
$("#myBtn").click(function() {
    $("#myModal").modal();
});

//모달 취소시 지우기
 $("#insertCancel").click(function(){
        $(".insertForm").find("[name=salonName]").val("");
         $(".insertForm").find("[name=designerName]").val("");
         $(".insertForm").find("[name=designerInfo]").val("");
         $(".insertForm").find("input[type=file]").val("");
     });
 $("#updateCancel").click(function(){
	 $(".delFile").show();
		$("#file").hide();
		$("input[name=status]").val('stay');
  });

//수정시 파일 삭제버튼 눌렀을 때
$("#fileDelBtn").click(function(){
			$(".delFile").hide();
			$("#file").show();
			$("input[name=status]").val('delete');
		});

//지점명별 검색..
$("#salonName").change(function(){
	var salonName =$(this).val();
	if(salonName==""){
		location.href="/designerList";
	}else{
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
					  html += "<button type='button' class='myBtn2' onclick='openModal("+data[i].designerNo+");'>수정</button>";
					  html += "<button type='button' class='delete' onclick='deleteFunc("+data[i].designerNo+");'>삭제</button></div>"
				  }
				  $(".cBody2").append(html);
				  $("#more-btn").hide();
			}
		});	
	}
	
});

function insertFunc(){
	if($("#insertSalonName").val()==""){
		alert("지점명을 선택하세요.");
		return false;
	}
	if($("#myModal").find("[name=designerInfo]").val()==""){
 		alert("디자이너 소개글을 적어주세요.");
 		return false;
 	}
}
function deleteFunc(designerNo){
	var check=confirm("해당 디자이너를 삭제하시겠습니까?");
	if(check){
		location.href="/deleteDesigner?designerNo="+designerNo;
	}
}
function openModal(designerNo) {
	$("#myModal2").modal();
	$.ajax({
		url : "/selectOneDesigner",
		data : {designerNo : designerNo},
		type : "get",
		success : function(data) {
			$("#updateSalonName").val(data.salonName).attr("selected",true);
			$("span.delFile").html(data.designerFilename);
			$("#myModal2").find("[name=designerNo]").val(data.designerNo);
			$("#myModal2").find("[name=designerName]").val(data.designerName);
			$("#myModal2").find("[name=designerInfo]").val(data.designerInfo);
			$("#myModal2").find("[name=oldFilename]").val(data.designerFilename);
			$("#myModal2").find("[name=oldFilepath]").val(data.designerFilepath);
		}
	});		 
}
function updateFunc(){
	if($("#updateSalonName").val()==""){
		alert("지점명을 선택하세요.");
		return false;
	}
 	if($("input[name=status]").val()=="delete" && $("#file").val()==""){
 		alert("디자이너 사진을 첨부해야 합니다.");
 		return false;
	}
 	if($("#myModal2").find("[name=designerInfo]").val()==""){
 		alert("디자이너 소개글을 적어주세요.");
 		return false;
 	}
}
//----------------------------------------더보기
function fn_more(start){
	  var param={start:start};
	  $.ajax({
		  url:"/designerMore",
		  data : param,
		  type:"post",
		  dataType : "json",
		  success:function(data){
			  //list가 들어있는상태
			  var html="";
			  for(var i=0; i<data.length;i++){
				  html += "<div class='designerInfo'>"
				  html += "<img src='upload/designer/"+data[i].designerFilepath+"'>"
				  html += "<div class='designerName'>"+data[i].designerName+"</div>"
				  html += "<p class='designerContent'>"+data[i].designerInfo+"</p>"
				  html += "<button type='button' class='myBtn2' onclick='openModal("+data[i].designerNo+");'>수정</button>";
				  html += "<button type='button' class='delete' onclick='deleteFunc("+data[i].designerNo+");'>삭제</button></div>"
			  }
			  
			  $(".cBody2").append(html);
			  $("#more-btn").val(Number(start)+4);
			  $("#more-btn").attr("currentCount", Number($("#more-btn").attr("currentCount"))+data.length);
			  var totalCount= $("#more-btn").attr("totalCount");
			  var currentCount = $("#more-btn").attr("currentCount");
			  if(totalCount==currentCount){
				  $("#more-btn").attr("disabled",true);
				  $("#more-btn").css("cursor","not-allowed"); 				  
			  }
		  },
		  error : function(){
			  console.log("실패");
		  }
	  })
}
$(function(){
	  $(".sideicon").click();
	  fn_more(1);
	  $("#more-btn").click(function(){
		 fn_more($(this).val()); 
	  });
})


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
	margin-right:30px;
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
/* cBody3 */
 .cBody3 {
        text-align: center;
        margin-bottom: 150px;
    }

    .more {
        width: 200px;
        height: 60px;
        font-size: 13px;
        border: none;
        background-color: #333333;
        color: white;
    }

/* 모달내부 */
    .formTitle{
        text-align: center;  
        margin: 15px auto;
        margin-bottom: 20px;
        font-size: 25px;
        font-weight:bold;
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
    .insertForm, .updateForm {
        width: 550px;
        height: 450px;
        padding: 20px;
        overflow: hidden;
        margin: 0 auto;
    }

    .insertForm>table,  {
        height: 100%;
    }
    textarea{
    resize:none;
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