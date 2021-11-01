
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
	
	
	
	String Course_code = multipartRequest.getParameter("name");
	String type = (String)session.getAttribute("type");
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	
	System.out.println("코스이름: "+Course_code);
	
	
	CourseService service = CourseService.getInstance();
	service.ThumbnailUpload(Course_code, fileName, fileRealName);
	
	if (type == "customer")
	{
		PrintWriter pw = response.getWriter();
		pw.println("<script>location.href=document.referrer; history.back();</script>");
	}
	else
	{
		PrintWriter pw = response.getWriter();
		pw.println("<script>location.href=document.referrer; history.back();</script>");
	}
	 
	%>
</body>
</html>