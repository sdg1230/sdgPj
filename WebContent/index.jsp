<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <title>머리좀 헤어</title>
</head>

<body>
    <div class="wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <!-- 		캐러셀 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">
        <div class="content2">
            <div class="container">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                        <li data-target="#myCarousel" data-slide-to="3"></li>
                        <li data-target="#myCarousel" data-slide-to="4"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="#"><img src="/imgs/v3.png" alt="New york" style="height: 100%; width: 100%;"> </a>
                        </div>

                        <div class="item">
                            <a href="#"><img src="/imgs/v2.png" alt="Chicago" style="height: 100%; width: 100%;"> </a>
                        </div>

                        <div class="item">
                            <a href="#"><img src="/imgs/v4.png" alt="New york" style="height: 100%; width: 100%;"> </a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="/imgs/v5.png" alt="New york" style="height: 100%; width: 100%;"> </a>
                        </div>
                        <div class="item">
                            <a href="#"><img src="/imgs/v6.png" alt="New york" style="height: 100%; width: 100%;"> </a>
                        </div>
                    </div>

                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"></span> <span class="sr-only">Previous</span>
                    </a> <a class="right carousel-control" href="#myCarousel" data-slide="next"> <span class="glyphicon glyphicon-chevron-right"></span> <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="ad"></div>
        </div>
        <div class="content">
        	<h1 class="meorijom"># Best Salon<small>실시간 별점순 지점을 확인하세요</small></h1>
            <div class="sortByStar"></div>
            <h1 class="meorijom"># Notice<small>공지사항을 확인하세요</small></h1>
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </div>

</body>
<script>
    //부트스트립에만
    $("a").click(function() {
        $(this).css("text-decoration", "none").css("color", "");
    });

    $(function(){
    	$.ajax({
    		url : "/selectBestSalon",
    		type : "get",
    		success : function(data) {
    			 var html="";
   			  for(var i=0; i<data.length;i++){
   				  html += "<a href='/selectSalon?salonName="+data[i].salonName+"'><div class='sBox'>"
   				  html += "<img src='upload/salon/"+data[i].salonFilepath+"'>"
   				  html += "<div class='rank meorijom'>"+(i+1)+".</div>"
   				  html += "<div class='info'>"
   				  html += "<span class='salonName'>"+data[i].salonName+"</span><br>";
   				  html += "<span class='salonStar meorijom'>"+data[i].reviewStarAvg+"/5점</span><br>"
   				  html +=" <small>클릭하시면 매장 상세 정보를 보실 수 있습니다</small></div></div></a>"
   			  }
   			  
   			  $(".sortByStar").append(html);
    		}
    	});		 
    });
</script>
<style>
    h1{
      opacity:90%;
        font-size: 30px;
    }
    h1>small{
        font-size: 15px;
    }
    .sortByStar{
    width:100%;
    overflow:hidden;
    }
    .sBox{
   		 opacity:85%;
        width:400px;
        float: left;
        padding-top: 10px;
        padding-bottom: 30px;
        height:400px;
    }
    .sBox:hover{
    	opacity:100%;
    }
    .sBox>img{
        width: 100%;
        height: 250px;
    }
    .sBox>div{
        float: left;
    }
    .salonName{
        font-size: 30px;
        font-weight: bold;
        display: inline-block;
        height: 40px;
        border-bottom: 10px solid lightgray;
        
    }
    .salonStar{
        font-size: 23px;
        color: #cd3c41;
    }
    
    .rank{
        vertical-align: top;
        width: 30%;
        height: 110px;
        line-height: 100px;
        font-size: 110px;
        color: #ee1c24;
    }
    .info{
        width:70%;
        text-align: right;
    }
    .info>small{
        color: dodgerblue;
        text-decoration: underline;
        
    }
    
    /* 캐러셀 */
    .content2 {
        width: 100%;
        overflow: hidden;
        margin: 0 auto;
        margin-top:130px;
        text-align: center;
    }
    .content{
        width: 1200px;
        overflow: hidden;
        margin: 0 auto;
    }
    .container {
        width: 100%;
        overflow:hidden;
        padding: 0;
    }

    .carousel-inner>div {
        text-align: center;
    }



    .carousel-control.left {
        background-image: none;
    }

    .carousel-control.right {
        background-image: none;
    }

    .active>a {
        cursor: default;
    }

    /* 부트스트랩 */
    a {
        color: black;
    }

    a:hover {
        text-decoration: none;
        color: black;
    }

    .homeIcon>img {
        vertical-align: -2px;
    }

    .headermiddle * {
        height: 24px;
    }

</style>

</html>
