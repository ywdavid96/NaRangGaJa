
<%@page import="post.service.PostService"%>
<%@page import="util.HttpUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="course.service.CourseService"%>
<%@page import="course.dao.CourseDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//String directory = application.getRealPath("/upload");
	ServletContext context = this.getServletContext();
	String directory = context.getRealPath("upload");
	
	System.out.println(directory);
	
	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";	
	
	MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding, new DefaultFileRenamePolicy());
	
	
	
	String id = (String)session.getAttribute("id");
	String type = (String)session.getAttribute("type");
	String fileName = multipartRequest.getOriginalFileName("photo");
	String fileRealName = multipartRequest.getFilesystemName("photo");
	String text =  multipartRequest.getParameter("content");
	

	
	PostService service = PostService.getInstance();
	service.newPost(id, type, fileName, fileRealName, text);
	
	
	PrintWriter pw = response.getWriter();
	out.println("<script>alert('게시물 게시완료'); location.href='mypage.jsp';</script>");
	
	 
	%>
</body>
</html>