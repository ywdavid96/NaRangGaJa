<%@page import="mypage.service.MypageService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

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

.infor {
	height: 500px;
	text-align: center;
	margin: 50px 0px 20px 150px;
	background-color: white;
	box-sizing: border-box;
	border-radius: 20px;
	width: 80%;
	float: left;
	padding-bottom: 30px;
	color: black;
}

.login {
	background: #FFFFFF;
	border: 1px solid;
	height: 100px;
	border-radius: 20px;
	border-color: #CC9966;
	font-size: 15px;
	text-align: right;
	z-index: 1;
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

.news {
	text-align: center;
	font-size: 15px;
	z-index: 1;
	border: 1px solid;
	border-color: #cccccc;
}

.Brandimage {
	width: 100%;
	height: 180px;
	float: left;
	margin-left: 650px;
}

.backimage {
	background-image: url('image/back.png');
	background-repeat: no-repeat;
	background-size: cover;
}

section {
	width: 100%;
	height: 100%;
	border: none;
}

#image{
	float: left;
}

#infor{
	float: right;
	margin-top:50px;
	
}

article {
	width: 70%;
	height: 100%;
	margin: 0 auto;
	text-align: left;
	margin-top:30px;
}

article #box {
	width: 90%;
	margin: 10px 0px 10px 50px;
	border: none;
	display: flex;
	border: solid 1px #cccccc;
}

article #box2 {
	width: 45%;
	height: 100%;
	margin: 10px;
	border: none;
	flex: 1;
}

article #box3 {
	width: 45%;
	height: 100%;
	margin: 10px;
	border: none;
	flex: 2;
}

.Thema {
	width: 24%;
	border: 0px;
	margin: 0px;
}

.clear {
	clear: both;
}

footer {
	border: 1px solid;
	border-color: #cccccc;
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
	text-align: right;
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
	border-color: black;
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

.contents {
	border: 3px solid black;
	margin: 20px auto;
	margin-top: 50px;
	text-align: center;
	width: 80%;
	height: 400px;
}

h3 {
	text-align: center;
	font-weight: lighter;
}

h1 {
	font-family: 'Hahmlet', serif;
	font-size:18px;
	font-weight: lighter;
	color: black;
}

#ub {
	width: 100px;
	height: 50px;
	background-color: #819FF7;
	float: right;
	margin-right: 350px;
	margin-top: 20px;
	border-radius: 5px;
	border-color: white;
	color: white;
	border: none;
}

select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	font-family: "Noto Sansf KR", sans-serif;
  	line-height: 2.0;
  	background-color: #fff;
  	padding: 0.6em 1.4em 0.5em 0.8em;
  	margin: 0;
  	border: 1px solid #aaa;
  	border-radius: 0.5em;
  	box-shadow: 0 1px 0 1px rgba(0, 0, 0, 0.04);
  	text-align:center;
}
</style>
</head>
<body>
		<%
			String id = (String)session.getAttribute("id");
			String type = (String)session.getAttribute("type");
		
			if(id !=null && type.equals("customer") ) { //고객 로그인 했을 경우
				
		%>

			<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">제목</option>
							<option value="name">닉네임</option>
							<option value="id">아이디</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="검색"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
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
			} else if (id !=null && type.equals("guide")){
		%>
			<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                    <form action="searchingResult.jsp" id="search" style="display:block;">
						<li>
						<select name="search_type" style="float: left; margin-top:15px; padding:10px; line-height: 1.2;">
							<option value="course">제목</option>
							<option value="name">닉네임</option>
							<option value="id">아이디</option>
						</select>
						</li>
						<li style="float: left;"><input type="text" name="search_word" value="" 
						style="margin-top:15px; width: 400px; height: 40px; border-color: #CC9966;"></li>
						<li style="float: left; margin-top:12px;"><input type="submit" id="searching" value="검색"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="logoutProc.jsp">로그아웃</a></li>
                        <li class="nav-item"><a class="nav-link" href="guidemyinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>
                    </ul>
                </div>
            </div>
        </nav>
		
		<div class="sidebar">
			<ul style="line-height:200%">
			<li><a href="guidecourseform.jsp">코스예약하기</a></li>
			<li><a href="matchingQnA.jsp"> 코스매칭하기</a></li>
			<li><a href="receivetextform.jsp">쪽지확인하기</a></li>
			<li><a href="mypage.jsp"> 내 페이지</a></li>
			</ul>
		</div>
		<% 		
			}
		%>
	
	<div class="clear" style="margin-top:150px;"></div>

	<form action="matchingResult.jsp">
		<article style="margin-bottom:50px; background-color:#FFFAFA;">
		<nav style="text-align: center;">
			<h1>어떤 지역으로 여행가고 싶으신가요?	</h1>
						
			<div class="site1">
				<div class="main_5 main_common">지역</div>
				<select name="region">
					<option>지역을 선택해주세요.</option>
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
		
		<article style="margin-bottom:50px; background-color:#FFFAFA;">
		<nav style="text-align: center;">
			<h1>여행 인원수는 몇명인가요?</h1>
						
			<div class="site1">
				<div class="main_5 main_common">인원 수</div>
				<select name="num">
					<option>인원수를 선택해주세요.</option>
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
		
		
		
		<article style="margin-bottom:50px; background-color:#FFFAFA;">
		<nav style="text-align: center;">
			<h1>편하신 가이드의 성별이 있으신가요?</h1>
						
			<div class="site1">
				<div class="main_5 main_common">성별</div>
				<select name="gender">
					<option>희망 가이드 성별을 선택해주세요.</option>
					<option value="상관없음">상관 없음</option>
					<option value="남자">남자</option>									
					<option value="여자">여자</option>					
				</select>
			</div>			
			<br>


		</nav>
		</article>
		
		
		
		<article style="margin-bottom:50px; background-color:#FFFAFA;">
		<nav style="text-align: center;">
			<h1>편하신 가이드의 나이대가 있으신가요?</h1>
						
			<div class="site1">
				<div class="main_5 main_common">나이 범위</div>
				<select name="age">
					<option>희망 가이드 나이 범위를 선택해주세요.</option>
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
		
		
		<article style="margin-bottom:50px; background-color:#FFFAFA;">
		<nav style="text-align: center;">
			<h1>여행일자는 어떻게 되시나요?</h1>
						
			<div class="site1">
				<div class="main_5 main_common">시작일/종료일</div>
				<input type="text" id="sdate" name="start_date" autocomplete="off">
				<input type="text" id="edate" name="end_date" autocomplete="off">	
			</div>			
			<br>


		</nav>
		</article>
		
		<article style="margin-bottom:50px;">
		<nav style="text-align: center;">
			<input type="submit" value="확인"	>	
			</nav>
		</article>
	</form>
	
	<div class="clear"></div>
	<header class="news"> <nav>
	<ul>
		<li><a href="#">이용약관 |</a></li>
		<li><a href="#"> 개인정보 처리방침 |</a></li>
		<li><a href="#"> 통합멤버십정책 |</a></li>
		<li><a href="#"> 회사소개 |</a></li>
		<li><a href="#"> 여기요사장님 |</a></li>
		<li><a href="#"> 입점문의</a></li>
		<li><a href="#"> 공지사항</a></li>
	</ul>
	</nav> </header>
	<footer>
	<p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
	<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
		031-332-6479</p>
	<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
		partnership@deliveryhero.co.kr|고객만족센터 : support@yogiyo.co.kr|호스트서비스사업자
		: (주)심플렉스인터넷</p>
	</footer>
</body>
</html>