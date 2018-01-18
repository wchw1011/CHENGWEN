<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>editscanimage</title>
<script>
function addscanimage() {
	// 创建一个 form 
	  var form1 = document.createElement("form"); 
	  form1.id = "form1"; 
	  form1.name = "form1"; 
	  form1.enctype="multipart/form-data";
	// 创建一个输入 
	  var input_image;// = document.createElement("input"); 
	  // 设置相应参数 
	  input_image =document.getElementById('image');  
	  input_imgdesc =document.getElementById('imgdesc');  
	  // 将输入框插入到 form 中 
	  form1.appendChild(input_image); 
	  form1.appendChild(input_imgdesc); 
	  // form 的提交方式 
	  form1.method = "POST"; 
	  // form 提交路径 
	  form1.action = "scanImage!insertScanImage"; 
	  // 对该 form 执行提交 
	  form1.submit(); 
}
</script>
</head>
<body>
<input id="image" type="file" name="image">
<input id="imgdesc" type="text" name="imgdesc">
<input type="button" value="添加"  onclick="addscanimage()">
</body>
</html>