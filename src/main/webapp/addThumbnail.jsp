<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	background: #F2F2F2;
	margin: 0px 50px;
}

.infor {
	height: 80%;
	text-align: center;
	margin: 50px 0px 0px 50px;
	background-color: white;
	box-sizing: border-box;
	border-radius: 10px;
	width: 400px;
	float: center;
	padding-bottom: 30px;
	color: black;
}
</style>
</head>
<%
   String Course_code = request.getParameter("Course_code");
%>
<body>
<div class="infor">
	<header class="head">
		<p class="normal"
			style="color: black; font-weight: bold; font-size: 25px">&nbsp;&nbsp;썸네일 변경</p>
	</header>
	<div class="main_2 main_common">썸네일</div>
			<form action="uploadThumbnailAction.jsp" method="post" enctype="multipart/form-data">
			코스	: <input type="text" name="name" readonly="readonly" value="<%=Course_code%>"><br>
			파일 : <input type="file" name="file"><br>
			<input type="submit" value="업로드"><br>
				</form>
</div>
</body>
</html>