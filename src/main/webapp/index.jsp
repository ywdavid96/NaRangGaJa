<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="customer.service.CustomerService"%>
<%@page import="guide.service.GuideService"%>
<%@page import="guiderev.service.GuideRevService"%>
<%@page import="mypage.service.MypageService"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<title>홈 화면</title>
<link rel="stylesheet" href="css/detail.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">
<script type="text/javascript">
   $(document).ready(function () {
    $.datepicker.regional['ko'] = {
        closeText: '닫기',
        prevText: '이전달',
        nextText: '다음달',
        currentText: '오늘',
        monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
        '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
        monthNamesShort: ['1월','2월','3월','4월','5월','6월',
        '7월','8월','9월','10월','11월','12월'],
        dayNames: ['일','월','화','수','목','금','토'],
        dayNamesShort: ['일','월','화','수','목','금','토'],
        dayNamesMin: ['일','월','화','수','목','금','토'],
        weekHeader: 'Wk',
        dateFormat: 'yy-mm-dd',
        firstDay: 0,
        isRTL: false,
        showMonthAfterYear: true,
        yearSuffix: '',      
        buttonText: "달력",
        changeMonth: true,
        changeYear: true,
        showButtonPanel: true,
        yearRange: 'c-99:c+99',
    };
    $.datepicker.setDefaults($.datepicker.regional['ko']);

    $('#sdate').datepicker();
    $('#sdate').datepicker("option", "maxDate", $("#edate").val());
    $('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#edate").datepicker( "option", "minDate", selectedDate );
    });

    $('#edate').datepicker();
    $('#edate').datepicker("option", "minDate", $("#sdate").val());
    $('#edate').datepicker("option", "onClose", function ( selectedDate ) {
        $("#sdate").datepicker( "option", "maxDate", selectedDate );
    });
});
   
   function zzz(){
      alert("로그인 후 이용해 주세요.");   
   }
</script>
<style>
body {
   background: #F2F2F2;
   margin: 0px 150px;
}

#join {
   width: 100px;
   color: 000000;
   border-color: white;
   background-color: white;
   font-size: 1.0em;
}

.sidebar{
   position: fixed;
   top: 250px;
   left: 50px;
   padding: 20px;
   width: 170px;
   font-size: 15px;
   text-align:right;
   background-color:white;
   border-bottom: 0.25rem solid #64a19d;
   border-radius: 0.25rem;
}

.login {
   background: #FFFFFF;
   border: 1px solid;
   height:100px;
   border-color: #CC9966;
   font-size: 15px;
   text-align: right;
   z-index: 1;
}

.news {
   text-align: center;
   font-size: 15px;
   z-index: 1;
   border: 1px solid;
   border-color: #cccccc;
}

.idle {
   width: 75%;
   height: 200px;
   margin: 10px auto;
}

article {
   width: 15.5%;
   height: 100%;
   margin-left: 10px;
   border: solid 1px #cccccc;
   float: left;
}

.Thema {
   width: 24%;
   margin: 0px;
   text-align: center;
}

.clear {
   clear: both;
}

footer {
   padding: 10px;
   padding-right: 50px;
   color: black;
   text-align: right;
   font-size: 12px;
}

ul {
   list-style-type: none;
}

ul li {
   display: inline;
   vertical-align: middle
}

ul li a {
   color: black;
   font-family: 굴림;
   text-decoration: none;
}

.news ul li a {
   color: #848484;
}

input[type="text"] {
   width: 200px;
   height: 40px;
   border-radius: 5px;
   border: 1px solid black;
   text-align: center;
}

input[type="submit"] {
   height: 45px;
   background-color: orange;
   border-radius: 5px;
   border-color: white;
   color: white;
   border: none;
   padding-left: 10px;
   padding-right: 10px;
   margin-left: 5px;
}

.contents{
   margin: auto;
   text-align: center;
   border: 1px solid;
   background-color: #FFCC99;
   border-color: #CC9966;
   width: 75%;
   height: 500px;
}

h1 {
   font-family: 'Hahmlet', serif;
   text-align: center;
   font-size:18px;
   font-weight: lighter;
   color: black;
}

