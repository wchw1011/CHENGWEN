<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="js/jquery.mobile-1.4.5.css">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.mobile-1.4.5.js"></script>
<script>
	$(document).on("pagecreate",function(){
	}); 

</script>

<style type="text/css">
.ui-page { 
	background:#E0FFFF	;
}
p{color:#EE00EE; font-size:20px;line-height:200%}


</style>

</head>
<body>
	<div data-role="page"  class="ui-page" >
  	<div data-role="main" class="ui-content">
  		<p style="font-size: 30px; line-height:100%" align="center">centos配置shadowsocks服务器<br><p style="font-size: 15px; color:blue; line-height:50%" align="right">——任天蓝&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p></p>
  		<p> 1、yum -y update</p>
  		<p> 2、yum -y  install python-pip</p>
  		<p>3、pip install shadowsocks</p>
  		<p>4、进入/etc目录，创建文件shadowsocks.json，在shadowsocks.json中加入以下内容：<br>
{<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"server":"47.90.122.118",<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"server_port":8388,<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"local_address": "127.0.0.1",<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"local_port":1080,<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; "password":"123",<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"timeout":300,<br>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"method":"aes-256-cfb"<br>
}<br></p>
  		<p>5、设置权限 sudo chmod 755 /etc/shadowsocks.json</p>
  		<p>6、此命令就为启动服务:sudo ssserver -p 8388 -k 123 -m aes-256-cfb -d start</p>
  		<p> 7、设置开机启动：<br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;进入/etc目录，在rc.local文件的exit 0 这一行的上边加入如下<br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/usr/local/bin/ssserver –c /etc/shadowsocks.json<br>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或者不在配置文件中设置，则使用/usr/local/bin/ssserver -p 8388 -k 123 -m aes-256-cfb -d start</p>

   	</div>

 	
</div> 
</body>
</html>