<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>선결제 페이지</title>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="cTitle meorijom">
			#pay<span>결제 페이지</span>
		</div>
		<div class="content2">
			<div class="payFrame">
				<div class="reserveInfo">
					<div class="infoTitle">
						예약정보<small>결제하기 전 예약내용을 다시 한번 확인해 주세요.</small>
					</div>
					<table class="reserveTable">
						<tr>
							<td style=""><span> 예약자명</span></td>
							<td style="">${sessionScope.member.memberName }</td>
						</tr>
						<tr>
							<td><span>지점명</span></td>
							<td>${r.salonName }</td>
						</tr>
						<tr>
							<td><span>디자이너</span></td>
							<td>${r.designerName }</td>
						</tr>
						<tr>
							<td><span>예약날짜</span></td>
							<td>${r.reserveDate }</td>
						</tr>
						<tr>
							<td><span>예약시간</span></td>
							<td><c:if test="${r.startTime eq '1' }">
							10:00
							</c:if> <c:if test="${r.startTime eq '2' }">
							10:30
							</c:if> <c:if test="${r.startTime eq '3' }">
							11:00
							</c:if> <c:if test="${r.startTime eq '4' }">
							11:30
							</c:if> <c:if test="${r.startTime eq '5' }">
							12:00
							</c:if> <c:if test="${r.startTime eq '6' }">
							12:30
							</c:if> <c:if test="${r.startTime eq '7' }">
							13:00
							</c:if> <c:if test="${r.startTime eq '8' }">
							13:30
							</c:if> <c:if test="${r.startTime eq '9' }">
							14:00
							</c:if> <c:if test="${r.startTime eq '10' }">
							14:30
							</c:if> <c:if test="${r.startTime eq '11' }">
							15:00
							</c:if> <c:if test="${r.startTime eq '12' }">
							15:30
							</c:if> <c:if test="${r.startTime eq '13' }">
							16:00
							</c:if> <c:if test="${r.startTime eq '14' }">
							16:30
							</c:if> <c:if test="${r.startTime eq '15' }">
							17:00
							</c:if> <c:if test="${r.startTime eq '16' }">
							17:30
							</c:if> <c:if test="${r.startTime eq '17' }">
							18:00
							</c:if> <c:if test="${r.startTime eq '18' }">
							18:30
							</c:if> <c:if test="${r.startTime eq '19' }">
							19:00
							</c:if> <c:if test="${r.startTime eq '20' }">
							19:30
							</c:if></td>
						</tr>
						<tr>
							<td><span>시술정보</span></td>
							<td>${detail}</td>
						</tr>
					</table>
				</div>
				<div class="pay pInfo" style="height: 245px;">
					<div class="infoTitle">
						결제금액<small>선결제시 20% 할인이 적용됩니다.</small>
					</div>
					<table class="priceTable">
						<tr>
							<td>시술금액</td>
							<td>${r.totalPrice }원</td>
						</tr>
						<tr>
							<td>선결제 할인</td>
							<td id=dcPrice></td>
						</tr>
						<tr>
							<td>총금액</td>
							<td id=payPrice><span id="dc"></span>&nbsp;&nbsp;->&nbsp;&nbsp;</td>
						</tr>
					</table>
				</div>
				<div class="pay pInfo2" style="height: 245px;">
					<div class="infoTitle">결제방법</div>
					<input type="radio" name="payMethod" value="card">카드결제 /
					카카오결제<br> <input type="radio" name="payMethod" value="phone"
						disabled>휴대폰결제<br> <input type="radio"
						name="payMethod" value="bankbook" disabled>무통장 입금

				</div>
			</div>
			<div class="payBottom">
				<div class="agreement">
					<input type="checkbox" id="chk"><span>결제대행서비스 약관에 모두
						동의</span><br> &nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree"
						clsss="agree one" id="agree1"> 전자금융거래 이용약관 <br>
					&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree"
						clsss="agree two" id="agree2"> 개인정보 수집 이용약관 <br>
					&nbsp;&nbsp;&nbsp;<input type="checkbox" name="agree"
						clsss="agree three" id="agree3"> 개인정보 제공 및 위탁 안내 이용약관 <br>
					<div class="viewAgreement">
						<a href="javascript:void(0)" onclick="viewFunc1();">전문보기</a><br>
						<a href="javascript:void(0)" onclick="viewFunc2();">전문보기</a><br>
						<a href="javascript:void(0)" onclick="viewFunc3();">전문보기</a>
					</div>
				</div>
				<div>
					<button id="payBtn" onclick="return payFunc();">결제하기</button>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
