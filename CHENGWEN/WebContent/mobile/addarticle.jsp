<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>addarticle</title>

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
<script  type="text/javascript">
function addarticle() {
	// 创建一个 form 
	  var form1 = document.createElement("form"); 
	  form1.id = "form1"; 
	  form1.name = "form1"; 
	  form1.enctype="multipart/form-data";
	// 创建一个输入 
	  var input_title;
	  var input_type;
	  var input_content ;//= document.createElement("input"); 
	  var input_image;
	  // 设置相应参数 
	//  input_content.value = ;	
	  input_image =document.getElementById('image'); 
	  input_title=document.getElementById('title'); 
	  input_type=document.getElementById('type'); 
	  input_content=document.getElementById('content'); 
	  if(input_type.value=='0') {
		  alert('请选择类型');
		  return;
	  }
	  if(input_title.value=="") {
		  alert('请写标题');
		  return;
	  }
	  if(input_content.value=="") {
		  alert('请填写内容');
		  return;
	  }
	  // 将输入框插入到 form 中 
	  form1.appendChild(input_title); 
	  form1.appendChild(input_type); 
	  form1.appendChild(input_image); 
	  form1.appendChild(input_content); 
	  // form 的提交方式 
	  form1.method = "POST"; 
	  // form 提交路径 
	  form1.action = "article!insertArticle"; 
	  // 对该 form 执行提交 
	  form1.submit(); 
}

function refresh() {
	location.reload(true);
}
</script>
</head>
<body >

		
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
	
		<table width="100%">
			<tr bgcolor="#FFE4C4">
				<td width="20%">文章类型：</td>
				<td width="80%"><s:select id="type"   name="type" headerKey="0" headerValue="请选择"  
        					 	list="articleTypeList"      listKey="id" listValue="typename"
          						 theme="simple"></s:select></td>
			</tr>
			<tr bgcolor="#FFFACD">
				<td> 标题：</td>
				<td><input  id="title"  type="text" name="title"></td>
			</tr>
			<tr bgcolor="#FFE4C4">
				<td>代表图片：</td>
				<td><input id="image" type="file" name="image"></td>
			</tr>
			<tr  bgcolor="#FFFACD">
				<td>内容：</td>
				<td><textarea  id="content"  rows="30"  cols="80%" style="overflow-y:display"  name="content"   ></textarea></td>
			</tr>
			<tr bgcolor="#FFFACD">
				<td>	<input type="button" value="提交"  width="100%" height="20"  onclick="addarticle()" ></td>
				<td></td>
			</tr>
		</table>
		
		<!-- 
		文章类型：<s:select id="type"   name="type" headerKey="0" headerValue="请选择"  
        					 	list="articleTypeList"      listKey="id" listValue="typename"
          						 theme="simple"></s:select><br>
        标题：<input  id="title"  type="text" name="title"><br>
		代表图片：<input id="image" type="file" name="image"><br>
		内容：<textarea  id="content"  rows="10"  name="content"   ></textarea><br>
		<input type="button" value="提交"  onclick="addarticle()">
 -->
</body>
</html>