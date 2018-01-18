<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>junction</title>
<script type="text/javascript">
	var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire");
	var browser = navigator.userAgent.toLowerCase(); 
	var isMobile = false; 
	for (var i=0; i<mobileAgent.length; i++) {
		if (browser.indexOf(mobileAgent[i])!=-1) {
			isMobile = true;
			break;
		}
	}
	if(isMobile == true) {
		window.location.href = '\mobile\\forward.jsp';		//因为\f为转义字符，所以加上\\
	}
	else {
		window.location.href = '\pc/forward_pc.jsp';		//    '\pc\\forward_pc.jsp'此种语法chrome支持，但是firefox不支持
	}
</script>

</head>
<body>

</body>
</html>