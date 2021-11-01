
<%@page import="java.io.PrintWriter"%>
<%@page import="mypage.service.MypageService"%>
<%@page import="mypage.dao.MypageDAO"%>
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
	
	
	
	String id = (String) session.getAttribute("id");
	String vehicle = multipartRequest.getParameter("vehicle");
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	
	
	MypageService service = MypageService.getInstance();
	service.VehicleUpload(id, vehicle, fileName, fileRealName);
	
	PrintWriter pw = response.getWriter();
	pw.println("<script>opener.document.location.reload(); self.close();</script>");
	//MypageDAO dao = MypageDAO.getInstance();
	//dao.upload(fileName, fileRealName);
	 
	%>
</body>
</html>