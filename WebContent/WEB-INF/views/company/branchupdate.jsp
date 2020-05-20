<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
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
	letter-spacing: 80%;
	width: 100%;
	height: 200px;
	opacity: 90%;
	color: white;
	background-color: #998778;
}
.content1 {
            width: 1200px;
            overflow: hidden;
            margin: 0 auto;
            height: 100%;
            background-color: white;
            text-align: center;
        }

        table {
            overflow: hidden;
            width: 800px;
            border-collapse: collapse;
            padding: 0;
            margin: 0 auto;
            text-align: center;
            background-color: white;
        }

        .th1 {
            
            width: 150px;
            height: 50px;
            text-align: center;
        }
        

        .td1{
            width: 400px;
            height: 50px;
        }
        .td2{
            text-align: left;
            
        }
        .inp{
            width: 700px;
            height: 100%;
            font-size: 1.2em;
        }
        .div3 {

            border: 1px solid white;
            display: block;
            background-color: darkgray;
            font-size: 1.5em;
            text-align: center;
        }
        .td3{
            height: 200px;
        }
        #img-viewer{
            width: 100%;
            height: 100%;
            
        }
        .butt{
	width: 200px;
	height: 50px;
}
.form-control{
	text-align: left;
}
</style>
<script>


function loadImg(f) {
if (f.files.length != 0 && f.files[0] != 0) {
    var reader = new FileReader();
    reader.readAsDataURL(f.files[0]);
    reader.onload = function(e) { //파일업로드 기달리는거
        $("#img-view").attr("src", e.target.result);
    }
} else {
    $("#img-view").attr("src", "");
}
}
$(function() {
	
$("#fileDelBtn").click(function() {
    $(".delFile").hide();
    $("#file").show();
    $("input[name=status]").val('delete');
    $("#img-view").attr("src", "");
});
$("#file1").change(function() {

    $("#fileDelBtn").show();
    $(".delFile").show();
})
});
function addrSearch(){
	
	new daum.Postcode({
		oncomplete:function(data){
			$("#postCode").val(data.zonecode);
			$("#roadAddr").val(data.roadAddress);
			$("#jibunAddr").val(data.jibunAddress);
			 
		}
	}).open();
	return false;
}

    </script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="content2 cTitle">designer</div>
		<div class="content1">
            <div class="div3">
                <h1>가맹점 수정</h1>
            </div>

        <form action="/branchupdate" method="post" enctype="multipart/form-data" id="updateFrm">
            <table border="1">

                <tr>
                
                    <th class="th1">가맹이름</th>
                    <td class="td1"><input type="hidden" name="salonNo" id="salonNo" value="${list.salonNo }"><input class="inp"type="text" name="salonName" value="${list.salonName }"></td>
                </tr>
                <tr>
                    <th class="th1">주소</th>
                    <td class="td1">
							<ul>
								<li class="form-control"><input type="text" id="postCode"
									style="width: 200px;height: 25px; display: inline-block;"
									 placeholder="우편번호" readonly>
									<button id="addrSearchBtn" onclick="return addrSearch();" style="height: 30px;"
										>주소 검색</button></li>
								<li class="form-control"><input id="roadAddr" name="roadAddr"
									style="width: 48%;height: 25px;" type="text"
									 placeholder="도로명 주소"> <input
									id="jibunAddr" name="jibunAddr" style="width: 50%;height: 25px; "
									type="text"  placeholder="지번 주소"></li>
								<li class="form-control"><input id="detailAddr" name="detailAddr"
									style="width: 99.1%;height: 25px;" type="text"
									placeholder="상세 주소" value="${list.salonAddr }"></li>
							</ul>
						</td>
                </tr>
                <tr>
                    <th class="th1">전화번호</th>
                    <td class="td1"><input class="inp"type="text" name="salonPhone" value="${list.salonPhone }"></td>
                </tr>
                <tr>
                    <th class="th1">첨부파일</th>

                    <td class="td2"><input type="hidden" name="status" value="stay">
                        <c:if test="${not empty list.salonFilename }">
                            <img src="/upload/salon/${list.salonFilepath }" width="10px">
                            <input type="file" name="salonFilename" id="file" style="display:none;" onchange="loadImg(this);">

                            <button type="button" id="fileDelBtn" class="delFile">파일 삭제</button>
                            <span class="delFile">${list.salonFilepath }</span>
                            <input type="hidden" name="oldFilename" value="${list.salonFilename }">
                            <input type="hidden" name="oldFilepath" value="${list.salonFilepath }">
                        </c:if>
						<c:if test="${empty list.salonFilename }">
							<input type="file" name="salonFilename" id="file" onchange="loadImg(this);">
						</c:if>

                    </td>
                </tr>
                <tr>
                    <th class="th1">이미지 보기</th>
                    <td>
                        <div id="img-viewer">
                            <img id="img-view" src="/upload/salon/${list.salonFilepath }" width="350">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="th1">소개글</th>
                    <td class="td3" ><textarea id="salonInfo"name="salonInfo" rows="3" style="width: 99%;height:100%"> ${list.salonInfo }</textarea></td>
                </tr>
                <tr>
                    <th colspan="2" style="text-align: center">
                    <button class="butt"type="submit">수정하기</button><button class="butt"type="reset">초기화</button>
                    </th>

                </tr>
            </table>
        </form>
</div>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>