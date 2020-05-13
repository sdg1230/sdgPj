<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
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
#pageNavi {
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#pageNavi>* {
	margin: 10px;
}

.selectPage {
	font-size: 18px;
}

.btn, .selectPage {
	text-align: center;
	display: inline-block;
	border: 1px solid white;
	background-color: darkgray;
	width: 50px;
	height: 50px;
	line-height: 50px;
}
.branchBox{
            border: 1px solid white;
            display: inline-block;
            text-align: center;
            width: 800px;
            height: 100px;
            line-height: 100px;
            font-size: 2em;
        }
        .content1{
            width: 1200px;
            overflow: hidden;
            margin:0 auto;
            height: 100%;
            background-color: white;
            text-align: center;
        }
        table{
        width:100%;
             border-collapse: collapse;
            padding: 0;
            margin: 0 auto;
            text-align: center;
            background-color: white;
        }
        .th1{
            border: 1px solid black;
            width: 150px;
            text-align: center;
        }
        td{
        text-align: center;
        }
        .th2{
            
            
            width: 500px;
        }
        .th3{
            
            border: 1px solid black;
            width: 100px;
            height: 40px;
        }
        .btn1{
            width: 100%;
            height: 40px;
        }
        .branch1{
        	text-align: right;
        	
        }
        .branchbtn{
        	width: 105px;
        	height: 40px;
        }
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<div class="content2 cTitle">designer</div>
		 <div class="content1">
            <div class="branchBox">지점 관리</div>
            <div class="branch1"><button class="branchbtn" onclick="location.href='/branchregistrationFrm'">지점등록</button></div>
            <table border="2">
                <tr>
                    <th class="th1">NO</th>
                    <th class="th2">매장명</th>
                    <th class="th3">수정</th>
                    <th class="th3">삭제</th>
                </tr>
                <c:forEach var="list" items="${list }">
                <tr>
				<td>${list.salonNo }</td>
				<td>${list.salonName }</td>
				<td>
					<button class="btn1"
						onclick="location.href='/branchUpdateFrm?salonName=${list.salonName }'">수정</button>
				</td>
                    <td>
					<button class="btn1"
						onclick="location.href='/branchdelete?salonName=${list.salonName }'">삭제</button>
				</td>
			</tr>
			</c:forEach>
            </table>
        </div>

		<div id="pageNavi">${pageNavi }</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>

</body>
</html>