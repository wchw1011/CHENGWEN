<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="com.chengwen.service.ArticleService"%>
<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
    <%@ page import="java.util.List"%>
    <%@ page import="com.chengwen.pojo.Article"%>
    <%@ page import="com.chengwen.util.Pager"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>prosepage</title>
<script type="text/javascript">

//refreshonload方法目前不用，其功能是使得进入该jsp后再刷新一次该jsp页
function refreshonload(){ 
	if(location.href.indexOf('#reloaded')==-1){ 
		location.href=location.href+"#reloaded" 
		location.reload() 
	} 
} 

function AutoResizeImage(width, ratio,objImg) {
	objImg.width=width;
	objImg.height=width*ratio;
}
</script>

<style type="text/css">
	body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color:#000;
        margin: 0;
        padding: 0;
    }
    .swiper-container {
        width: 100%;
        height: url(javascript:getHalfSwiperSlideWidth(););	
        /*修改前直接赋值200px;*/
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        line-height: 0px;	/*定义图片下面空出的像素*/
    }
    
    
</style>
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css">
<script src="js/article.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">
</head>
<body>
	<%
		Article article=(Article)request.getAttribute("article");
	%>
	<div >
		<img src="logo.jpg"  width="100%" height="55px" style="vertical-align:bottom" />
	</div>
	<div data-role="navbar"  data-ajax="false">
		<ul>
			<li><a href="article!enterHomePage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">首页</a></li>
			<li><a href="article!enterProsePage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">散文</a></li>
			<li><a href="article!enterOriginalPage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">原创</a></li>
			<li><a href="article!enterTechnologyPage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">技术</a></li>
			<li><a href="article!addArticle" style="font-size: 14px"  data-ajax="false">发表</a></li> 
		</ul>
	</div>
	<div style="color:blue; font-size:20px;line-height:150% ">
		<p style="font-size: 30px; line-height:50%" align="center"><%=article.getTitle() %><br><p style="font-size: 15px; line-height:50%" align="right">——<%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p> 
   			<!-- <p id="title"><%=article.getTitle() %></p><p id="author" >——<%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>-->
   			<% 
   				//ArticleService articleService=new ArticleService();
   				ServletContext sc = this.getServletConfig().getServletContext();
   		 		ApplicationContext ac2 = WebApplicationContextUtils.getWebApplicationContext(sc);
   		 		ArticleService articleService = (ArticleService) ac2.getBean("articleService");
   				if(articleService.hasArticleImageByArticleId(article.getId())) {
   			%>
   				<img src="article!getArticleImageByArticleId?id=<%=article.getId()%>"   onload="AutoResizeImage(document.body.clientWidth, 0.5, this);"/>
   			<%} %>
   			<%= article.getContent()%>
	</div>
</body>
</html>