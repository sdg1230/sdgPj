<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
/* 헤더 제대로적용------------------------ */
.headermiddle input[type="text"] {
	height: 25px;
	margin-bottom:10px;
	padding:0;
}
.homeIcon>img {
	margin-top:5px;
}
.headermiddle{
	padding-top:4px;
}
/* 헤더 제대로적용------------------------ */
	.div1{
            display: block;
            border: 3px solid white;
            border-top-color: red;
            text-align: center;
        }
        .title{
            font-size: 1.5em;
            text-align: center;
        }
        .photograph{
            text-align: center;
        }
        .content1{
            text-align: center;
        }
        .spanTitle{
            font-size: 1.5em;
            
        }
        .div2{
           margin: 0 auto;
            height: 150px;
            width: 80%;
            text-align: center;
            
        }
        .img{
            color: white;
            line-height: 40px;
            float: left;
            display: block;
            border: 1px solid white;
            text-align: center;
            width: 50%;
            height: 150px;
            background-image: url(../imgs/%EB%A8%B8%EB%A6%AC.PNG);
            
            background-size: 100%;
        }
        .img>div{
             color: white;
        }
        .img>h3{
            color: white;
        }
        .titleBox{
            margin: 0 auto;
            text-align: center;
            font-size: 2em;
            display: block;
            border: 1px solid red;
            line-height: 65px;
            width: 70px;
            height: 70px;
            background-color: red;
            color: white;
            border-top-left-radius: 40px;
            border-top-right-radius: 40px;
            border-bottom-left-radius: 40px;
            border-bottom-right-radius: 40px;
            
        }
        .img2{
            
            color: white;
            line-height: 40px;
            float: left;
            display: block;
            border: 1px solid white;
            text-align: center;
            width: 50%;
            height: 150px;
            background-image: url(../imgs/%EB%A8%B8%EB%A6%AC.PNG);
            padding-top: 10px;
            background-size: 100%;
        }
        .img2>div{
            float: left;
             color: white;
            text-align: center;
            width: 50%;
             height: 150px;
        }
        .img>h3{
            color: white;
        }
        
         .img2>.ranking1{
            float: left;
             color: white;
            line-height: 150px;
            width: 50%;
             height: 150px;
             font-size: 5em;
             
        }
        .img2>.titleone{
            background-color: white;
            float: left;
             color: red;
            width: 70px;
            display: block;
            border: 1px solid red;
            height: 70px;
            padding-top: 15px;
            line-height: 20px;
            border-top-left-radius: 50px;
            border-top-right-radius: 50px;
            border-bottom-left-radius: 50px;
            border-bottom-right-radius: 50px;
        }
        .img2>.ranking2{
            padding-left: 10px;
            float: left;
             color: white;
            line-height: 150px;
            width: 20%;
             height: 150px;
             font-size: 5em;
        }
        small{
            font-size: 0.5em;
            color: white;
        }
        .spanTitle2{
            color: red;
            font-size: 2em;
            text-decoration: underline;
        }
        pre>small{
            color: red;
            font-size: 1.2em;
        }
