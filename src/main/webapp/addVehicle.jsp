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
<body>
<div class="infor">
	<header class="head">
		<p class="normal"
			style="color: black; font-weight: bold; font-size: 25px">&nbsp;&nbsp;차량 추가</p>
	</header>
	<div class="main_2 main_common">이동 수단</div>
			<form action="uploadVehicleAction.jsp" method="post" enctype="multipart/form-data">파일 : <input type="file" name="file">
			<select name="vehicle">
					<option>이동수단 선택</option>
					<option value="Car">승용차 (1~5)</option>
					<option value="Van">승합차 (5~10)</option>
					<option value="Truck">트럭 (5~10)</option>
					<option value="Bus">버스 (10~30)</option>
					<option value="Ship">배 (~10)</option>
				</select>
				<input type="submit" value="업로드"><br>
				</form>
</div>
</body>
</html>