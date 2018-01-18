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
<title>originalpage</title>
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css">
<script src="js/article.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">

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
</head>
<body>
	<%
		Pager pager=(Pager)request.getAttribute("pager");
		List<Article> articleList=pager.getResultList();
		System.out.println("--------------------------------->pager articleList size():"+articleList.size());
	%>
	<div >
		<img src="logo.jpg"  width="100%" height="55px" style="vertical-align:bottom" />
	</div>
	<div data-role="navbar" >
		<ul>
			<li><a href="article!enterHomePage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">首页</a></li>
			<li><a href="article!enterProsePage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">散文</a></li>
			<li><a href="article!enterOriginalPage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">原创</a></li>
			<li><a href="article!enterTechnologyPage?pageSize=10&pageNo=1" style="font-size: 14px"  data-ajax="false">技术</a></li>
			<li><a href="article!addArticle" style="font-size: 14px"  data-ajax="false">发表</a></li>
		</ul>
	</div>
	<table  width="100%"  border="1"  rules="rows">
		<%for(int i=0; i<articleList.size(); i++) { %>
    		<%Article article=articleList.get(i); %>
    			<tr height="30px">
    				<td align="left"><a href="article!getArticle?id=<%=article.getId() %>"  style="color: black;"  data-ajax="false"><%=article.getTitle() %></a></td>
    				<td align="right"><%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;<%=article.getTime() %></td>
    			</tr>
    		<%} %>
    </table>
	<table  width="100%"  border="0"  bgcolor="#FFD39B">
    	<tr>
    		<td align="right">
				共<s:property value='articlePager.rowCount'/>条记录&nbsp;&nbsp;
				<a class="page_link" href="article!enterTechnologyPage?pageNo=<s:property value='articlePager.firstPageNo'/>&pageSize=<s:property value='pageSize' />">首页</a>
				<a class="page_link" href="article!enterTechnologyPage?pageNo=<s:property value='articlePager.prePageNo'/>&pageSize=<s:property value='pageSize'/>">前一页</a>
				<a class="page_link" href="article!enterTechnologyPage?pageNo=<s:property value='articlePager.nextPageNo'/>&pageSize=<s:property value='pageSize'/>">下一页</a>
				<a class="page_link" href="article!enterTechnologyPage?pageNo=<s:property value='articlePager.lastPageNo'/>&pageSize=<s:property value='pageSize'/>">尾页</a>
			</td>
    	</tr>
    </table>
	
	
</body>
</html>