h2 {
   font-family: 'Hahmlet', serif;
   font-size:18px;
   font-weight: lighter;
   color: black;
}

h3 {
   font-family: 'Hahmlet', serif;
   text-align: center;
   font-weight: lighter;
   color: black;
}

a {
   font-family: 'Hahmlet', serif;
   text-align: center;
   font-weight: lighter;
   color: black;
}

.weekbest{
         text-align: center;
         font-size: 20px;
         margin-top: 50px;
         line-height: 20px;
      }
      
.best{
         color: #CC9966;
      }
.best1{
         font-size: 12px;
         font-family: '돋움';
      }
.qna{
   width: 100%;
   height: 100%;
   border: none;
   background-color: #FFCC99;
   float: left;
   margin-bottom: 10px;
}

select {
   -moz-appearance: none;
   -webkit-appearance: none;
   appearance: none;
   font-family: "Noto Sansf KR", sans-serif;
     font-size: 1.5rem;
     line-height: 2.0;
     background-color: #fff;
     padding: 0.6em 1.4em 0.5em 0.8em;
     margin: 0;
     border: 1px solid #aaa;
     border-radius: 0.5em;
     box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
     text-align:center;
}

select::-ms-expand { display: none; }   /* IE 10, 11의 네이티브 화살표 숨기기 */
</style>

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

