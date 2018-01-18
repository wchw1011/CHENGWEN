<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/struts-tags.tld" prefix="s" %>
    <%@ page import="java.util.List"%>
    <%@ page import="com.chengwen.pojo.Article"%>
    <%@ page import="com.chengwen.util.Pager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>prosepage_pc.jsp</title>
<style type="text/css">
	*{margin: 0;padding: 0;}	/*浏览器都有自己的默认外边距，这个操作是为了取消这个默认的边距*/
	
	
	.proseBox {
		width: 60%;
    	background: #ADD8E6;
    	margin-left: 10%;
    	display:inline-block;
	}
	.seqence {
		width: 90%;
		height: 30px;
	}
	.seqence nav {
  		width:100%;
  		mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, #ffffff 25%, #ffffff 75%, rgba(255, 255, 255, 0) 100%);
	}
	.seqence nav ul {
  		text-align: left;
		background: linear-gradient(90deg, rgba(255, 255, 255, 0) 0%, rgba(255, 255, 255, 0.2) 25%, rgba(255, 255, 255, 0.2) 75%, rgba(255, 255, 255, 0) 100%);
		box-shadow: 0 0 25px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
	}
	.seqence nav ul li {
  		display: inline-block;
	}
	.seqence nav ul li a {
		padding-left:25px;
  		padding-right:25px;
  		font-family: "Open Sans";
  		text-transform:uppercase;
  		color: #3D6D17;
  		font-size: 14px;
  		text-decoration: none;
  		display: block;
	}
	.seqence nav ul li a:hover {
  		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1), inset 0 0 1px rgba(255, 255, 255, 0.6);
  		background: white;
  		color:#3D6D17;
	}
	.seqence nav ul li a:VISITED {
		background: white;	
	}
	.proseContent {
		width: 100%;
	}
	.proseTable {
		width: 100%;
	}
	.skipPage {
		width: 100%;
		background: yellow;
	}
	.proseTable  tr:hover  {
		background-color: yellow;
		color: blue;
	}
	.skipPage font {
		font-size: 12px;
	}
	.skipPage a {
		text-decoration: none;
	}
</style>
<script type="text/javascript">
	function selectSeqence(currentSelect) {
		currentSelect.style.background='white';
		alert(currentSelect.id);
	}
</script>
</head>
<body>
	<%
		Pager pager=(Pager)request.getAttribute("pager");
		List<Article> articleList=pager.getResultList();
		System.out.println("--------------------------------->pager articleList size():"+articleList.size());
	%>
	<jsp:include page="logo_pc.jsp" flush="true"></jsp:include>
	<jsp:include page="menu_pc.jsp" flush="true"></jsp:include>
	<div class="proseBox">
		<div class="seqence">
			<nav>
				<ul>
					<li><a href="article_pc!enterProsePage?pageSize=12&pageNo=1&articleListOrder=01">默认排序</a></li>
					<li><a href="article_pc!enterProsePage?pageSize=12&pageNo=1&articleListOrder=02" id="select2" onclick="selectSeqence(this)">时间升序</a></li>
					<li><a href="article_pc!enterProsePage?pageSize=12&pageNo=1&articleListOrder=03">时间降序</a></li>
					<li><a href="article_pc!enterProsePage?pageSize=12&pageNo=1&articleListOrder=04">人气</a></li>
				</ul>
			</nav>
		</div>
		<div class="proseContent">
			<table class="proseTable" rules="rows">
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
    				<td align="right"><%=article.getVisits()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=article.getAuthor() %>&nbsp;&nbsp;&nbsp;<%=article.getTime() %>&nbsp;&nbsp;</td>
    			</tr>
    			<%} %>
			</table>
		</div>
		<div class="skipPage">
				<!-- 共<s:property value='articlePager.rowCount'/>条记录&nbsp;&nbsp;
				<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='articlePager.firstPageNo'/>&pageSize=<s:property value='pageSize' />">首页</a>
				<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='articlePager.prePageNo'/>&pageSize=<s:property value='pageSize'/>">前一页</a>
				<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='articlePager.nextPageNo'/>&pageSize=<s:property value='pageSize'/>">下一页</a>
				<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='articlePager.lastPageNo'/>&pageSize=<s:property value='pageSize'/>">尾页</a>-->
				<font>共<s:property value='pager.rowCount'/>条记录&nbsp;&nbsp;共<s:property value='pager.pageCount'/>页&nbsp;&nbsp;当前第<s:property value='pager.pageNo'/>页</font>
				<font>
					<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='pager.firstPageNo'/>&pageSize=<s:property value='pageSize' />&articleListOrder=<s:property value='articleListOrder' />">首页</a>
					<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='pager.prePageNo'/>&pageSize=<s:property value='pageSize'/>&articleListOrder=<s:property value='articleListOrder' />">前一页</a>
					<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='pager.nextPageNo'/>&pageSize=<s:property value='pageSize'/>&articleListOrder=<s:property value='articleListOrder' />">下一页</a>
					<a class="page_link" href="article_pc!enterProsePage?pageNo=<s:property value='pager.lastPageNo'/>&pageSize=<s:property value='pageSize'/>&articleListOrder=<s:property value='articleListOrder' />">尾页</a>
				</font>
				<form action="article_pc!enterProsePage" style="display: inline;">
					&nbsp;&nbsp;<font>第<input type="text"  name="pageNo" size="5">页</font>
					<input type="hidden" name="pageSize" value='<s:property value='pageSize'/>'  >
					<input type="hidden" name="articleListOrder" value='<s:property value='articleListOrder' />'  >
					<input type="submit"  value="跳转">
				</form>
		</div>
	</div>
	
	
	
</body>
</html>