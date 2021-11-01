<%@page import="mypage.service.MypageService"%>
<%@page import="course.service.CourseService"%>
<%@page import="qna.service.QnaService"%>
<%@page import="guiderev.service.GuideRevService"%>
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


<link rel="stylesheet" href="css/mypageCss/reset.css?ver=123">
<link rel="stylesheet" href="css/mypageCss/common.css">
<link rel="stylesheet" href="css/mypageCss/style.css">



<script>
function popup(){
    var url = "addVehicle.jsp";
    var name = "popup test";
    var option = "width = 600, height = 500, top = 100, left = 100, location = no"
    window.open(url, name, option);
}

function vehicle_delete()
{
	Vehicle_list.action = "vehicleDelete.do";
}
</script>
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
	padding: 27px;
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
	margin-top:20px;
	
}

article {
	width: 85%;
	height: 100%;
	border: solid 1px #cccccc;
	margin: 0 auto;
	margin-top:30px;
	text-align:center;
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
	font-weight: bold;
}

input[type="submit"] {
	border : 0;
	outline : 0;
	background-color: #F2F2F2;
	color: #669;
	cursor: pointer;
	font-weight: bold;  
}

input[type="submit"]:hover {
	border : 0;
	outline : 0;
	background-color: #F2F2F2;
	color: #004;
	cursor: pointer; 
}

