<%@page import="course.service.CourseService"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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

.blueone {
  border-collapse: collapse;
}  
.blueone th {
  padding: 10px;
  color: #CC9966;
  border-bottom: 3px solid #CC9966;
  text-align: left;
}
.blueone td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
}
.blueone tr:hover td {
  color: #004;
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
	margin:50px 0px 20px 150px;
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
	width: 80%;
	height: 100%;
	border: solid 1px #cccccc;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
}

article #box {
	width: 90%;
	margin-bottom:30px;
	border: none;
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
	border : 0;
	outline : 0;
	background-color: #F2F2F2;
	color: #669;
	cursor: pointer; 
}

input[type="submit"]:hover {
	border : 0;
	outline : 0;
	background-color: #F2F2F2;
	color: #004;
	cursor: pointer; 
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

h1 {
	font-family: 'Hahmlet', serif;
	text-align: center;
	font-size:30px;
	font-weight: lighter;
	color: black;
}

#ub {
	width: 100px;
	height: 50px;
	background-color: #819FF7;
	float: right;
	margin-right: 150px;
	margin-top: 50px;
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
	<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp">나랑 가자</a>
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
	
	<div class="clear" style="margin-top:100px;"></div>
	<%		
		CourseService service = CourseService.getInstance();
		ResultSet rs = service.ViewCourses();
	%>
	<article style="margin-bottom:50px;">
	<h1 style="color: black;">코스 리스트</h1>
	<article id="box" >
	<table class="blueone">
		<tr>
			<th>썸네일</th>
			<th>코스 이름</th>
			<th>고객 아이디</th>
			<th>가이드 아이디</th>
			<th>지역</th>
			<th>총 인원 수</th>
			<th>예산</th>
			<th>시작일</th>
			<th>종료일</th>
		</tr>
		<%
			while (rs.next()) {
				String src= "upload\\"+rs.getString(1);
				System.out.println(src);
		%>
		<tr>
			<td><img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'"></td>			
			<td>
			<form action="showCourseList.jsp">
			<input type="submit" name="course_code" value="<%=rs.getString(2)%>">
			</form>
			</td>			
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="customer">
			<input type="submit" name="id" value="<%=rs.getString(3)%>">
			</form>
			</td>
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="guide">
			<input type="submit" name="id" value="<%=rs.getString(4)%>">
			</form>
			</td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
			<td><%=rs.getString(8)%></td>
			<td><%=rs.getString(9)%></td>
		</tr>
		<%
			}
		%>
	</table>
	</article>
	</article>
	<%
		rs.close();
	%>
	
	
	
	
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