</head>
<body id="page-top">
<!-- Navigation-->
            <%
            String id = (String)session.getAttribute("id");
            String type = (String)session.getAttribute("type");
      
            if (id == null || type == null) // 로그인이 안되었을 때
            {
            %>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:none;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" value="검색"></li>
               </form>
                        <li class="nav-item"><a class="nav-link" href="#about">소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#projects">본문</a></li>
                        <li class="nav-item"><a class="nav-link" href="#signup">문의</a></li>
                        <li class="nav-item"><a class="nav-link" href="loginform.jsp">로그인</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
         } else if(id !=null && type.equals("customer") ) { //고객 로그인 했을 경우
            
            CustomerService service = CustomerService.getInstance();
            ResultSet rs = service.SelectName(id);
            
            while (rs.next()) {
               String name = rs.getString(1);
               session.setAttribute("name", name);
      %>

          <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:none;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" value="검색"></li>
               </form>
                        <!-- <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li> -->
                        <li class="nav-item"><a class="nav-link" onclick="kakaoLogout()">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="myinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="sidebar">
         <ul style="line-height:200%">
         <li><a href="customercourseform.jsp">코스예약하기</a></li>
         <li><a href="matchingQnA.jsp">코스매칭하기</a></li>
         <li><a href="receivetextform.jsp">쪽지확인하기</a></li>
         <li><a href="mypage.jsp">내 페이지</a></li>
         </ul>
      </div>
      <%
            }
            rs.close();
         } else if (id !=null && type.equals("guide")){
            
            GuideService service = GuideService.getInstance();
            ResultSet rs = service.SelectName(id);
            
            while (rs.next()) {
               String name = rs.getString(1);
               session.setAttribute("name", name);
      %>
         <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:none;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" value="검색"></li>
               </form>
                        <!-- <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li> -->
                        <li class="nav-item"><a class="nav-link" onclick="kakaoLogout()">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="guidemyinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="sidebar">
         <ul style="line-height:200%">
         <li><a href="guidecourseform.jsp">코스예약하기</a></li>
         <li><a href="matchingQnA.jsp">코스매칭하기</a></li>
         <li><a href="receivetextform.jsp">쪽지확인하기</a></li>
         <li><a href="mypage.jsp">내 페이지</a></li>
         </ul>
      </div>
      <%       
            }
            rs.close();
         } else if(id.equals("관리자") && type.equals("auth")){                                    
      %>
       <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="#page-top">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:none;">
                  <li>
                  <select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
                     <option value="course">제목</option>
                     <option value="name">닉네임</option>
                     <option value="id">아이디</option>
                  </select>
                  </li>
                  <li style="float: left;"><input type="text" name="search_word" value="" 
                  style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
                  <li style="float: left; margin-top:12px;"><input type="submit" value="검색"></li>
               </form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewmemberform.jsp">회원 관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="viewcoursesform.jsp">코스 관리</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A 관리</a></li>
                    </ul>
                </div>
            </div>
        </nav>
      <% 
         }
      %>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
                <div class="d-flex justify-content-center">
                    <div class="text-center">
                        <h1 class="mx-auto my-0 text-uppercase">나랑 가자</h1>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Be a Traveler</h2>
                        <h2 class="text-white-50 mx-auto mt-2 mb-5">Not a Tourist</h2>
                        <a class="btn btn-primary" href="#about">Start Your Journey</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- About-->
        <section class="about-section text-center" id="about">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="text-white mb-4">관광객과 가이드 사이의 매칭 사이트</h2>
                        <p class="text-white-50">
                            여행 매칭 사이트 '나랑 가자'는 추억 가득한 여행을 가고싶지만 정보가 부족한 사람들과<br>
                            자신이 사는 지역만큼은 자신있게 꿰차고 있는 사람들이 서로 연결될 수 있도록 해주는 사이트입니다.
                        </p>
                    </div>
                </div>
                <img class="img-fluid" src="image/logo2.png" alt="..." />
            </div>
        </section>
        <!-- Projects-->
        <section class="projects-section bg-light" id="projects">
          
   <div class="clear"></div>
   
   <div class="contents">
      <form action="matchingResult.jsp">
      <article id="box1" style="width:48%; margin:0 10px 0 10px; border:none; padding-top:50px;">
      <h3>어떤 코스와 매칭되고 싶으신가요?</h3>
      <article class="qna">
      <nav style="text-align: center;">
                  
         <div class="site1">
            <div class="main_5 main_common">지역</div>
            <select name="region" style="width:350px;">
               <option>지역을 선택해주세요</option>
               <option value="경기">경기</option>
               <option value="서울">서울</option>
               <option value="인천">인천</option>
               <option value="강원">강원</option>
               <option value="경남">경남</option>
               <option value="울산">울산</option>
               <option value="부산">부산</option>
               <option value="전남">전남</option>
               <option value="전북">전북</option>
               <option value="대구">대구</option>
               <option value="대전">대전</option>
               <option value="광주">광주</option>
               <option value="충남">충남</option>
               <option value="충북">충북</option>
               <option value="세종특별자치시">세종특별자치시</option>
               <option value="제주특별자치도">제주특별자치도</option>
            </select>
         </div>         
         <br>
      </nav>      
      </article>
      
      <article class="qna">
      <nav style="text-align: center;">
                  
         <div class="site1">
            <div class="main_5 main_common">인원 수</div>
            <select name="num" style="width:350px;">
               <option>인원수를 선택해주세요</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
               <option value="6">6</option>
               <option value="7">7</option>
               <option value="8">8</option>
               <option value="9">9</option>
               <option value="10">10</option>
               <option value="11">11</option>
               <option value="12">12</option>
               <option value="13">13</option>
               <option value="14">14</option>
               <option value="15">15</option>
            </select>
         </div>         
         <br>


      </nav>
      </article>
      
      
      
      <article class="qna">
      <nav style="text-align: center;">
                  
         <div class="site1">
            <div class="main_5 main_common">성별</div>
            <select name="gender" style="width:350px;">
               <option>희망 가이드 성별을 선택해주세요</option>
               <option value="상관없음">상관 없음</option>
               <option value="남자">남자</option>                           
               <option value="여자">여자</option>               
            </select>
         </div>         
         <br>


      </nav>
      </article>
      
      
      
      <article class="qna">
      <nav style="text-align: center;">
                  
         <div class="site1">
            <div class="main_5 main_common">나이 범위</div>
            <select name="age" style="width:350px;">
               <option>희망 가이드 나이 범위를 선택해주세요</option>
               <option value="상관없음">상관 없음</option>
               <option value="20~24">20~24</option>
               <option value="25~29">25~29</option>
               <option value="30~34">30~34</option>
               <option value="35~39">35~39</option>
               <option value="40~44">40~44</option>
               <option value="45~49">45~49</option>
               <option value="50세 이상">50세 이상</option>               
            </select>
         </div>         
         <br>


      </nav>
      </article>
      </article>
      
      <article id="box2" style="width:48%; margin:100px 10px 0 10px; border:none;">
      <article class="qna" style="margin-top:100px; margin-bottom:50px;">
      <nav style="text-align: center;">
                  
         <div class="site1">
            <div class="main_5 main_common">시작일/종료일</div>
            <input type="text" id="sdate" name="start_date" autocomplete="off">
            <input type="text" id="edate" name="end_date" autocomplete="off">   
         </div>         
         <br>


      </nav>
      </article>
      
      <article style="margin-left:295px; border:none;">
      <nav style="text-align: center;">
         <input type="submit" value="확인"   >   
      </nav>
      </article>
      </article>
   </form>
   </div>
   <div class="clear"></div>
   
   <div class="weekbest" id="container">
   이 달의 <span class="best"><b>가이드</b></span>
   </div>
   
   <%
   GuideRevService service = GuideRevService.getInstance();
   MypageService service1 = MypageService.getInstance();
   String rank1, rank2, rank3, rank4;
   ResultSet rs1 = service.GuideRank1();
   while(rs1.next()){
      rank1 = rs1.getString(1);
      ResultSet rs = service1.SelectGuideProfile(rank1);
      while(rs.next()){
      String src= "upload\\"+rs.getString(1);
      System.out.println(src);
   %>
   <section class="idle" style="margin-bottom:100px; width:60%;">
      <form action="showmypage.jsp">
      <input type="hidden" name="type" value="guide">
      <article class="Thema"><button type="submit" name="id" value="<%=rs1.getString(1) %>">
      <img src="<%=src%>" width="255px" height="300px" onerror="this.src='image/Noimage.jpg'"></button>
      <p><%=rs1.getString(1) %> 님</p>
      </article>
      </form>
   <%
      } rs.close();
   } rs1.close();
   ResultSet rs2 = service.GuideRank2();
   while(rs2.next()){
      rank2 = rs2.getString(1);
      ResultSet rs = service1.SelectGuideProfile(rank2);
      while(rs.next()){
      String src= "upload\\"+rs.getString(1);
      System.out.println(src);
   %>
      <form action="showmypage.jsp">
      <input type="hidden" name="type" value="guide">
      <article class="Thema"><button type="submit" name="id" value="<%=rs2.getString(1) %>">
      <img src="<%=src%>" width="255px" height="300px" onerror="this.src='image/Noimage.jpg'"></button>
      <p><%=rs2.getString(1) %> 님</p>
      </article>
      </form>
   <%
      } rs.close();
   } rs2.close();
   ResultSet rs3 = service.GuideRank3();
   while(rs3.next()){
      rank3 = rs3.getString(1);
      ResultSet rs = service1.SelectGuideProfile(rank3);
      while(rs.next()){
      String src= "upload\\"+rs.getString(1);
      System.out.println(src);
   %>
      <form action="showmypage.jsp">
      <input type="hidden" name="type" value="guide">
      <article class="Thema"><button type="submit" name="id" value="<%=rs3.getString(1) %>">
      <img src="<%=src%>" width="255px" height="300px" onerror="this.src='image/Noimage.jpg'"></button>
      <p><%=rs3.getString(1) %> 님</p>
      </article>
      </form>
   <%
      } rs.close();
   } rs3.close();
   ResultSet rs4 = service.GuideRank4();
   while(rs4.next()){
      rank4 = rs4.getString(1);
      ResultSet rs = service1.SelectGuideProfile(rank4);
      while(rs.next()){
      String src= "upload\\"+rs.getString(1);
      System.out.println(src);
   %>
      <form action="showmypage.jsp">
      <input type="hidden" name="type" value="guide">
      <article class="Thema"><button type="submit" name="id" value="<%=rs4.getString(1) %>">
      <img src="<%=src%>" width="255px" height="300px" onerror="this.src='image/Noimage.jpg'"></button>
      <p><%=rs4.getString(1) %> 님</p>
      </article>
      </form>
   </section>
   <%
      } rs.close();
   } rs4.close();
   %>
   
   <div class="clear"></div>
   <section class="idle" style="margin-top:50px;">
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="서울">
         <article><figure class="detail"><button type="submit"><img src="image/Seoul.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="경기">
         <article><figure class="detail"><button type="submit"><img src="image/Gyeonggi.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="인천">
         <article><figure class="detail"><button type="submit"><img src="image/Incheon.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="강원">
         <article><figure class="detail"><button type="submit"><img src="image/Gangwon.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="경남">
         <article><figure class="detail"><button type="submit"><img src="image/Gyeongnam.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="경북">
         <article><figure class="detail"><button type="submit"><img src="image/Gyeongbuk.png" width="100%" height="100%"></button></figure></article>
      </form>
   </section>
   <section class="idle">
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="울산">
         <article><figure class="detail"><button type="submit"><img src="image/Ulsan.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="부산">
         <article><figure class="detail"><button type="submit"><img src="image/Busan.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="전남">
         <article><figure class="detail"><button type="submit"><img src="image/Jeonnam.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="전북">
         <article><figure class="detail"><button type="submit"><img src="image/Jeonbuk.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="대구">
         <article><figure class="detail"><button type="submit"><img src="image/Daegu.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="대전">
         <article><figure class="detail"><button type="submit"><img src="image/Daejeon.png" width="100%" height="100%"></button></figure></article>
      </form>
   </section>
   <section class="idle">
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="충남">
         <article><figure class="detail"><button type="submit"><img src="image/Chungnam.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="충북">
         <article><figure class="detail"><button type="submit"><img src="image/Chungbuk.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="광주">
         <article><figure class="detail"><button type="submit"><img src="image/Gwangju.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="세종특별자치시">
         <article><figure class="detail"><button type="submit"><img src="image/Sejong.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="제주특별자치도">
         <article><figure class="detail"><button type="submit"><img src="image/Jeju.png" width="100%" height="100%"></button></figure></article>
      </form>
      <form action="showRegionCourses.jsp">
         <input type="hidden" name="region" value="모두보기">
         <article><figure class="detail"><button type="submit"><img src="image/All.png" width="100%" height="100%"></button></figure></article>
      </form>
   </section>
