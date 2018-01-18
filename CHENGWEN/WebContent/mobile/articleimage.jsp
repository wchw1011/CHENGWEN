<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>articleimage</title>
</head>
<body>
<%
	byte[] imageStream=(byte[])request.getAttribute("imageStream");
	if(imageStream==null) {
		return;
	}
	response.setContentType("image/jpeg"); 
	ServletOutputStream op = response.getOutputStream();       
	op.write(imageStream, 0, imageStream.length);
	op.close();
	op = null;
	response.flushBuffer();
	//清除输出流，防止释放时被捕获异常
	out.clear();
	out = pageContext.pushBody();
%>
</body>
</html>