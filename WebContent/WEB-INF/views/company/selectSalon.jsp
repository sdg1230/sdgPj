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
.content1 {
	width: 1200px;
	overflow: hidden;
	margin: 0 auto;
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
        .salon1{
            width: 50%;
            height: 500px;
            float: right;
        }
        table{
            width: 100%;
            height: 100%;
        }
        .addrtit{
            border: 1px solid white;
        }  
        .hh{
        display: inline-block;
        }
        .affimg{
        	width: 250px;
        	height: 250px;
        	
        }
        .statd {
	overflow: hidden;
	width: 120px;
	text-align: center;
	width: 120px;
}
.sta {
	width: 20px;
	height: 20px;
}
</style>


</head>

<body>



	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content">
			
			<div class="content1">
			<h1>${salon.salonName }</h1>
			<input type="hidden" id="salonName" value="${salon.salonName }">
				<input type="hidden" id="salonAddr" value="${salon.salonAddr }">
				<div>

			
				<div class="map">
					<div id="map" style="width: 100%; height: 500px;"></div>
				</div>
				<div class="salon1">
					<table border="1">
						<tr>
							<th class="addrtit">주소</th>
						</tr>
						<tr>
							<th colspan="3">${salon.salonAddr }</th>
						</tr>
						<tr>
							<th>연락처</th>
							<td  colspan="2">${salon.salonPhone }</td>
							
						</tr>
						<tr>
							<th>영업시간</th>
							<td  colspan="2">09:00 ~ 18:00</td>
						</tr>
						<tr>
						<th>매장소개</th>
						<td  colspan="2">${salon.salonInfo }</td>
						</tr>
						<tr>
							<th>평점</th>
                            <td  class="statd">
                            <c:if
									test="${star.reviewStars < 1 }">
									


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
                            <td>${star.reviewStars }점</td>
						</tr>
					</table>
				</div>
				</div>
			<div>
                <a href="/reserveFrm">
                <div class="sidemenu2">
			<img src="/imgs/reserve-icon.png">
			<div>예약하기</div>
		</div>
			</a>
			<a class="sidemenu1"href="/branchList?reqPage=1">
                <div>◀목록으로</div></a>
            </div>
            
			<div class="content1">
				<div class="map">
					<table>
					<tr>
							<td colspan="2">디자이너</td>
							
							

							<td>전문</td>
						</tr>
					<c:forEach var="d" items="${des }">
						<tr>
							
							<td colspan="2" rowspan="2"><img class="affimg"
								src="/upload/designer/${d.designerFilepath }">
								</td>
								<td>
								<br>${d.designerName }
								</td>
								</tr>
								<tr>
								
							

							<td>${d.designerInfo }</td>
						</tr>
						
						</c:forEach>
					</table>
				</div>
				<h1 class="hh">머리안헤어 후기글</h1>
				<div class="salon1">
					<table>
					<c:forEach var="star" items="${rev }">
						<tr>
							<td colspan="2" rowspan="5">${star.reviewComment }</td>
							
						</tr>
						<tr>
						<td>
							<c:if test="${star.reviewStar == 1}">
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
							</td>
							
							
						</tr>
						<tr>
							<td>${star.reviewStar }점</td>
						</tr>
						<tr>
							<th>${star.reviewWriter }</th>
							
						</tr>
						<tr>
							
						<td>${star.reviewDate }</td>
							
						</tr>
						</c:forEach>
					</table>
					<div id="pageNavi">${pageNavi }</div>
				</div>
					
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