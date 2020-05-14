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
	height: 100%;
	background-color: white;
	text-align: center;
}
</style>


</head>

<body>



	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content">

			<div>
				<input type="hidden" id="salonName" value="역곡2동 49-13번지">
				<div>
					<div id="map" style="width: 100%; height: 500px;"></div>
				</div>
				<div>
					<table>
						<tr>
							<th>주소</th>
						</tr>
						<tr>
							<th>주소내용</th>
						</tr>
						<tr>
							<th>연락처</th>
							<td></td>
						</tr>
						<tr>
							<th>영업시간</th>
							<td></td>
						</tr>
						<tr>
							<th>매장소개</th>
							<td></td>
						</tr>
						<tr>
							<th>평점</th>
							<td>점
							<td>
						</tr>
					</table>
				</div>

			</div>
			<div>
				<div>
					<table>
						<tr>
							<td>디자이너사진</td>
							<td>디자이너이름</td>
							<td>전문</td>

						</tr>
					</table>
				</div>
				<div>
					<h1>머리안헤어 후기글</h1>
					<table>
						<tr>
							<td>별점</td>
							<td>점</td>
							<th>아이디</th>
						</tr>
						<tr>
							<td>내용</td>
							<td>등록일</td>
							<td></td>
						</tr>
					</table>
					<button id="my">버튼</button>
				</div>
			</div>

		</div>
		

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	</div>
	<script>
		var xx;
		var yy;
		var addr;
	    
		
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
			$("#my").click(function(){
				
				var rad = (x) => {
					   return (x * Math.PI) / 180;
					};
				       var lat1p = parseFloat(yy);
				       var lon1p = parseFloat(37.533807);
				       var lat2p = parseFloat(xx);
				       var lon2p = parseFloat(126.896772);
				      
				       var R = 6371; // km (change this constant to get miles)
				       var dLat = (lat2p-lat1p) * Math.PI / 180;
				       var dLon = (lon2p-lon1p) * Math.PI / 180;
				       console.log(lat1p);
				       console.log(lat2p);
				       console.log(lon1p);
				       console.log(lon2p);
				       var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat1p * Math.PI / 180 ) * Math.cos(lat2p * Math.PI / 180 ) * Math.sin(dLon/2) * Math.sin(dLon/2);
				          
				       var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
				       var d = R * c;
				       console.log(d);
				       
				    	   Math.round(d)+"km";
				    
				       
				    	    Math.round(d*1000)+"m";
				    	    console.log(d);
				      
				       console.log(Math.round(d)+"km");
				       
				
				
			});
			addr = $("#salonName").val();
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
					" <h3>KH정보 교육원</h3>", " <p>"+addr+"</p>",
					"</div>" ].join("");
			var infoWindow = new naver.maps.InfoWindow({content : contentString});
			infoWindow.open(map, marker);
			
			
		});
		
		});
		
		
	</script>
</body>

</html>