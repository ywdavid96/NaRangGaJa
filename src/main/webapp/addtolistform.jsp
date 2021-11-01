<%@page import="list.service.ListService"%>
<%@page import="course.service.CourseService"%>
<%@page import="customer.service.CustomerService"%>
<%@page import="guide.service.GuideService"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/shops.css">

<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@400&display=swap" rel="stylesheet">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css?ver=123" rel="stylesheet" />

<style type="text/css">
	.restaurant-title{
	padding: 10px;
    font-size: 110%;
    border-bottom: 1px solid #d9d9d9;
}
.restaurant-content {
    position: relative;
    padding: 10px;
}
	}
</style>
<style>
* {box-sizing: border-box}

body{
  	background: #F2F2F2;
	margin: 0px 150px;
}

th {
	padding: 15px;
}

td {
	padding: 10px;
}

.login {
	background: #FFFFFF;
	border: 1px solid;
	height:100px;
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

ul {
	list-style-type: none;
}

ul li {
	display: inline;
}

ul li a {
	color: black;
	font-family: 굴림;
	text-decoration: none;
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

/* Style tab links */
.tablink {
  background-color: #555;
  color: white;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 220px;
  font-size: 17px;
  width: 25%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: black;
  display: none;
  padding: 100px 20px;
  height: 100%;
}
</style>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

.news {
	text-align: center;
	font-size: 15px;
	z-index: 1;
	border: 1px solid;
	border-color: #cccccc;
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

footer {
	border: 1px solid;
	border-color: #cccccc;
	padding: 10px;
	padding-right: 50px;
	color: black;
	text-align: right;
	font-size: 12px;
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
		String code = request.getParameter("Course_code");
		//String code = (String)session.getAttribute("CourseName");
		String region = request.getParameter("Region");	
	
		ListService service = ListService.getInstance();
		ResultSet rs = service.SelectByCoursecode(code);
		
		System.out.println("코드이름:"+code);
	
	%>
	<article style="margin:0 150px 0 150px;">
	<h1 style="color: black;">나의 여행 리스트</h1>
	<table border="1" cellspacing="0" style="margin-bottom:30px;">
		<tr>
			<th>코스 번호</th>
			<th>관광지명</th>
			<th>관광지 주소</th>
			<th>지역</th>	
			<th>삭제</th>
		</tr>

		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1) %></td>			
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4) %></td>
			<td>
			<form action="listDelete.do">
			<input type="hidden" name="course_code" value="<%=code%>">
			<input type="hidden" name="pname" value="<%=rs.getString(2)%>">
			<input type="submit" value="삭제" onclick="location.reload();">
			</form>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	<%
		rs.close();
	%>
	
	
	<div class="map_wrap" style="margin-bottom:100px;">
		<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; margin-bottom:30px; border: 1px solid;">
		</div>
 
		<form action="ListInsert.do">
			<input type="hidden" id="Course_code" name="Course_code" value="<%=code%>">
			<input type="text" id="pname" name="pname" value=""> 
			<input type="text" id="paddress" name="paddress" value=""> 
			<input type="text" id="latclick" name="latclick" value=""> 
			<input type="text" id="lngclick" name="lngclick" value=""> 
			<input type="submit" value="추가하기">
		</form>

		<ul id="category">
			<li id="AT4" data-order="0"><span class="category_bg bank"></span>
				관광지</li>
		</ul>

		<!--        
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      
    </ul>
     -->

	</div>
	
	<%
		CourseService service1 = CourseService.getInstance();
		ResultSet rs1 = service1.SelectThumbnail(code);
		
		while (rs1.next()) {
			String src= "upload\\"+rs1.getString(1);
			System.out.println(src);
	%>
	
	<div class="infor" style="margin-bottom:100px;">
	<header class="head">
		<p class="normal"
			style="color: black; font-weight: bold; font-size: 25px">&nbsp;&nbsp;썸네일 변경</p>
	</header>
	<div class="main_1 main_common"></div>
			<img src="<%=src%>" style="width: 200px; height: 150px;" onerror="this.src='image/Noimage.jpg'">
			<form action="uploadThumbnailAction.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="name" value="<%=code%>">
			파일 : <input type="file" name="file">
			<input type="submit" value="업로드"><br>
				</form>
	</div>
	<%
		}
		rs1.close();
		%>
	</article>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=494257621fe30b68809cbdd7f5024017&libraries=services"></script>
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = []; // 마커를 담을 배열입니다

		var Region = "<%=region %>";

		
		if(Region=="서울"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="인천"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(37.45417340582432, 126.70009736374142), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="경기"){			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(37.31573925614166, 127.23586580018599), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="제주특별자치도"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(33.49210766267135, 126.5242386578083), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="강원"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(37.81964243539216, 128.1817229734696), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="경남"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.35965632045269, 128.29204858894795), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="경북"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(36.30317928377665, 128.88369912412006), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="울산"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.54555004234162, 129.25880097941968), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="부산"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.160500412003394, 129.04776551977335), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="전남"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(34.87756335741501, 126.98678743050124), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="전북"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.737432286603664, 127.16610553556352), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		} else if(Region =="대구"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.851072269687705, 128.57493787156264), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}else if(Region =="대전"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(36.3393472992806, 127.39326133134182), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}else if(Region =="충남"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(36.69018122164648, 126.79289278051561), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}else if(Region =="충북"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(36.82999627461129, 127.70616734173196), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}else if(Region =="세종특별자치시"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(36.50979236688951, 127.26037542749317), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}else if(Region =="광주"){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {					
					center : new kakao.maps.LatLng(35.1549436223413, 126.8401946385475), // 지도의 중심좌표
					level : 5
				// 지도의 확대 레벨
				};
		}
		
		
		
		
		//var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		//mapOption = {
		//	center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		//	level : 5
		// 지도의 확대 레벨
		//};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!"AT4") {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps.categorySearch("AT4", placesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById("AT4").getAttribute(
					'data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y,
						places[i].x), order);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {

			document.getElementById('pname').value = place.place_name;
			document.getElementById('paddress').value = place.address_name;
			document.getElementById('latclick').value = place.y;
			document.getElementById('lngclick').value = place.x;

			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">' + place.phone + '</span>'
					+ '</div>'
					+ '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {

				changeCategoryClass();
				removeMarker();
			} else {

				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}
	</script>
	
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