<script>
   $(".hover").mouseleave(function(){
      $(this).removeClass("hover");
   });
</script>
   <div class="clear"></div>
        </section>
        <!-- Signup-->
        <section class="signup-section" id="signup">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-10 col-lg-8 mx-auto text-center">
                        <i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
                        <h2 class="text-white mb-5">문의사항은 QNA 게시판이나 아래 연락처로 연락주세요!</h2>
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- * * SB Forms Contact Form * *-->
                        <!-- * * * * * * * * * * * * * * *-->
                        <!-- This form is pre-integrated with SB Forms.-->
                        <!-- To make this form functional, sign up at-->
                        <!-- https://startbootstrap.com/solution/contact-forms-->
                        <!-- to get an API token!-->
              
                    </div>
                </div>
            </div>
        </section>
        <!-- Contact-->
        <section class="contact-section bg-black">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">주소</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">경기도 성남시 *** *** ***</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-envelope text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">이메일</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50"><a href="#!">******@gmail.com</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <i class="fas fa-mobile-alt text-primary mb-2"></i>
                                <h4 class="text-uppercase m-0">연락처</h4>
                                <hr class="my-4 mx-auto" />
                                <div class="small text-black-50">010-****-****</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="social d-flex justify-content-center">
                    <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container px-4 px-lg-5">Copyright &copy; 나랑가자</div></footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->

        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그아웃
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function (response) {
                console.log(response)
                window.location.href='http://localhost:8080/logoutProc.jsp';
            },
            fail: function (error) {
                console.log(error)
            },
        })
        Kakao.Auth.setAccessToken(undefined)
    }else{
    	window.location.href='http://localhost:8080/logoutProc.jsp';
    }
}

</script>
</html>