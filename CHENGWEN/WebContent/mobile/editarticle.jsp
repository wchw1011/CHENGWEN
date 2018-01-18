<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 若解开注释，则使用本地的文件，效果没有引用网络文件的漂亮-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/jquery.mobile-1.4.5.css">

<link rel="stylesheet" href="css/swiper.min.css">
<script src="js/jquery.min.js"></script>

<script src="js/bootstrap.js"></script>
<script src="js/summernote.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/font-awesome.min.css">

 
 <!-- 下面的五行代码，是引用网络的文件，效果更好 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
 -->
<script>
function addarticle() {
	var sHTML2 = $('#summernote').code();
	alert($('#summernote').code())
	// 创建一个 form 
	  var form1 = document.createElement("form"); 
	  form1.id = "form1"; 
	  form1.name = "form1"; 
	  form1.enctype="multipart/form-data";
	// 创建一个输入 
	  var input_title;
	  var input_type;
	  var input_content = document.createElement("input"); 
	  var input_image;// = document.createElement("input"); 
	  // 设置相应参数 
	  input_content.type = "text"; 
	  input_content.name = "content"; 
	  input_content.value = $('#summernote').code();	
	  input_image =document.getElementById('image'); 
	  input_title=document.getElementById('title'); 
	  input_type=document.getElementById('type'); 
	  
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
</script>
</head>
<body>
		<s:select id="type"   name="type" headerKey="0" headerValue="请选择"  
        					 	list="articleTypeList"      listKey="id" listValue="typename"
          						 theme="simple"></s:select>
        <input  id="title"  type="text" name="title">
		<input id="image" type="file" name="image">
		<div id="summernote" >dsfdsfdsfgdfgdfg<br>lll</div>
        <div data-role="main" class="ui-content">
			<button class="ui-btn"   onclick="submit1()">按钮</button>
		</div>
		<input type="button" value="test"  onclick="addarticle()">
	<script>
	  	$('#summernote').summernote();
	  </script>
	  
</body>
</html>