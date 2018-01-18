<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
    <%@ page import="java.io.*"%> 
    <%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test4.jsp</title>
</head>
<body>
<%
	/*byte[] imageStream=(byte[])request.getAttribute("imageStream");
	response.setContentType("image/jpeg"); 
	ServletOutputStream op = response.getOutputStream();       
	op.write(imageStream, 0, imageStream.length);
	op.close();
	op = null;
	response.flushBuffer();*/
	//清除输出流，防止释放时被捕获异常
	//out.clear();
	//out = pageContext.pushBody();
	List<String> idList=(List<String>)request.getAttribute("idList");
	
%>
<%
	for(int i=0; i<idList.size(); i++) {
%>
<img width="100" height="400"  alt="sadad" src="articleImage!getArticleImageStreamById?id=<%=idList.get(i)%>">
<%} %>





</body>
</html>