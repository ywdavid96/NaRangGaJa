<%@page import="course.service.CourseService"%>
<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="list.service.ListService"%>
<%@page import="courserev.service.CourseRevService"%>
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
   text-align: right;
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
</style>


</head>
<body>
      <%
         String id = (String)session.getAttribute("id");
         String type = (String)session.getAttribute("type");
         
          if(id == null || type == null){
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
                           <li style="float: left; margin-top:12px; margin-right:150px;"><input type="submit" value="검색"></li>
                        </form>
                                 <li class="nav-item"><a class="nav-link" href="loginform.jsp">로그인</a></li>
                                 <li class="nav-item"><a class="nav-link" href="customerjoinform.jsp">회원가입</a></li>
                             </ul>
                         </div>
                     </div>
                 </nav>
               <%      
                  }
          
          else if(id !=null && type.equals("customer") ) { //고객 로그인 했을 경우
            
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
      String code = request.getParameter("course_code");
   	  String thumbnail ="";   
   
   
   	  CourseService courseService = CourseService.getInstance();
   	  ResultSet rsCourse = courseService.SelectThumbnail(code);
   	  while(rsCourse.next()){
   		  thumbnail = "upload\\" + rsCourse.getString(1);
   	  }
   	  
      ListService service = ListService.getInstance();
      ResultSet rs = service.SelectByCoursecode(code);
   
   %>
   <article style="margin:0 150px 0 150px;">
   <h1 style="color: black;">코스 보기</h1>
   <table border="1" cellspacing="0" style="margin-bottom:30px;">
      <tr>
         <th>코스 번호</th>
         <th>관광지명</th>
         <th>관광지 주소</th>
         <th>지역</th>   
      </tr>

      <%
         while (rs.next()) {
      %>
      <tr>
         <td><%=rs.getString(1) %></td>         
         <td><%=rs.getString(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(4) %></td>

      </tr>
      <%
         }
      %>
   </table>
   <%
      rs.close();
   %>
   
   
   <!-- <div id="map" style="width:100%;height:350px;"></div> -->
	<img src="<%=thumbnail%>" style="width:100%; height: 350px;" onerror="this.src='image/Noimage.jpg'">
      

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=494257621fe30b68809cbdd7f5024017&libraries=services"></script>
   <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
   
   <%
         CourseRevService service1 = CourseRevService.getInstance();
         ResultSet rs1 = service1.SelectRev(code);
         int average=0;
   %>
   

   <h1 style="color: black;">코스 리뷰</h1>

   <form action="courseReview.do">
   <input type="hidden" name="course_code" value="<%=code%>">
   내용을 입력하세요: <input type="text" name="detail" value="내용"><br>   
   평점을 입력하세요:<select name="rep" style="margin-left: 10%">
               <option>평점</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
            </select><br>
   <input type="submit" value="작성">
   </form>

   

   <table border="1" cellspacing="0">
      <tr>
         <td>작성자 아이디</td>
         <td>내용</td>
         <td>작성날짜</td>
         <td>평점</td>
      </tr>
      <%
         while (rs1.next()) {
            /* average=rs3.getInt(5); */
           // String customer_id = rs1.getString(1);
            //String guide_id = rs1.getString(2);
          	System.out.println(rs1.getString(1));
          	System.out.println(rs1.getString(2));
            if (rs1.getString(2) == null )
            {
      %>
      <tr>
         <td><%=rs1.getString(1)%></td>         
         <td><%=rs1.getString(3)%></td>
         <td><%=rs1.getString(4)%></td>
         <td><%=rs1.getInt(5)%></td>         
      </tr>
      <%
            }else if (rs1.getString(1) ==null)
            {
      %>
      <tr>
         <td><%=rs1.getString(2)%></td>         
         <td><%=rs1.getString(3)%></td>
         <td><%=rs1.getString(4)%></td>
         <td><%=rs1.getInt(5)%></td>         
      </tr>
      <%
            }
         }
      %>
   </table>
   <%-- <h>가이드 평점: <%=average %></h> --%>

   <%
         rs1.close();
   %>
   </article>
        


</body>
</html>