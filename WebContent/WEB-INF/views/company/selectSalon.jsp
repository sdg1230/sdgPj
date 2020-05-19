<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<title>Insert title here</title>

<script
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lrmrvaqbsc&submodules=geocoder"></script>


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
.content1 {
	overflow: hidden;
	margin: 130px auto;
	margin-bottom: 0;
	height: 100%;
	background-color: white;
	text-align: center;
}
 .sidemenu1 {
 display: inline-block;
            width: 49.8%;
            height: 120px;
            background-color: #2a2829;
            border: 1px solid #999999;
            text-align: center;
            display: inline-block;
            line-height:120px;
        }
        .sidemenu1:hover{
        	background-color: red;
        }
        .sidemenu2:hover{
        	background-color: red;
        }
         .sidemenu2 {
         display: inline-block;
             width: 50%;
            height: 122px;
            background-color: #2a2829;
            border: 1px solid #999999;
            text-align: center;
            padding-top: 25px;
           float:left;
        }
        .sidemenu2>*{
            color: white;
            font-size: 1.2em;
            opacity: 70%;
            margin-bottom:4px;
            }       
 .sidemenu1>*{
            color: white;
            font-size: 1.2em;
            opacity: 70%;
            margin-bottom:4px;
            }     
            .map{
            margin: 0 auto;
            padding: 0;
            width: 49%;
            overflow:hidden;
            display: inline-block;
            float: left;
            
        }
        #pageNavi{
        text-align: center;
        width:100%;
        margin: 0 auto;
        }
        .selectPage{
	text-align: center;
	display: inline-block;
}
.btn{
	
	display: inline-block;
	border: 1px solid black;
	width: 50px;
	height: 50px;
	line-height: 50px;
}
        .salon1{
        
            width: 50%;
            height: 500px;
            float: right;
        }
         .salon2{
       		
            width: 50%;
            height: 100%;
            float: right;
        }
        
        
        table{
       border-collapse: collapse;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        
        .hh{
        display: inline-block;
        height: 100px;
        }
        .affimg{
        	width: 250px;
        	height: 300px;
       
        }
        .djimg{
        	width: 250px;
        	padding: 0;
        	margin: 0;
        }
        .tdrhd{
        	display: block;
        	border: 1px solid white;
        }
        .statd {
	overflow: hidden;
	width: 200px;
	text-align: center;
	
	
}
.sta {
	width: 20px;
	height: 20px;
}
.djin{
width: 200px;
	height: 100px;
	
}
.djin1{

width: 100%;
	height: 15px;
	 background-color: darkgray;
	 font-size: 1.5em;
}
.djin2{
width: 100%;
	height: 50px;
	 background-color:#998778 ;
	  font-size: 1.2em;
}
.comm{
	width: 100%;
	border: 1px solid black;
	border-top-left-radius: 20px;
	border-top-right-radius:  20px;
	border-bottom-left-radius: 20px;
	border-bottom-right-radius: 20px;
	background-color: white;
	}
.comm1{
	text-align:center;
	display: block;
	float: left;
	height: 120px;
	padding-top:20px;
	width: 75%;
	overflow: hidden;
}
.dj{
	margin: 0 auto;
}
.re{
text-align: center;
}
.salonth{
	width: 25%;
}
.tit{
	
	height: 150px;
	line-height: 150px;
	
}
.tit>h1{

	font-size: 3em;
}
.content {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
	background-color: white;
	text-align: center;
}
</style>


</head>

<body>



	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		
			
			<div class="content1">
			<div class="tit">
			
			<h1>${salon.salonName }</h1>
			<br>
			</div>
			<br>
			</div>
			<div class="content">
			<input type="hidden" id="salonName" value="${salon.salonName }">
				<input type="hidden" id="salonAddr" value="${salon.salonAddr }">
				<div>

			
				<div class="map">
					<div id="map" style="width: 100%; height: 500px;"></div>
				</div>
				<div class="salon1">
					<table class="salonTable">
							
							
						<tr>
							<th class="salonth">주소</th>
							<th colspan="2">${salon.salonAddr }</th>
						</tr>
						<tr>
							<th class="salonth">연락처</th>
							<td  colspan="2">${salon.salonPhone }</td>
							
						</tr>
						<tr>
							<th class="salonth">영업시간</th>
							<td  colspan="2">09:00 ~ 18:00</td>
						</tr>
						<tr>
						<th class="salonth">매장소개</th>
						<td  colspan="2">${salon.salonInfo }</td>
						</tr>
						
						<tr>
						<tr>
							<th class="salonth">평점</th>
                            <td  class="statd">
                            <c:if
									test="${empty star.reviewStars }">
									


									<img class="sta" src="/upload/salon/star1.jpg">
								</c:if> <c:if test="${star.reviewStars == 1}">
									<img class="sta" src="/upload/salon/star2.jpg">


								</c:if> <c:if
										test="${star.reviewStars < 2 && star.reviewStars >1}">

										<img class="sta" src="/upload/salon/star2.jpg">
										<img class="sta" src="/upload/salon/star1.jpg">

									</c:if> <c:if test="${star.reviewStar == 2}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
								
								</c:if> <c:if
									test="${star.reviewStars < 3 && star.reviewStars >2}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
									
								</c:if> <c:if test="${star.reviewStars == 3}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
								</c:if> <c:if
									test="${star.reviewStars < 4 && star.reviewStars >3}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
						
								</c:if> <c:if test="${star.reviewStars == 4}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									

								</c:if> <c:if
									test="${star.reviewStars < 5 && star.reviewStars >4}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star1.jpg">
								
								</c:if> <c:if test="${star.reviewStars == 5}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
								</c:if>
                            </td>
                            <c:if
									test="${not empty star.reviewStars }">
                            <td >${star.reviewStars }점</td>
                            </c:if>
                            <c:if
									test="${empty star.reviewStars }">
                            <td >0점</td>
                            </c:if>
						</tr>
						
					</table>
				</div>
				</div>
			<div>
			<c:if test="${sessionScope.member.memberId == 'admin' }">
                <a href="javascript:void(0);" onclick="goToReserveFrm('${sessionScope.member.memberId}');">
                <div class="sidemenu2">
			<img src="/imgs/reserve-icon.png">
			<div>예약관리</div>
		</div>
			</a>
			</c:if>
			<c:if test="${sessionScope.member.memberId != 'admin' }">
                <a href="javascript:void(0);" onclick="goToReserveFrm('${sessionScope.member.memberId}');">
                <div class="sidemenu2">
			<img src="/imgs/reserve-icon.png">
			<div>예약하기</div>
		</div>
			</a>
			</c:if>
			<a class="sidemenu1"href="/branchList?reqPage=1">
                <div>◀목록으로</div></a>
            </div>
            
			<div class="dj">
				<div class="map">
					<table>
					<tr>
							<td class="djin" colspan="2"><h1>디자이너</h1></td>
							
							

							
						</tr>
					<c:forEach var="d" items="${des }">
						<tr>
							
							<td colspan="1" rowspan="2" class="djimg"><img class="affimg"
								src="/upload/designer/${d.designerFilepath }">
								<br>
								</td>
								<td class="djin1">
								${d.designerName }
								</td>
								<td>
								</td>
								</tr>
								<tr>
								
							

							<td class="djin2" rowspan="1">${d.designerInfo }</td>
						</tr>
						
						</c:forEach>
					</table>
				</div>
				<h1 class="hh">머리안헤어 후기글</h1>
				<div class="salon2">
					
					<c:forEach var="star" items="${rev }">
					<div class="comm">
						<div class="comm1">${star.reviewComment }</div>
						<div><c:if test="${star.reviewStar == 1}">
									<img class="sta" src="/upload/salon/star2.jpg">


								</c:if> <c:if
									test="${star.reviewStar == 2}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
								</c:if> 
								<c:if
									test="${star.reviewStar == 3 }">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
								</c:if> 
								<c:if test="${star.reviewStar == 4}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
									
								</c:if> 
								<c:if test="${star.reviewStar == 5}">

									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									<img class="sta" src="/upload/salon/star2.jpg">
									
								</c:if>
								<br>
								${star.reviewStar }점
																<br>
								${star.reviewWriter }점
																<br>
								${star.reviewDate }
																<br>
								</div>
								
					</div>
							
						
						<br>
						
						</c:forEach>
					
					<div id="pageNavi">${pageNavi }</div>
				</div>
					
			</div>

	
		
</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	
	</div>
	<script>
		var xx;
		var yy;
		var addr;
	    var name;
		
        var latitude;
        var longitude;
        window.onload=function(){
            navigator.geolocation.getCurrentPosition(showLocation);
        }
        function showLocation(position){
             latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        }
    function latlong(){
       
        console.log(latitude);
        console.log(longitude);
    }
    
   function goToReserveFrm(memberId){
	   if(memberId==""){
		   	alert("로그인이 필요합니다");
			location.href="/loginFrm";
		}else{
			if(memberId=="admin"){
				location.href="/adminReserveList";
			}else{
				location.href="/reserveFrm";
			}
		}
   }
        
        
		$(function(){
			
			addr = $("#salonAddr").val();
			name = $("#salonName").val();
			console.log(addr);
		
		console.log(addr+"dd");
		
		
		naver.maps.Service.geocode({
			address : addr
		}, function(status, response) {
			console.log(addr);
			if (status !== naver.maps.Service.Status.OK) {
				return alert('Something wrong!');
			}
			console.log(addr);
			var result = response.result, // 검색 결과의 컨테이너
			items = result.items;
			console.log(items);
			add = items[1].point;
			xx = add.x;
			yy = add.y;
			console.log(xx);
			console.log(xx);
			console.log(yy);
			var map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(yy, xx),

				zoom : 17,
				zoomControl : true,
				zoomControlOptions : {
					position : naver.maps.Position.TOP_RIGHT,
					style : naver.maps.ZoomControlStyle.SMALL
				}
			});

			var marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(yy, xx),
				map : map
			});
			var contentString = [ "<div class='iw_inner'>",
					" <h3>"+name+"</h3>", " <p>"+addr+"</p>",
					"</div>" ].join("");
			var infoWindow = new naver.maps.InfoWindow({content : contentString});
			infoWindow.open(map, marker);
			
			
		});
		
		});
		
		
	</script>
</body>

</html>