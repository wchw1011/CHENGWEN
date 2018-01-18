<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
<%@page import="com.chengwen.pojo.ScanImage"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chengwen.pojo.Article"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>homepage_pc</title>
<link rel="stylesheet" href="css/swiper.min.css">
<script type="text/javascript">
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
	objImg.width=width*0.80*0.20;	//对应swiper-container的宽度80%
	objImg.height=width*ratio;
}
</script>
<style type="text/css">
	*{margin: 0;padding: 0;}	/*浏览器都有自己的默认外边距，这个操作是为了取消这个默认的边距*/
	body {
		/*text-align: center;*/
	}
	.swiper-container {
        width: 80%;
        height:(100%*0.16);
        /*height: 300px;*/
        margin: 0px auto;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        /*  Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
    }
    
    .new {
    	width: 40%;
    	background: #ADD8E6;
    	margin-left: 10%;
    	display:inline-block;
    }
    .hot {
    	width: 40%;
    	background: #ADD8E6;
    	display:inline-block;
    	margin-left: -3px;	/*消除与.new之间的间隙*/
    }
    
    .newtable {
    	width: 100%;
    	border: 0px solid #FCFCC3;
    }
    .newtable tr {
    	height: 30px;
    }
    .hottable {
    	width: 100%;
    	border: 0px solid #FCFCC3;
    }
    .hottable tr {
    	height: 30px;
    }
    .website {
    	width: 80%;
    	height: 60px;
    	margin-left: 10%;
    }
    .websitefont {
    	width:10%;
    	height:60px;
    	border:none;
    	background: #D7B1DD;
    	position:relative;
    	display: inline-block;
    }
    .websitefont font {
    	color: red;
    	font-weight: bold;
    	font-size:20px;
    	top: 30%;
    	left:10%;
    	position: absolute;
    	display: inline-block;
    }
    .websitelink {
    	height: 60px;
    	width: 90%;
    	border:none;
    	margin-left:-4px;
    	display: inline-block;
    }
    .websitelink div {
    	width: 16.3%;
    	height: 60px;
    	display: inline-block;
    }
    .websitelink div img{
    	width: 100%;
    	height: 60px;
    	display: inline-block;
    }
    .ad {
    	width: 80%;
    	height: 50px;
    	margin-left:10%;
    	background: yellow;
    }

    /*.separate {
    	width:0px;
		height:400px;
		border-left:3px solid black;
		margin-left: 49.999%;;
    }*/
</style>
</head>
<body>
	<%
		List<Article> articleList=(List<Article>)request.getAttribute("articleList");
		List<ScanImage> scanImageList=(List<ScanImage>)request.getAttribute("scanImageList");
	%>
	<jsp:include page="logo_pc.jsp" flush="true"></jsp:include>
	<jsp:include page="menu_pc.jsp" flush="true"></jsp:include>
	<div class="swiper-container">
        <div class="swiper-wrapper">
        	<%for(int i=0; i<scanImageList.size(); i++) { %>
				<div class="swiper-slide">
					<a href="http://www.baidu.com">
					<img src="scanImage!getScanImageById?id=<%=scanImageList.get(i).getId()%>"  onload="AutoResizeSwiperSlideImage(document.body.clientWidth, 0.16, this);" />
					<label  style="position:absolute; ; top: 0%; margin-left:-80% ;  text-align: center; width: 100%;  z-index: 1; color: black;"><%=scanImageList.get(i).getImgDesc()%></label> 
					</a>
				</div>
			<%} %>
            <!-- <div class="swiper-slide">Slide 1</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
            <div class="swiper-slide">Slide 4</div>-->
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
    <script src="js/swiper.min.js"></script>
	<script>
    	var appendNumber = 4;
    	var prependNumber = 1;
    	var swiper = new Swiper('.swiper-container', {
        	pagination: '.swiper-pagination',
        	nextButton: '.swiper-button-next',
        	prevButton: '.swiper-button-prev',
        	slidesPerView: 5,
        	centeredSlides: true,
			loop: true,
			autoplay: 1500,
        	paginationClickable: true,
        	spaceBetween: 30,
        });
    </script>
	<div class="new">
		<div style="margin:0px 0px 0px 0px;font-weight: bold; font-size: 16px;"><font color="blue">最新文章</font></div>
    	<table class="newtable"  rules="rows" >
    		<%for(int i=0; i<articleList.size(); i++) { %>
    			<%
    					Article article=articleList.get(i);
    					String article_s;
    					if(article.getTitle().length()>16) {
    						article_s=article.getTitle().substring(0, 16);
    						article_s=article_s+"......";
    					}
    					else {
    						article_s=article.getTitle();
    					}
    			%>
    			<tr>
    				<td align="left"><a href="article!getArticle?id=<%=article.getId() %>"  style="color: black;"  data-ajax="false"><%=article_s%></a></td>
    				<td align="right"><%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;<%=article.getTime() %>&nbsp;&nbsp;</td>
    			</tr>
    		<%} %>
		</table>
	</div>
	<div class="hot">
		<div style="font-weight: bold; font-size: 16px;"><font color="blue">最热文章</font></div>
    	<table class="hottable"  rules="rows">
    		<%for(int i=0; i<articleList.size(); i++) { %>
    			<%
    					Article article=articleList.get(i);
    					String article_s;
    					if(article.getTitle().length()>16) {
    						article_s=article.getTitle().substring(0, 16);
    						article_s=article_s+"......";
    					}
    					else {
    						article_s=article.getTitle();
    					}
    			%>
    			<tr height="30px">
    				<td align="left"><a href="article!getArticle?id=<%=article.getId() %>"  style="color: black;"  data-ajax="false"><%=article_s %></a></td>
    				<td align="right"><%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;<%=article.getTime() %>&nbsp;&nbsp;</td>
    			</tr>
    		<%} %>
		</table>
	</div>
	<div class=separate></div>
	<div class="website">
		<div class="websitefont"><font>推荐网址</font></div>
		<div class="websitelink">
			<div> <a href="https://www.sanwen8.cn/"> <img src="t1.jpg"  /></a></div>
			<div><a href="https://www.sanwen8.cn/"> <img src="t2.jpg"  /></a></div>
			<div><a href="https://www.sanwen8.cn/"> <img src="t3.jpg"  /></a></div>
			<div><a href="https://www.sanwen8.cn/"> <img src="t4.jpg"  /></a></div>
			<div><a href="https://www.sanwen8.cn/"> <img src="t5.png"  /></a></div>
			<div><a href="https://www.sanwen8.cn/"> <img src="t6.png"  /></a></div>
		</div>
	</div>
	<div class="ad"></div>
	
</body>
</html>