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
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lrmrvaqbsc&submodules=geocoder"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<script>
window.onload=function(){
	   var map = new naver.maps.Map('map',{
	      center: new naver.maps.LatLng(37.533807,126.896772),
	      zoom : 17,
	      zoomControl : true,
	      zoomControlOptions:{
	         position : naver.maps.Position.TOP_RIGHT,
	         style: naver.maps.ZoomControlStyle.SMALL
	      }
	   });
	   var marker = new naver.maps.Marker({
	      position : new naver.maps.LatLng(37.533807,126.896772),
	      map : map
	   });
	   //최초 중심지의 주소
	   var contentString = [
	      "<div class='iw_inner'>",
	      " <h3>KH정보 교육원</h3>",
	      " <p>서울시 영등포구 선유로2동 57 이레빌딩 19F</p>",
	      "</div>"
	   ].join("");
	   var infoWindow = new naver.maps.InfoWindow();
	   naver.maps.Event.addListener(marker,"click",function(e){
	      if(infoWindow.getMap()){
	         infoWindow.close();
	      }else{
	         infoWindow = new naver.maps.InfoWindow({
	            content : contentString
	         });
	         infoWindow.open(map,marker);
	      }
	   });
	   naver.maps.Event.addListener(map,"click",function(e){
	      marker.setPosition(e.coord);//마크이동 가능 
	      if(infoWindow != null){
	         if(infoWindow.getMap()){
	            infoWindow.close();//주소창 같이 사라지게 함
	         }
	         
	      }
	      naver.maps.Service.reverseGeocode({
	         location : new naver.maps.LatLng(e.coord.lat(),e.coord.lng()),
	      },
	      function(status,response){
	         if(status !== naver.maps.Service.Status.OK){
	            return alert("못찾음");
	         }
	         var result = response.result;
	         
	         items = result.items;//주소값 담겨잇음
	         alert(items[0].address);
	         address = items[0].address;
	         contentString=[//주소값 출력
	            "<div class='iw_inner'>",
	            "  <p>"+address+"</p>",
	            "</div>"
	         ].join("");
	         
	         
	      }
	      
	      );
	   });
}
</script>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content">
		
            <div>
                <div>
                <div id = "map" style="width:100%;height:500px;">	
		</div>
                </div>
                <div></div>
            </div>
            <div>
                <div></div>
                <div></div>
            </div>
        
		</div>
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		
	</div>
</body>
</html>