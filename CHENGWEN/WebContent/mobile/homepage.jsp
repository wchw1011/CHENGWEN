<%@page import="com.chengwen.pojo.ScanImage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
    <%@ page import="java.util.List"%>
    <%@ page import="com.chengwen.pojo.Article"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>homepage</title>
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mobile-1.4.5.js"></script>
<link rel="stylesheet" href="css/swiper.min.css">

<script>
	$(document).on("pagecreate",function(){
	  //alert("pagecreate 事件触发 - 页面已创建还未增强。")
	}); 
	function AutoResizeImage(maxWidth, maxHeight,objImg) {
		var img=new Image();
		img.src=objImg.src;
		var hRatio,wRatio;
		var Ratio=1;
		var w=img.width;
		var h=img.height;
		wRatio=maxWidth/w;
		hRatio=maxHeight/h;
		if(maxWidth==0 && maxHeight==0) {
			Ratio=1;
		}
		else if(maxWidth==0) {
			if(hRatio<1)Ratio=hRatio;
		}
		else if(maxHeight==0) {
			if(wRatio<1)Ratio=wRatio;
		}
		else if(wRatio < 1 || hRatio < 1) {
			Ratio=(wRatio<hRatio?wRatio:hRatio);
		}
		if(Ratio<1) {
			w=w*Ratio;
			h=h*Ratio;
		}
		objImg.height=h;
		objImg.width=w;
	}
	
	function getSwiperSlideWidth() {		//网页可见区域宽
		return document.body.clientWidth;
	}
	function getHalfSwiperSlideWidth() {		//网页可见区域宽/2
		return document.body.clientWidth/2;
	}
	
	function AutoResizeSwiperSlideImage(width, ratio,objImg) {
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
        /*修改前接赋值200px;*/
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
	List<Article> articleList=(List<Article>)request.getAttribute("articleList");
	List<ScanImage> scanImageList=(List<ScanImage>)request.getAttribute("scanImageList");
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
    
    
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<%for(int i=0; i<scanImageList.size(); i++) { %>
				<div class="swiper-slide">
					<img src="scanImage!getScanImageById?id=<%=scanImageList.get(i).getId()%>"   onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.5, this);"/>
					<label  style="position: absolute; top: 10%;  text-align: center; width: 100%; "><%=scanImageList.get(i).getImgDesc()%></label>
				</div>
			<%} %>
			<!--<div class="swiper-slide">
				<img src="2.jpg"  onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.5, this); "/>
				<label  style="position: absolute; top: 10%;  text-align: center; width: 100%; ">这里</label>
			</div>
			<div class="swiper-slide">
				<img src="1.jpg"   onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.5, this);"/>
				<label  style="position: absolute; top: 10%;  text-align: center; width: 100%; ">自行车</label>
			</div>
			<div class="swiper-slide">
				<img src="3.jpg"   onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.5, this);"/>
				<label  style="position: absolute; top: 10%;  text-align: center; width: 100%; ">仰望</label>
			</div>
			<div class="swiper-slide">
				<img src="4.jpg"  onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.5, this);"/>
				<label  style="position: absolute; top: 10%;  text-align: center; width: 100%; ">面朝大海，春暖花开</label>
			</div>  -->
		</div>
		<!-- Add Pagination -->
		<div class="swiper-pagination"></div>
		<!-- Add Arrows -->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<!-- Swiper JS -->
		<script src="js/swiper.min.js"></script>
		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper('.swiper-container', {
				nextButton: '.swiper-button-next',
				prevButton: '.swiper-button-prev',
				pagination: '.swiper-pagination',
				paginationType: 'fraction',
				loop: true,
				autoplay: 1500,
				autoplayDisableOnInteraction : false
			});
		</script>
	</div>
	    
    
    
    <div style="margin:10px 0px 0px 0px;font-weight: bold; font-size: 16px;"><font color="blue">最新文章</font></div>
    <table  width="100%"  border="1"  rules="rows">
    	<%for(int i=0; i<articleList.size(); i++) { %>
    		<%Article article=articleList.get(i); %>
    		<tr height="30px">
    		<td align="left"><a href="article!getArticle?id=<%=article.getId() %>"  style="color: black;"  data-ajax="false"><%=article.getTitle() %></a></td>
    		<td align="right"><%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;<%=article.getTime() %></td>
    	</tr>
    	<%} %>
    	<!-- <tr height="30px">
    		<td align="left"><a href="#"  style="color: black;">笑傲江湖，微风细雨</a></td>
    		<td align="right">2017-02-14 13:14:00</td>
    	</tr>
    	<tr height="30px">
    		<td align="left"><a href="#"  style="color: black;">有多少人希望时光倒流</a></td>
    		<td align="right">2017-02-14 13:14:00</td>
    	</tr>
    	<tr height="30px">
    		<td align="left"><a href="#"  style="color: black;">刀剑如梦</a></td>
    		<td align="right">2017-02-14 13:14:00</td>
    	</tr>
    	<tr height="30px">
    		<td align="left"><a href="#"  style="color: black;">落单的街角，迷失的那份爱</a></td>
    		<td align="right">2017-02-14 13:14:00</td>
    	</tr>-->
    </table>
    
    <div style="margin:10px 0px 0px 0px;font-weight: bold;  font-size: 16px;"><font color="blue">推荐地址</font></div>
    <a href="https://www.sanwen8.cn/"> <img src="t1.jpg" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    <a href="http://www.10qq.com/"> <img src="t2.jpg" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    <a href="http://www.gulongbbs.com/"> <img src="t3.jpg" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    <a href="http://www.iteye.com/"> <img src="t4.jpg" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    <a href="http://www.rs66.com/rensheng/"> <img src="t5.png" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    <a href="http://www.mm131.com/"> <img src="t6.png" onload="AutoResizeImage(100, 50, this)"  /></a>&nbsp;&nbsp;&nbsp;
    
    <table border="0" width="100%" align="center" bgcolor="#EEEED1">
		<tr align="center"><td><font size="1"></font><font size="1">原创作者：任天蓝 &nbsp;&nbsp;&nbsp;</font><font size="1">联系电话：13757976324&nbsp;&nbsp;&nbsp;</font><font size="1">地点：天涯海角</font></td></tr>
	</table>
    


	
</body>
</html>