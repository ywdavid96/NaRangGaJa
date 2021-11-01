<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>여행객 회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />
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
	width: 70%;
	height: 200px;
	margin: 10px auto;
}

article {
	width: 23%;
	height: 100%;
	margin-left: 10px;
	border: solid 1px #cccccc;
	float: left;
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

.main {
	width: 60%;
	padding-top: 80px;
	padding-left: 100px;
	padding-right: 100px;
	padding-bottom: 80px;
	border: 1px solid gray;
	margin: auto;
}

#form_box {
	width: 500px;
	height: 29px;
	padding-left: 10px;
	float: center;
}

.main_common {
	width: 170px;
	height: 35px;
	float: left;
}

.site1 {
	height: 70px;
	margin-bottom: 10px;
}

#em {
	width: 500px;
	height: 29px;
	margin-left: 65px;
}

#ub {
	width: 100px;
	height: 50px;
	background-color: #819FF7;
	float: right;
	margin-right: 330px;
	margin-top: 20px;
	border-radius: 5px;
	border-color: white;
	color: white;
	border: none;
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
h3 {
	text-align: center;
	font-weight: lighter;
	color: white;
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
						<li style="float: left; margin-top:12px; margin-right:150px;"><input type="submit" id="searching" value="검색"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="loginform.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="customerjoinform.jsp">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="clear" style="margin-top:150px;"></div>
        
	<h1>회원가입</h1>
	<br>
	<form action="customerInsert.do">
		<div class="main">
			<div class="site1">
				<div class="main_1 main_common">아이디</div>
				<input id="form_box" type="text" class="int" maxlength="20"
					title="아이디 입력" value="<%=session.getAttribute("id") %>" name="Customer_ID" readonly>
			</div>
			<div class="site1">
				<div class="main_2 main_common">비밀번호</div>
				<input id="form_box" type="text" class="int" maxlength="20"
					title="비밀번호 입력" value="" name="Customer_PWD" readonly>
			</div>
			<div class="site1">
				<div class="main_3 main_common">이름</div>
				<input id="form_box" type="text" title="이름 입력"
					value="<%=session.getAttribute("name") %>" name="Customer_name" readonly>
			</div>
			<div class="site1">
				<div class="main_4 main_common">SNS</div>
				<label><input type="radio" name="SNS_code" value="1">페이스북</label> 
				<label><input type="radio" name="SNS_code" value="2">인스타그램</label> 
				<label><input type="radio" name="SNS_code" value="3">카카오톡</label> 
				<label><input type="radio" name="SNS_code" value="4">라인</label>
			</div>
			<div class="site1">
				<div class="main_5 main_common">성별</div>
				<label><input type="radio" name="Gender" value="남자">남자</label> 
				<label><input type="radio" name="Gender" value="여자">여자</label>
			</div>
			<div class="site1">
            <div class="main_6 main_common">나이</div>
            <input id="form_box" type="text" title="이름 입력" placeholder="나이를 입력해주세요" name="Age">
         </div>
		</div>
		<input id="ub" type="submit" value="회원가입"> 
	</form>
	<header class="infor">

		<div class="clear"></div>
		<header class="news" style="margin-top: 50px;">
			<nav>
				<ul>
					<li><a href="#">이용약관 |</a></li>
					<li><a href="#"> 개인정보 처리방침 |</a></li>
					<li><a href="#"> 통합멤버십정책 |</a></li>
					<li><a href="#"> 회사소개 |</a></li>
					<li><a href="#"> 여기요사장님 |</a></li>
					<li><a href="#"> 입점문의</a></li>
					<li><a href="#"> 공지사항</a></li>
				</ul>
			</nav>
		</header>
	</header>
	<footer>
		<p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
		<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
			031-332-6479</p>
		<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
			partnership@deliveryhero.co.kr|고객만족센터 :
			support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</p>
	</footer>
</body>