</style>
</head>
<body>
	<div class="wrapper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content">
			    
        <div class="div1"><h1>브랜드 이야기</h1></div>
        <div class="title"><h1>MEORIJOM HAIR</h1></div>
        <div class="content1"><span class="spanTitle">MEORIJOM HAIR는 다른 미용 프렌차이즈 기업들과 달리 직영</span>
        <pre>시스템으로 운영되는 5개의 매장과 140명의 직원이 함꼐하는 30여 년의 역사를 가집 미용기업 입니다.
        2005년 글로벌 브랜드 웰라가 선정한 세계 10대 헤어 브랜드에서 일본의 아르테 재팬에 이어 세계 2위를 차지 하였으며,
        2006년 강남에 최고급 살롱 애브뉴 준오를 오픈하면서 많은 언론으로부터 규모와 시설이 해외 유명 살롱과 견주어 손색이 
        없다는 호평을 받았습니다.
        지난 2007년 스페인 바르셀로나에서 개최된 인터내셔널 트렌드 비전 어워드에서는 대회 최고 영예인 골드 트로피를 수상하며 대한민국 
        브랜드로 세계적인 명성을 얻어 가고 있습니다.</pre></div>
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <div>
        <div class="div1"><h1>직영 시스템</h1></div>
            <div class="content1"><span class="spanTitle">프리미엄 뷰티 서비스를 어느 살롱에서나</span>
            <pre>
            MEORIJOM HAIR는 직영 시스템에 준하여 살롱을 운영하고 있습니다.
            MEORIJOM HAIR만의 뷰티 서비스 퀄리티를 유지하는 비결입니다.
            어느 살롱에서나 MEORIJOM HAIR만의 탁월한 서비스를 경험하실 수 있습니다.</pre></div>
        <div class="div2">
            <div class="img">
                <div>4Salons</div>
                <div>
                토탈뷰티살롱</div>
                <h3>MEORIJOM HAIR</h3>
            </div>
            <div class="img"><div>1Salons</div>
                <div>
                프리미엄 헤어살롱</div>
                <h3>MEORIJOM HAIR</h3></div>
        </div>
            </div>
        <div class="div1"><h1>해외 진출</h1></div>
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <div class="content1"><span class="spanTitle">뷰티 교육 콘텐츠 선두 주자</span>
        <pre>MEORIJOM HAIR의 뷰티 교육 콘텐츠는 국내 최초로 해외에 수출되었고,
    한국의 미용을 배우고자 MEORIJOM HAIR를 찾는 해외 미용사들이 
       많이 급증하는 추세입니다.</pre></div>
        <div>
        <div class="div1"><h1>준오만의 경쟁력</h1></div>
        <div class="titleBox">01</div>
            <br>
        <div class="content1"><span class="spanTitle">헤어&뷰티 업계의 기준점 MEORIJOM HAIR</span>
            <pre>
        언제나 새로운 스타일을 연구/제한하고,가장 트렌디한 이미지를 제시합니다. 
            체계적으로 프리미엄 뷰티 서비스를 제공하는 MEORLJOM HAIR다움으로 한국산업의 브랜드파워 3년 연속 1위~!</pre></div>
        <div class="div2">
            <div class="img2">
                <div class="ranking1">1<small>위</small></div>
                <div>
                2016년<br>
                한국산업의 브랜드파워<br>
                헤어&뷰티브랜드샵 부분</div>
                
            </div>
            <div class="img2"><div class="ranking2">1<small>위</small></div>
                <div>
                
                2018년(2016~2018)<br>
                한국산업의 브랜드파워<br>
                헤어&뷰티브랜드샵 부분
                
                    </div>
                <div class="titleone">3년<br>
                연속</div></div>
        </div>
        <br>
            </div>
        <div class="titleBox">02</div>
            <br>
        <div class="content1"><span class="spanTitle">최고의 아름다움을 리드하는 준오의 전문성 MEORIJOM HAIR Expertise</span>
            <pre>
        MEORIJOM HAIR는 세계적인 코스메틱 브랜드 Wella가 선정한 세계10대 헤어 브랜드입니다.
        다양한 수상 경력에 빛나는 MEORIJOM HAIR는 국내 최초로 세계최고 원위의 International Wella Trend Vision Award 우승자를
        배출하며 가장 신뢰 받는 브랜드로 성장하였습니다.
        2002년 얼터너티브 헤어쇼 국내 최초 참가
        2007년 인터내셔널 트렌드 비전 어워드 골드 트로피 수상
        2009년 세바스찬 블랙 브라이드 1,2,3위 수상
        2007~2013년 트렌드 비전 어워드 코리아 1위 7회 연속 수상</pre></div>
       
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <div>
        <div class="titleBox">03</div>
        
        <div class="content1"><span class="spanTitle">트렌드를 선도하는 MEORIJOM HAIR의 창의성 Creativity</span>
            <pre>
            MEORIJOM HAIR는 매해,5월과 11월 시즌 트렌드를 선보이는 헤어쇼를 개최합니다.
            20년 이상 이어오고 있는 MEORIJOM HAIR 헤어쇼는 그해의 S/S와 F/W 헤어트렌드를 발표하는 자리로 
        전반적인 패션,뷰티를 아우르는 앞선 트렌드를 선보이며 큰 호응을 얻고 있습니다.</pre></div>
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        </div>
        <div class="titleBox">04</div>
        <div class="content1"><span class="spanTitle">상상을 초월하는 로열티의 열정적인 MEORIJOM HAIR Man</span>
            <pre>
        MEORIJOM HAIR의 아낌 없는 직원 교육과 적절한 보상제도
        MEORIJOM HAIR의 평균 이직률 10%
        <span class="spanTitle2">10</span><small>년 이상 근속 직원은</small> <span class="spanTitle2">250명</span><small>을 넘어서고 있습니다.</small></pre></div>
        
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <br>
        <div class="titleBox">05</div>
        <br>
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <div class="content1"><pre>고객을 가족처럼 대하는 진심 어린 서비스로 
    고객님의 마음에 세 걸음 다가가 고객 감동을 이어갑니다.</pre></div>
        
        <div class="photograph"><img src="../imgs/%EB%A8%B8%EB%A6%AC.PNG"></div>
        <div class="content1"><span class="spanTitel">항상 즐겁고 친근한  MEORIJOM HAIR Service</span>
        <pre>
        MEORIJOM HAIR는 매뉴얼화 된 서비스가 없습니다.
        MEORIJOM HAIR 3 Step만이 유일한 서비스 매뉴얼입니다.</pre></div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
		
	</div>
</body>
</html>