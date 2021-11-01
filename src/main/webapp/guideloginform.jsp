<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<html>
<head>
<script>
	function zzz(){
		alert("로그인 후 이용해 주세요.");	
	}
</script>
<meta charset="utf-8">
<title>로그인</title>
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
	width: 750px;
	padding-top: 80px;
	padding-left: 100px;
	padding-right: 100px;
	border: 1px solid gray;
	margin: auto;
}

#form_box {
	width: 500px;
	height: 29px;
	padding-left: 10px;
	float: right;
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

.site2 {
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
	color: white;
}

/*h1 {
	font-family: '바탕';
	padding-top: 100px;
	text-align: center;
	color: white;
}*/
</style>
</head>
<body>
	<header class="login">
		<a href="index.jsp" style="float:left; margin:10px 0px 0px 30px"><img
					src="image/logo2.png" height="90px" width="200px"></a>
		<nav>
			<ul style="margin:30px 30px 0px 0px;">
				<li style="float: left;"><input type="text" style="margin-left: 350px; width: 400px; height: 40px; border-radius: 10px; border-color: #CC9966;"></li>
				<li style="float: left;"><input type="submit" value="검색"></li>
				<li><a href="loginform.jsp">로그인 |</a></li>
				<li><a href="customerjoinform.jsp"> 회원가입 |</a></li>
				<li><a href="#" onclick="zzz()"> 코스예약 |</a></li>
			</ul>
		</nav> </header>
	<h1>가이드 로그인</h1>
	<br>
	<form action="guideLogin.do">
		<div class="main">
			<div class="site1">
				<div class="main_1 main_common">아이디</div>
				<input id="form_box" type="text" class="int" maxlength="20"
					title="아이디 입력" placeholder=" 아이디를 입력해 주세요" name="Guide_ID">
			</div>
			<div class="site2" style="margin-bottom:50px;">
				<div class="main_3 main_common">비밀번호</div>
				<input id="form_box" type="password" class="int" maxlength="20"
					title="비밀번호 입력" placeholder=" 비밀번호를 입력해 주세요" name="Guide_PWD">
			</div>
		</div>
		<input id="ub" type="submit" value="로그인">
	</form>
	<header class="infor">
		<div class="clear"></div>

		<nav>
			<ul>
				<br>
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
	<footer>
		<p style="font-weight: bold; font-size: 15px;">(용인)딜리버리히어로 유니버시티.</P>
		<P>용인시 처인구 용인대학로 134 용인대학교 우.17092 TEL: 031-8020-3114 FAX:
			031-332-6479</p>
		<p>통신판매업신고:제 2018-서울서초-2635호|개인정보담당자 : privacy@yogiyo.co.kr|제휴문의 :
			partnership@deliveryhero.co.kr|고객만족센터 :
			support@yogiyo.co.kr|호스트서비스사업자 : (주)심플렉스인터넷</p>
	</footer>
</body>