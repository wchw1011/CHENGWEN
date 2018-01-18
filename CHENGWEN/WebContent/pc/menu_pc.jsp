<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu_pc</title>
	<style type="text/css">
		/*主菜单*/
		.menu {
			background: #ADD8E6;
			width: 80%;
			margin-left: 10%;
		}
		.menu nav {
  			width:100%;
  			mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
		}
		.menu nav ul {
  			text-align: center;
			background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
			box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
		}
		.menu nav ul li {
  			display: inline-block;
		}
		.menu nav ul li a {
  			padding: 18px;
  			padding-left:50px;
  			padding-right:50px;
  			font-family: "Open Sans";
  			text-transform:uppercase;
  			color: rgba(0, 35, 122, 0.5);
  			font-size: 18px;
  			text-decoration: none;
  			display: block;
		}
		.menu nav ul li a:hover {
  			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
  			background: rgba(255, 255, 255, 0.1);
  			color: rgba(0, 35, 122, 0.7);
		}
	</style>
</head>
<body>
	<div class="menu">
		<nav>
			<ul>
				<li><a href="article_pc!enterHomePage">首页</a></li>
				<li><a href="article_pc!enterProsePage?pageSize=12&pageNo=1&articleListOrder=01">散文</a></li>
				<li><a href="#">原创</a></li>
				<li><a href="#">技术</a></li>
				<li><a href="#">发表</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>