</body>
<script>
	var payPrice = 0;
	$(function() {
		var dcPrice = Number('${r.totalPrice }');
		dcPrice *= 0.2;
		$("#dcPrice").html(dcPrice + "원");
		payPrice = Number('${r.totalPrice }') - dcPrice;
		$("#payPrice").append(payPrice + "원");
		$("#dc").html('${r.totalPrice }' + "원");
	});

	$("#chk").click(function() {
		var input = document.getElementsByName("agree");
		var chk = document.getElementById("chk");
		if (chk.checked) {
			for (var i = 0; i < input.length; i++) {
				input[i].checked = true;

			}
		} else {
			for (var i = 0; i < input.length; i++) {
				input[i].checked = false;
			}
		}
	});

	function viewFunc1() {
		window.open("/view/agree1.html", "_blank",
				"width=400,height=400,top=100,left=400");
		$("#agree1").attr("checked", true);
	}
	function viewFunc2() {
		window.open("/view/agree2.html", "_blank",
				"width=400,height=400,top=100,left=400");
		$("#agree2").attr("checked", true);
	}
	function viewFunc3() {
		window.open("/view/agree3.html", "_blank",
				"width=400,height=400,top=100,left=400");
		$("#agree3").attr("checked", true);
	}

	function payFunc() {
		var chk = $("input[name=agree]");
		for (var i = 0; i < chk.length; i++) {
			if (chk[i].checked == false) {
				alert("약관에 모두 동의해주세요.");
				return false;
			}
		}
		if (!$("input[name=payMethod]").prop("checked")) {
			alert("결제방법을 선택하세요.");
			return false;
		}
		var d = new Date();
		var date = d.getFullYear() + "" + (d.getMonth() + 1) + ""
				+ d.getHours() + "" + d.getMinutes() + "" + d.getSeconds();
		IMP.init("imp03735690");
		IMP.request_pay({
			//결제정보넘김
			merchant_uid : '상품명_' + date,
			name : '머리좀헤어',
			amount : 1000,
			buyer_email : 'test@naver.com',
			buyer_name : '${sessionScope.member.memberName}',
			buyer_tel : '010-1111-2222',
			buyer_postcode : '01234'
		}, function(rsp) {
			if (rsp.success) {
				//결제 성공햇을때
				var r1 = rsp.imp_uid;
				var r2 = rsp.merchant_uid;
				var r3 = rsp.paid_amount;
				var r4 = rsp.apply_num;
				var memberId = "${r.memberId}";
				var reserveNo = "${r.reserveNo}";
				location.href="/insertPay?memberId="+memberId+"&reserveNo="+reserveNo+"&paymentPrice="+payPrice+"&paymentId="+r1+"&paymentNo="+r4;
			} else {
				alert("결제에러");
			}
		});
		
		
		
	}
</script>
<style>
/*-----------------content-----------------------*/
.content2 {
	/*-지우지마세요-*/
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
}

.cTitle {
	margin-top: 130px;
	padding-top: 30px;
	padding-left: 100px;
	font-size: 50px;
	text-decoration: underline;
	width: 100%;
	height: 150px;
	opacity: 90%;
	color: white;
	background-color: #cd3c41;
}

.cTitle>span {
	font-size: 20px;
	font-weight: bold;
}

.payFrame {
	width: 85%;
	margin: 0 auto;
	overflow: hidden;
	margin-top: 80px;
	padding-bottom: 20px;
	border-top: 2px solid #333333;
	border-bottom: 2px solid #333333;
}

.payFrame>div {
	float: left;
	width: 50%;
	padding: 30px;
}

.infoTitle {
	font-size: 32px;
	margin-bottom: 10px;
}

.infoTitle>small {
	margin-left: 10px;
	font-size: 13px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

td {
	text-indent: 10px;
	font-size: 17px;
	height: 60px;
	width: 50%;
}

.reserveTable tr {
	border-bottom: 1px solid lightgray;
}

.reserveTable tr>td:last-of-type {
	text-align: right;
	padding-right: 40px;
}

table tr:first-of-type {
	border-top: 1px solid #333333;
}

tr>td:first-of-type {
	font-size: 20px;
	width: 30%;
}

td>span {
	display: inline-block;
	width: 90%;
	border-right: 1px solid gray;
}

.priceTable tr>td:last-of-type {
	text-align: right;
	padding-right: 60px;
}

.priceTable tr:nth-of-type(2)>td {
	font-size: 18px;
	color: #ee1c24;
	border-bottom: 3px solid #333333;
}

.priceTable td {
	height: 55px;
}

#dc {
	display: inline;
	color: #ee1c24;
	text-decoration: line-through;
	font-size: 16px;
	border-right: none;
}

.reserveInfo {
	width: 50%;
}

.payBottom {
	height: 200px;
}

.payBottom>div {
	float: left;
	width: 50%;
	height: 100px;
}

.agreement {
	margin-top: 20px;
	padding-left: 100px;
	position: relative;
}

.agreement>span {
	font-weight: bold;
}

#payBtn {
	/*        결제하기 버튼*/
	margin-top: 30px;
	margin-left: 130px;
	margin-bottom: 200px;
	width: 300px;
	height: 80px;
	border: none;
	background-color: #333333;
	color: white;
	font-size: 19px;
}

#payBtn:hover {
	background-color: #cd3c41;
}

.viewAgreement {
	position: absolute;
	top: 23px;
	right: 80px;
}

.viewAgreement>a {
	font-size: 13px;
	text-decoration: underline;
	color: dodgerblue;
}
</style>

</html>