<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="css/color.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Bangers|Noto+Sans+KR&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Anton&display=swap" rel="stylesheet">

    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
            color: #333333;
        }

        .wrapper {
            overflow: hidden;
            z-index: 1;
            position: relative;
        }

        html {
            scroll-behavior: smooth;
        }

        div {
            box-sizing: border-box;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        body {
            margin: 0;
        }

        a {
            text-decoration: none;
            color: black;
        }

        /*-----------------header----------------------*/
        .header {
            width: 100%;
            height: 130px;
            overflow: hidden;
            z-index: 1000;
            min-width: 820px;
            position: fixed;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

        .header>div {
            float: left;
        }

        .header1 {
            background-color: #2a2829;
            font-size: 50px;
            width: 33%;
            height: 40px;
            padding-left: 100px;
        }

        .header1>a>span {
            display: inline-block;
            vertical-align: 20px;
            height: 40px;
            line-height: 35px;
            font-size: 30px;
            color: white;
        }



        .headermiddle {
            background-color: #2a2829;
            width: 34%;
            height: 40px;
            text-align: center;
            line-height: 37px;
        }

        #search {
            display: none;
        }

        label[for="search"]>img {
            width: 20px;
            height: 20px;
            opacity: 80%;
            vertical-align: -5px;
        }

        label[for="search"]>img:hover {
            cursor: pointer;
        }

        .headermiddle input[type="text"] {
            font-size: 14px;
            width: 280px;
            border: none;
            background: none;
            border-bottom: 2px solid #CD3C41;
            color: white;
        }

        .header2 {
            background-color: #2a2829;
            padding-top: 10px;
            padding-right: 50px;
            width: 33%;
            height: 40px;
        }

        .header2 li {
            float: right;
            /* margin-right: 40px; */
            font-size: 14px;
            text-align: center;
        }

        .header2 li:first-of-type>a {
            border: none;
        }

        .header2 li>a {
            border-right: 1px solid lightgrey;
            color: white;
            opacity: 70%;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            width: 100px;
        }

        .header2 li>a:hover {
            opacity: 90%;
        }

        .header3 {
            border-top: 1px solid lightgray;
            background-color: white;
            padding-left: 100px;
            width: 100%;
            text-align: center;
            min-width: 1280px;
            height: 90px;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            transition: all 0.3s;
        }

        .header3 a {
            font-size: 18px;
        }

        .hNavi {
            height: 90px;
        }

        .hNavi>* {
            float: left;
            margin-right: 80px;
            font-size: 14px;
            line-height: 90px;
        }

        .hNavi>span {
            margin-right: 150px;
        }

        .hNavi>li {}

        .hNavi>li:hover>a {
            opacity: 70%;
            /*
            display: inline-block;
            height: 46px;
            border-bottom: 4px solid #ffcb05;
*/
        }

        .meorijom {
            font-family: 'Anton', sans-serif;
            font-size: 38px;
        }

        .meorijom:hover {
            cursor: pointer;
        }


        /*-----------------content-----------------------*/
        
        .content {
            /*-지우지마세요-*/
            width: 1200px;
            overflow: hidden;
            margin: 130px auto 0 auto;
            height: 1200px;
            background-color: antiquewhite
        }
        #img1{
           
            width: 100%;
            height: 300px;
        }
        

        /*----------------------------------------*/
        .footer {
            width: 100%;
            height: 330px;
            font-size: 12px;
            border: 1px solid #e5e5e5;
            background-color: #f5f5f5;

        }

        .fImage {
            height: 80px;
            width: 100%;
            text-align: center;
            background-color: white;
        }

        .fImage>img {
            height: 75px;
        }

        .fInfo {
            width: 1200px;
            height: 250px;
            margin: 0 auto;
            opacity: 70%;
        }

        .fInfo>div {
            float: left;
            margin: 30px 20px;
            width: calc(1078px/3);
            height: 190px;
            text-align: center;
            padding-top: 25px;
        }
        .fInfo>div:nth-of-type(2){
            border-left: 1px solid lightgrey;
            border-right: 1px solid lightgrey;
            font-size: 15px;
        }
        .fInfo>div>span {
            font-size: 30px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .fInfo>div{
            font-size: 14px;
        }


        /*-------------------sidebar----------------------*/
        .sidebar {
            position: fixed;
            top: 130px;
            right: 0;
            width: 120px;
            z-index: 1000;
            -webkit-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4;
        }

        .sideicon {
            position: absolute;
            right: 120px;
            top: 200px;
            cursor: pointer;
        }

        .sidebar>a {
            position: relative;
        }

        .sidebar>a>img {
            width: 100%;
            border: 1px solid grey;
            margin-bottom: 15px;
        }

        .sidebar>button {
            width: 100%;
            height: 30px;
        }

        .sidemenu {
            width: 120px;
            height: 120px;
            background-color: #2a2829;
            border: 1px solid #999999;
            text-align: center;
            padding-top: 25px;
            font-size: 14px;
        }

        .sidemenu>* {
            color: white;
            opacity: 70%;
        }

        .sidemenu:hover>* {
            opacity: 100%;
        }
    </style>
    <script>
        //사이드바
        function up() {
            window.scrollTo(0, 0);
        }
        $(function() {
            //사이드 아이콘 클릭
            $(".sideicon").click(function() {
                if (($(this).parent().css("right")) == "0px") {
                    $(this).parent().css("right", "-120px");
                    $(this).children().attr("src", "../WebContent/imgs/sideicon2.png");
                } else {
                    $(this).parent().css("right", "0");
                    $(this).children().attr("src", "../WebContent/imgs/sideicon.png");
                }

            });

            //헤더 움직이기...
            $(window).scroll(function() {
                var height = 0;
                height = $(window).scrollTop();
                if (height >= 59) {
                    $(".header3").css("height", "60px").css("opacity", "89%").css("border-bottom", "1px solid #999999");
                    $(".hNavi>*").animate({
                        lineHeight: "60px"
                    }, 10);
                    $(".header").css("height", "100px");
                } else {
                     $(".hNavi>*").animate({
                        lineHeight: "90px"
                    }, 10);
                    $(".header3").css("height", "90px").css("opacity", "100%").css("border-bottom", "");
                   
                    $(".header").css("height", "130px");
                }
            });
            $(".meorijom").click(function() {
                location.href = "#";
            });
        });
    </script>
</head>

<body>

    <div class="wrapper">
        <div class="sidebar">
            <span class="sideicon"><img src="../WebContent/imgs/sideicon.png"></span>
            <a href="#">
                <div class="sidemenu"><img src="../WebContent/imgs/reserve-icon.png">
                    <div>예약하기</div>
                </div>
            </a>
            <a href="#">
                <div class="sidemenu"><img src="../WebContent/imgs/question-icon.png">
                    <div>1:1문의</div>
                </div>
            </a>
            <a href="#">
                <div class="sidemenu"><img src="../WebContent/imgs/event-icon.png">
                    <div>이벤트</div>
                </div>
            </a>
            <a href="javascript:void(0)" onclick="up();">
                <div class="sidemenu top"><img src="../WebContent/imgs/top-icon.png">
                    <div>TOP</div>
                </div>
            </a>
        </div>
        <div class="header">
            <div class="header1"><a href="main.html"><span class="homeIcon"><img src="../WebContent/imgs/home-icon.jpg"></span></a></div>
            <div class="headermiddle">
                <form action="/" method="get">
                    <input type="text" placeholder="원하시는 지점을 알아보세요~!" name="keyword"><input type="submit" id="search"><label for="search"><img src="../WebContent/imgs/dotwhite.png"></label></form>
            </div>
            <div class="header2">
                <ul>
                    <li><a href="join.html">회원가입</a></li>
                    <li><a href="login.html">로그인</a></li>
                </ul>
            </div>
            <div class="header3">
                <ul class="hNavi">
                    <span class="meorijom">MEORIJOM HAIR</span>
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">지점소개</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="javascript:void(0)" onclick="alert('준비중입니다.');">아카데미</a></li>
                    <!--                        <li><a href="#" style="color: #f15a22;">레벨테스트</a></li>-->
                </ul>
            </div>
        </div>
        <img src="../../../imgs/backImg1.jpg" id="img1">
        <div class="content">
            <tabel>
                <ul>
                    <li><label></label></li>
                </ul>
            </tabel>
        </div>
        <div class="footer">
            <div class="fImage"><img src="../WebContent/imgs/footerimage.jpg"></div>
            <div class="fInfo">
                <div class="fInfo1">
                    <span class="meorijom">MEORIJOM HAIR</span><br>
                    서울 영등포구 선유동2로 57 이레빌딩 19층<br>
                    Copyright © 2020 MEORIJOMHAIR.COM.<br> All Rights Reserved.
                </div>
                <div class="fInfo2">
                 <span class="meorijom">executive team </span><br>
                    박민수 . 박지현 . 서동건<br>
                    송지훈 . 연예진 . 이호길
                </div>
                <div class="fInfo3">
                    <span class="meorijom">CS center</span><br>1544-9970<br>
                    Mon-Fri 09:00 ~ 18:00<br>
                    Lunch 12:00 ~ 13:00
                </div>
            </div>
       </div>
    </div>
</body></html>
