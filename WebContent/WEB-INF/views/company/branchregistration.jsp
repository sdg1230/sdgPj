<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
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
</style>
<script>
function loadImg(f) {
	console.log(f.files);
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
</script>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="content2 cTitle">designer</div>
	<div class="content1">
        <form action="/branchregistration" method="post" enctype="multipart/form-data" id="updateFrm">
            <div class="div3">
                <h1>가맹점 등록</h1>
            </div>

            <table border="1">

                <tr>
                
                    <th class="th1">가맹이름</th>
                    <td class="td1"><input type="hidden" name="salonNo" id="salonNo" value="${list.salonNo }"><input class="inp"type="text" name="salonName" value="${list.salonName }"></td>
                </tr>
                <tr>
                    <th class="th1">주소</th>
                    <td class="td1"><input class="inp"type="text" name="salonAddr" value="${list.salonAddr }"></td>
                </tr>
                <tr>
                    <th class="th1">전화번호</th>
                    <td class="td1"><input class="inp"type="text" name="salonPhone" value="${list.salonPhone }"></td>
                </tr>
                <tr>
                    <th class="th1">첨부파일</th>

                    <td class="td2">
                    <input type="hidden" name="status" value="stay">
                       
                            
                            <input type="file" name="salonFilename" id="file" onchange="loadImg(this);">

                            
                            <span class="delFile"></span>
                            
                       


                    </td>
                </tr>
                <tr>
                    <th class="th1">이미지 보기</th>
                    <td>
                        <div id="img-viewer">
                            <img id="img-view"  width="350">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="th1">소개글</th>
                    <td class="td3" ><textarea id="salonInfo"name="salonInfo" rows="3" style="width: 99%;height:100%"></textarea></td>
                </tr>
                <tr>
                    <th colspan="2" style="text-align: center"><button type="submit">등록하기</button><button type="reset">초기화</button></th>

                </tr>
            </table>
        </form>
</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>