#searching {
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
                        <li class="nav-item"><a class="nav-link" href="newPost.jsp">게시물 올리기</a></li>
                        <li class="nav-item"><a class="nav-link" href="myinfor.jsp">내 정보</a></li>
                        <li class="nav-item"><a class="nav-link" href="FAQform.jsp">Q n A</a></li>                    
                    </ul>
                </div>
            </div>
        </nav>
		
		<div class="sidebar">
			<ul style="line-height:200%">
			<li><a href="customercourseform.jsp">코스예약하기</a></li>
			<li><a href="matchingQnA.jsp"> 코스매칭하기</a></li>
			<li><a href="receivetextform.jsp">쪽지확인하기</a></li>
			<li><a href="mypage.jsp"> 내 페이지</a></li>
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
                        <li class="nav-item"><a class="nav-link" href="newPost.jsp">게시물 올리기</a></li>
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
	<%
	MypageService service = MypageService.getInstance();
	CourseService service2 = CourseService.getInstance();
	QnaService service3 = QnaService.getInstance();
	
	int checkpage = service.CheckPage(id);
	int checkvehicle = service.CheckVehicle(id);

	%>
	
	
	

		<%
			if (checkpage == 0) // 내 페이지가 없을때
			{
		%>
		<article style="margin-bottom:50px;">
		<nav style="text-align: center;">
			<a>내 페이지가 없습니다.<br>
			소개칸에 자신을 소개하는 글을 작성하고 자신을 보여주는 사진을 첨부해주세요!</a>
			
			
			<form action="uploadAction.jsp" method="post" enctype="multipart/form-data" style="margin-top:50px;">
				이름: <input type="text" name="name" readonly="readonly" value=<%=session.getAttribute("id")%>>			
				소개: <input type="text" name="intro" value="소개" autocomplete="off">								
				파일: <input type="file" name="file"><br>
				<input type="submit" value="업로드" style="background-color: #CC9966; border-radius: 0px; margin-top:30px;">
			</form>
			 
			<br>
			 <!-- 
			<form action="mypageInsert.do">
			<input type="text" name="name" readonly="readonly">			
			<input type="text" name="intro" value="소개">
			<input type="submit" value="확인">
			</form>
			 -->
		</nav>
		</article>
		<%
			} else { // 내 페이지가 있을 때
				
		%>
	<%
		
	ServletContext context = this.getServletContext();
	String directory = context.getRealPath("upload");
	
	
	if(type.equals("customer")){
		//고객이 로그인 했을 경우

		ResultSet rs = service.SelectMyPage(id,type);
		ResultSet nrs= service.GetName(id, type);
	%>
	<article style="margin-bottom:50px;">
	<article id="box" >
	<article id="box2">
		<%
		while (rs.next()) {
			//String src = directory+"\\"+rs.getString(4);
			String src= "upload\\"+rs.getString(4);
			System.out.println(src);
			%>
			<section id="image">
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
	</article>
			<article id="box2">
			<section id="infor" style="margin-top:50px;">
			<li style="list-style-type: none; font-size : 20px;"><%=rs.getString(1)%></li>
			</section>
			<section id="infor" style="margin-top:50px;">
			<%
			while(nrs.next()){				
			%>
			<li style="list-style-type: none; font-weight: 700;"><%=nrs.getString(1)%></li>
			<%			
			}
			nrs.close();
			%>
			</section>
			<section id="infor" style="margin-top:50px;">
			<li style="list-style-type: none;"><%=rs.getString(6)%></li>
			</section>
			<%
			}//while	
			rs.close();
		%>
		</article>
	</article>
	
	
	<!-- 포스트 -->
	<%
	ResultSet postRs = service.GetPosts(id, type);
	while(postRs.next()){
		
	%>
	
	<article class="contents">
                    <header class="top">
   

                        <div class="sprite_more_icon" data-name="more">
                            <ul class="toggle_box">                               
                                <li>수정</li>
                                <li>삭제</li>
                            </ul>
                        </div>
                    </header>

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="<%="upload\\"+postRs.getString(3) %>" width="300" height="200" alt="visual01"></div>
                        </div>
                    </div>


                    <div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text"><%=postRs.getString(1) %></div>
                                <div><%=postRs.getString(4) %></div>
                            </div>
                        </div>
                </article>
                
                <%
	}
	postRs.close();
                %>
	<!-- 포스트 -->
	
	
	
	
	
	<nav style="text-align: center;">
			<h1 style="margin-top:50px;">예약 목록</h1>
	<table class="blueone" cellspacing="0" style="margin:10px auto;">
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
			<th>확인메세지보내기</th>			
		</tr>
		<%
		ResultSet rs2 = service2.ShowReservedCourses(id, type);
			while (rs2.next()) {
				String src= "upload\\"+rs2.getString(9);
				System.out.println(src);
		%>
		<tr>
			<td><img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'"></td>
			<td>
			<form action="showCourseList.jsp">
			<input type="submit" name="course_code" value="<%=rs2.getString(1)%>">
			</form>
			</td>			
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="customer">
			<input type="submit" name="id" value="<%=rs2.getString(2)%>">
			</form>
			</td>
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="guide">
			<input type="submit" name="id" value="<%=rs2.getString(3)%>">
			</form>
			</td>			
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getInt(5)%></td>
			<td><%=rs2.getInt(6)%></td>
			<td><%=rs2.getString(7)%></td>
			<td><%=rs2.getString(8)%></td>
			<td><button id="send-to-btn" href="#" onclick="sendToCustomer();" 
			style="height: 45px; background-color: orange; border-radius: 5px; border-color: white; color: white; border: none; padding-left: 10px; padding-right: 10px; margin-left: 5px;">
			확인</button></td>
		</tr>	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

var course_code ="<%=rs2.getString(1)%>";
var customer = "<%=rs2.getString(2)%>";
var guide ="<%=rs2.getString(3)%>";
var region ="<%=rs2.getString(4)%>";
var num ="<%=rs2.getInt(5)%>";
var budget ="<%=rs2.getInt(6)%>";
var sdate ="<%=rs2.getString(7)%>";
var edate ="<%=rs2.getString(8)%>";

Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
  function sendToCustomer() {
	  Kakao.Auth.login({
	      scope: 'PROFILE,TALK_MESSAGE',
	      success: function() {
              Kakao.API.request({
                  url: '/v2/api/talk/memo/default/send',
                  data: {
                      template_object: {
                          object_type: 'feed',
                          content: {
                              title: '나랑가자',
                              description: '코스 예약이 완료되었습니다.',
                              image_url:
                                  'https://ifh.cc/g/0hgpgh.png',
                              link: {
                            	  web_url: 'http://localhost:8080/showCourseList.jsp?course_code='+course_code,
                                  mobile_web_url: 'http://localhost:8080/index.jsp'+course_code,
                              },
                          },
                          item_content: {
                              profile_text: course_code,
                              profile_image_url: 'https://ifh.cc/g/0hgpgh.png',
                              title_image_url: 'https://ifh.cc/g/0hgpgh.png',
                              title_image_text: '코스 예약 내역',
                              title_image_category: course_code,
                              items: [
                                  {
                                      item: '고객 아이디',
                                      item_op: customer,
                                  },
                                  {
                                      item: '가이드 아이디',
                                      item_op: guide,
                                  },
                                  {
                                      item: '여행지역',
                                      item_op: region,
                                  },
                                  {
                                      item: '여행 시작일',
                                      item_op: sdate,
                                  },
                                  {
                                      item: '여행 종료일',
                                      item_op: edate,
                                  }
                              ],
                              sum: '코스 이름',
                              sum_op: course_code,
                          },
                          button_title: '바로 확인',
                      },
                  },
	          
	          success: function(res) {
	            alert('메시지가 전송되었습니다. 내 카카오톡을 확인해주세요.')
	          },
	          fail: function(err) {
	            alert('error: ' + JSON.stringify(err))
	          },
	        })
	      },
	      fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script>
		<%
			}
		%>
	</table>
	</nav>
	<%
	rs2.close();
	%>
	<article style="width:90%; margin-bottom:50px;">
	<h1 style="margin-top:30px;">나의 고객센터 글 목록</h1>
	<table class="blueone" cellspacing="0" style="margin:10px auto; width:90%;">
		<tr>
			<th>제목</th>
			<th width="30%">확인 여부</th>			
		</tr>
		<%
		ResultSet rs3 = service3.selectQnA(id, type);
			while (rs3.next()) {
				String Checked = "";
				if(rs3.getInt(2) == 0)
					Checked = "처리대기중";
				else if(rs3.getInt(2) == 1)
					Checked = "답변완료";
		%>
		<tr>	
			<form action="questionDetail.jsp">
			<td>
			<input type="hidden" name="checked" value="<%=Checked%>">
			<input type="submit" name="title" value="<%=rs3.getString(1)%>">
			</td>
			</form>
			<td><%=Checked%></td>
		</tr>
		</table>
		<% }
		rs3.close();	
			%>
	</article>
	</article>
	
	<%
			} else {		//가이드가 로그인 했을 경우

	ResultSet rs = service.SelectMyPage(id,type);
	ResultSet nrs= service.GetName(id, type);
	GuideRevService service1 = GuideRevService.getInstance();
	ResultSet rrs= service1.AvgRep(id);
	%>
	<article style="margin-bottom:50px;">
	<article id="box" >
	<article id="box2">
		<%
		while (rs.next()) {
			//String src = directory+"\\"+rs.getString(4);
			String src= "upload\\"+rs.getString(4);
			System.out.println(src);
			%>
			<section id="image">
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
	</article>
			<article id="box2">
			<section id="infor">
			<%
			while(rrs.next()){
				double avgrep = 0;
				if(rrs.getString(1) == null)
				{				
					avgrep =  1;
					System.out.println(avgrep);
				} else {
					avgrep =  Double.parseDouble(rrs.getString(1));
					System.out.println(avgrep);
				}

				if(avgrep >= 4)
				{
			%>
			<img src="image/Diamond.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 3 && avgrep < 4)
				{
			%>
			<img src="image/Platinum.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 2 && avgrep < 3)
				{
			%>
			<img src="image/Gold.png" height="100px" width="100px">
			<%
				} else if(avgrep >= 1 && avgrep < 2)
				{
			%>
			<img src="image/Silver.png" height="100px" width="100px">
			<%
				} else
				{
			%>
			<img src="image/Bronze.png" height="100px" width="100px">
			<%
				}
			}
			rrs.close();
			%>
			</section>
			<section id="infor">
			<li style="list-style-type: none; font-size : 20px;"><%=rs.getString(2)%></li>
			</section>
			<section id="infor">
			<%
			while(nrs.next()){				
			%>
			<li style="list-style-type: none; font-weight: 700;"><%=nrs.getString(1)%></li>
			<%			
			}
			nrs.close();
			%>
			</section>
			<section id="infor">
			<li style="list-style-type: none;"><%=rs.getString(6)%></li>
			</section>
			<%
			}//while	
			rs.close();
		%>
		</article>
	</article>
	
	
	
	<!-- 포스트 -->
	<%
	ResultSet postGRs = service.GetPosts(id, type);
	while(postGRs.next()){
		
	%>
	
	<article class="contents">
                    <header class="top">
   

                        <div class="sprite_more_icon" data-name="more">
                            <ul class="toggle_box">                               
                                <li>수정</li>
                                <li>삭제</li>
                            </ul>
                        </div>
                    </header>

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="<%="upload\\"+postGRs.getString(3) %>" width="300" height="200" alt="visual01"></div>
                        </div>
                    </div>


                    <div class="comment_container">
                        <div class="comment" id="comment-list-ajax-post37">
                            <div class="comment-detail">
                                <div class="nick_name m_text"><%=postGRs.getString(1) %></div>
                                <div><%=postGRs.getString(4) %></div>
                            </div>
                        </div>
                </article>
                
                <%
	}
	postGRs.close();
                %>
	<!-- 포스트 -->
	
	
	
	<%
	if (checkvehicle == 0) // 이동수단이 없을때
	{
	%>
	<article id="box">
	<nav>
	<h1 style="margin-top:50px;">보유하신 차량이 없습니다.</h1>
	<br>
	<input type="button" value="추가하기" onclick="popup()">
	</nav>
	</article>
	<article id="box">
	</article>
	<%
	}
	else // 이동수단이 있을때
	{
	%> 
	<article id="box">
	<article id="box2">
	<h1 style="text-align: center; margin-top:50px;">보유 차량</h1>
	</article>
	<article id="box3">
	<%
	ResultSet rs1 = service.SelectVehicle(id);
			while (rs1.next()) {
				String src= "upload\\"+rs1.getString(3);
				System.out.println(src);
	%>
		<section id="infor" style="margin-bottom:30px;">
			<form name="Vehicle_list">
			<li style="list-style-type: none; border: none; font-size : 20px;"><%=rs1.getString(2)%>
			<input type="hidden" name="id" value="<%=rs1.getString(1)%>">
			<input type="hidden" name="filename" value="<%=rs1.getString(3)%>">
			<button onclick="vehicle_delete()" 
			style="float:right; width:100px; border: 1px solid black; background-color: rgba(0,0,0,0); color: black; padding: 5px; cursor: pointer;">삭제하기</button>
			</li>
			</form>
			<section id="image" >
			<img src="<%=src%>" style="width: 400px; height: 300px;">
			</section>
			</section>
	<%
			}
			rs1.close();
	}//이동수단이 있을 때
	%>
	<input type="button" value="추가하기"
	 style="width:100px; border: 1px solid black; background-color: rgba(0,0,0,0); color: black; padding: 5px; cursor: pointer;" onclick="popup()">
		</article>
	</article>
	<nav style="text-align: center;">
	<h1 style="margin-top:50px;">예약 목록</h1>
	</nav>
						
	<table class="blueone" cellspacing="0" style="margin:10px auto;">
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
			<th>확인메세지보내기</th>			
		</tr>
		<%
		ResultSet rs2 = service2.ShowReservedCourses(id, type);
			while (rs2.next()) {
				String src= "upload\\"+rs2.getString(9);
				System.out.println(src);
		%>
		<tr>
			<td><img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'"></td>
			<td>
			<form action="showCourseList.jsp">
			<input type="submit" name="course_code" value="<%=rs2.getString(1)%>">
			</form>
			</td>			
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="customer">
			<input type="submit" name="id" value="<%=rs2.getString(2)%>">
			</form>
			</td>
			<td>
			<form action="showmypage.jsp">
			<input type="hidden" name="type" value="guide">
			<input type="submit" name="id" value="<%=rs2.getString(3)%>">
			</form>
			</td>			
			<td><%=rs2.getString(4)%></td>
			<td><%=rs2.getInt(5)%></td>
			<td><%=rs2.getInt(6)%></td>
			<td><%=rs2.getString(7)%></td>
			<td><%=rs2.getString(8)%></td>
			<td><button id="send-to-btn" href="#" onclick="sendToGuide();" 
			style="height: 45px; background-color: orange; border-radius: 5px; border-color: white; color: white; border: none; padding-left: 10px; padding-right: 10px; margin-left: 5px;">
			확인</button></td>
		</tr>	
		
		
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

var course_code ="<%=rs2.getString(1)%>";
var customer ="<%=rs2.getString(2)%>";
var guide ="<%=rs2.getString(3)%>";
var region ="<%=rs2.getString(4)%>";
var num ="<%=rs2.getInt(5)%>";
var budget ="<%=rs2.getInt(6)%>";
var sdate ="<%=rs2.getString(7)%>";
var edate ="<%=rs2.getString(8)%>";

Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
  function sendToGuide() {
	  Kakao.Auth.login({
	      scope: 'PROFILE,TALK_MESSAGE',
	      
	      success: function() {
              Kakao.API.request({
                  url: '/v2/api/talk/memo/default/send',
                  data: {
                      template_object: {
                          object_type: 'feed',
                          content: {
                              title: '나랑가자',
                              description: '코스 예약이 완료되었습니다.',
                              image_url:
                                  'https://ifh.cc/g/0hgpgh.png',
                              link: {
                                  web_url: 'http://localhost:8080/showCourseList.jsp?course_code='+course_code,
                                  mobile_web_url: 'http://localhost:8080/index.jsp'+course_code,
                              },
                          },
                          item_content: {
                              profile_text: course_code,
                              profile_image_url: 'https://ifh.cc/g/0hgpgh.png',
                              title_image_url: 'https://ifh.cc/g/0hgpgh.png',
                              title_image_text: '코스 예약 내역',
                              title_image_category: course_code,
                              items: [
                                  {
                                      item: '고객 아이디',
                                      item_op: customer,
                                  },
                                  {
                                      item: '가이드 아이디',
                                      item_op: guide,
                                  },
                                  {
                                      item: '여행지역',
                                      item_op: region,
                                  },
                                  {
                                      item: '여행 시작일',
                                      item_op: sdate,
                                  },
                                  {
                                      item: '여행 종료일',
                                      item_op: edate,
                                  },
                                  {
                                      item: '총 여행객 수',
                                      item_op: num,
                                  },
                                  {
                                      item: '등록된 예산',
                                      item_op: budget,
                                  }
                              ],
                              sum: '코스 이름',
                              sum_op: course_code,
                          },
                          button_title: '바로 확인',
                      },
                  },
                  success: function(res) {
                	  alert('메시지가 전송되었습니다. 내 카카오톡을 확인해주세요.')
      	          },
                  
	      fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script>
		
<%-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

var course_code ="<%=rs2.getString(1)%>";
var customer ="<%=rs2.getString(2)%>";
var guide ="<%=rs2.getString(3)%>";
var region ="<%=rs2.getString(4)%>";
var num ="<%=rs2.getInt(5)%>";
var budget ="<%=rs2.getInt(6)%>";
var sdate ="<%=rs2.getString(7)%>";
var edate ="<%=rs2.getString(8)%>";

Kakao.init('494257621fe30b68809cbdd7f5024017'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
  function sendToGuide() {
	  Kakao.Auth.login({
	      scope: 'PROFILE,TALK_MESSAGE',
	      success: function() {
	        Kakao.API.request({
	          url: '/v2/api/talk/memo/default/send',
	          data: {
	            template_object: {
	              object_type: 'feed',
	              content: {
	                title: course_code + '코스 매칭이 성사되었습니다.',
	                /*  description: '나랑가자 사이트에서 확인해주세요!', */ 
	                 description: '고객 카톡 ID:' + customer,
	                image_url:
	                  'https://ifh.cc/g/0hgpgh.png',
	                link: {
	                  mobile_web_url: 'https://developers.kakao.com',
	                  web_url: 'https://developers.kakao.com',
	                },
	              },
	              social: {
	                
	              },
	              buttons: [
	                {
	                  title: '웹으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	                {
	                  title: '앱으로 보기',
	                  link: {
	                    mobile_web_url: 'https://developers.kakao.com',
	                    web_url: 'https://developers.kakao.com',
	                  },
	                },
	              ],
	            },
	          },
	          success: function(res) {
	            alert('success: ' + JSON.stringify(res))
	          },
	          fail: function(err) {
	            alert('error: ' + JSON.stringify(err))
	          },
	        })
	      },
	      fail: function(err) {
	        alert('failed to login: ' + JSON.stringify(err))
	      },
	    })
	  }
	</script> --%>
		<%
			}
		%>
	</table>
	</nav>
	<%
	rs2.close();
	%>
	<article style="width:90%; margin-bottom:50px;">
	<h1 style="margin-top:50px;">나의 고객센터 글 목록</h1>
	<table class="blueone" cellspacing="0" style="margin:10px auto; width:90%;">
		<tr>
			<th>제목</th>
			<th width="30%">확인 여부</th>			
		</tr>
		<%
		ResultSet rs3 = service3.selectQnA(id, type);
			while (rs3.next()) {
				String Checked = "";
				if(rs3.getInt(2) == 0)
					Checked = "처리대기중";
				else if(rs3.getInt(2) == 1)
					Checked = "확인";
		%>
		<tr>
			<form action="questionDetail.jsp">
			<td>
			<input type="hidden" name="checked" value="<%=Checked%>">
			<input type="submit" name="title" value="<%=rs3.getString(1)%>">
			</td>
			</form>
			<td><%=Checked%></td>
		</tr>
		<% }
		rs3.close();
			%>
		</table>
	</article>

	
	</article>	<!-- 전체 body -->
	
	<%
			}//가이드가 로그인 했을 때
  %>
  
  
  <%
			}//내 페이지가 있을 때
		%>
	

</body>
</html>