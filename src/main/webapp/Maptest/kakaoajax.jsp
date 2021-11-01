<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<input id="query" value="" type="text">
    <button id="search">검색</button>

    <p></p>
    <script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {
            $("#search").click(function () {
                $.ajax({
                    method: "GET",
                    url: "https://dapi.kakao.com/v2/local/search/address.json?analyze_type=similar&page=1&size=10&query=",
                    data: { query: $("#query").val() },
                    headers: { Authorization: "aefb56e9d75dd890d22d6d5e5a9b7908" }
                })
                    .done(function (msg) {
                        console.log(msg.documents[0].title);
                        console.log(msg.documents[0].thumbnail);
                        $("p").append("<strong>" + msg.documents[0].title + "</strong>");
                        $("p").append("<img src='" + msg.documents[0].thumbnail + "'/>");
                    });
            });
        });
    </script>


</body>
</html>