<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

<script>
	String id;
	String name;
	String sql = "Select * from customer WHERE Customer_ID =?";
	Connection conn = null;
	conn = DBConnection.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = null;
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



article {
	width: 23%;
	height: 100%;
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

#login {
	float: left;
	width: 47.5%;
}

#snslogin {
	float: right;
	width: 47.5%;
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
	padding-top: 80px;
	padding-left: 100px;
	padding-right: 100px;
	border: 1px solid gray;
	margin: auto;
}

#form_box {
	height: 29px;
	padding-left: 10px;
	float: right;
}

.main_common {
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
	background-color: #bc5e00;
	float: right;
	margin: 20px 90px 20px 0px;
	border-radius: 5px;
	border-color: white;
	color: white;
	border: none;
	font-size:13px;
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
						<li style="float: left; margin-top:12px; margin-right:150px;"><input type="submit" value="검색"></li>
					</form>
                        <li class="nav-item"><a class="nav-link" href="loginform.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link" href="customerjoinform.jsp">회원가입</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="clear" style="margin-top:150px;"></div>
	<h1>로그인</h1>
	<br>
	<article id="login" style="height:450px;">
		<form name="default_login">
			<div class="main">
				<div class="site1">
					<div class="main_1 main_common">아이디</div>
					<input id="form_box" type="text" class="int" maxlength="20"
						title="아이디 입력" value="" name="ID">
				</div>
				<div class="site2" style="margin-bottom: 50px;">
					<div class="main_3 main_common">비밀번호</div>
					<input id="form_box" type="password" class="int" maxlength="20"
						title="비밀번호 입력" value="" name="PWD">
				</div>
			</div>
			<input id="ub" type="submit" value="로그인" onclick="customer_login()">
			<input id="ub" type="submit" value="가이드 로그인" onclick="guide_login()">
		</form>
	</article>
	<script>
		function customer_login()
		{
			default_login.action = "customerLogin.do";
		}
		
		function guide_login()
		{
			default_login.action = "guideLogin.do";
		}
	</script>
	<article id="snslogin">
		<form name="sns_login">
			<div class="main">
				<div class="site1">
					<div class="main_1 main_common">아이디</div>
					<input id="form_box" type="text" class="int" maxlength="20"
						title="sns_아이디" value="" name="ID" readonly>
				</div>
				<div class="site2" style="margin-bottom: 50px;">
					<div class="main_3 main_common">이 름</div>
					<input id="form_box" type="text" class="int" maxlength="20"
						title="sns_이름" value="" name="name" readonly>
				</div>
			</div>
			<ul>
			<li><button type="button" onclick="kakaoLogin();" style="border:none; cursor:pointer;"><img src="image/kakaologin.png" style="width:330px;"></button></li>
			<li><button type="button" onclick="fnFbCustomLogin();" style="border:none; cursor:pointer;"><img src="image/fblogin.png" style="width:330px;"></button></li>
			</ul>
			<!-- 카카오 스크립트 -->
			<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
			<script>
				Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
				console.log(Kakao.isInitialized()); // sdk초기화여부판단
				//카카오로그인
				function kakaoLogin() {
					Kakao.Auth
							.login({
								success : function(authObj) {
									Kakao.API
											.request({
												url : '/v2/user/me',
												success : function(response) {
													id = response.kakao_account.email;
													name = response.properties.nickname;
													document.getElementsByName('ID')[1].value = id;
													document.getElementsByName('name')[0].value = name;
												},
												fail : function(error) {
													alert("error")
												},
											})
								},
								fail : function(error) {
									alert("error")
								},
							});
				}
			</script>
			<script async defer crossorigin="anonymous"
				src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=674378716761627"
				nonce="SiOBIhLG"></script>
			<script>
				//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
				function statusChangeCallback(res) {
					statusChangeCallback(response);
				}

				function fnFbCustomLogin() {
					FB.login(function(response) {
						if (response.status === 'connected') {
							FB.api('/me', 'get', {fields : 'name,email,picture'}, function(r) {
								id = r.email;
								name = r.name;
								document.getElementsByName('ID')[1].value = id;
								document.getElementsByName('name')[0].value = name;
							})
						} else if (response.status === 'not_authorized') {
							// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
							alert('앱에 로그인해야 이용가능한 기능입니다.');
						} else {
							// 그 사람은 Facebook에 로그인하지 않았으므로 이 앱에 로그인했는지 여부는 확실하지 않습니다.
							alert('페이스북에 로그인해야 이용가능한 기능입니다.');
						}
					}, {
						scope : 'public_profile,email'
					});
				}

				window.fbAsyncInit = function() {
					FB.init({
						appId : '674378716761627', // 내 앱 ID를 입력한다.
						cookie : true,
						xfbml : true,
						version : 'v10.0'
					});
					FB.AppEvents.logPageView();
				};
			</script>

			<!--반드시 중간에 본인의 앱아이디를 입력하셔야 합니다.-->
			<script async defer crossorigin="anonymous"
				src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v10.0&appId=399353501417217"
				nonce="SiOBIhLG"></script>
			<input id="ub" type="submit" value="로그인" onclick="customer_sns_login();">
			<input id="ub" type="submit" value="가이드로그인" onclick="guide_sns_login();">
		</form>
	</article>
	<script>
		function customer_sns_login()
		{
			sns_login.action = "customerSNSLogin.do";
		}
		
		function guide_sns_login()
		{
			sns_login.action = "guideSNSLogin.do";
		}
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