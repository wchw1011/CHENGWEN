package com.chengwen.service;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.chengwen.dao.ArticleDao;
import com.chengwen.dao.ArticleImageDao;
import com.chengwen.dao.ArticleTypeDao;
import com.chengwen.pojo.Article;
import com.chengwen.pojo.ArticleImage;
import com.chengwen.pojo.ArticleType;
import com.chengwen.pojo.ScanImage;
import com.chengwen.util.Pager;

/*
 * ArticleService既处理ArticleDao又处理ArticleImageDao，这样设计的原因是在ArticleService中进行了事务处理，要保证Article和ArticleImage的一致性；
 * 
 */
public class ArticleService {
	private ArticleDao articleDao;
	private ArticleTypeDao articleTypeDao;
	private ArticleImageDao articleImageDao; 
	
	public ArticleDao getArticleDao() {
		return articleDao;
	}
	public void setArticleDao(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	public ArticleTypeDao getArticleTypeDao() {
		return articleTypeDao;
	}
	public void setArticleTypeDao(ArticleTypeDao articleTypeDao) {
		this.articleTypeDao = articleTypeDao;
	}
	public ArticleImageDao getArticleImageDao() {
		return articleImageDao;
	}
	public void setArticleImageDao(ArticleImageDao articleImageDao) {
		this.articleImageDao = articleImageDao;
	}
	/*
	 * 每时刻最多只允许一个进程进入该方法，目的是确保article表和articleimage表的一致性
	 */
	public synchronized void  addArticle(String title, String type, String time, String author, String hot, String content, File image) {
		System.out.println("ArticleService addArticle ----------------------------------->content:"+content);
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		time=format.format(date);
		if("".equals(author) || author==null) {
			author="游客";
		}
		Article article=new Article();
		article.setTitle(title);
		article.setType(type);
		article.setTime(time);
		article.setAuthor(author);
		article.setHot(hot);
		article.setContent(content);
		articleDao.addArticle(article);
		if(image!=null) {
			int maxArticleId=articleDao.getMaxId();
			articleImageDao.addArticleImage(image,maxArticleId);
		}
	}
	
	public void addScanImage(String type, String flag, String imgdesc, File image) {
		articleImageDao.addScanImage(type, flag, imgdesc, image);
	}
	
		
	/*
	 * 根据articleid获取articleimage表中的Id，然后讲这些iD以List集合的形式返回
	 */
	public List<String> getIdByArticleId(int articleid) {
		return articleImageDao.getIdByArticleId(articleid);
	}
	/*
	 * 根据flag获取scanimage(不包含image属性)的列表
	 */
	public List<ScanImage> getScanImageNoImageList(String flag) {
		return articleImageDao.getScanImageNoImageList(flag);
	}
	
	public ArticleImage getArticleImageById(int id) {
		System.out.println("ArticleService  getArticleImageById------------------------------------------->articleImageDao:"+articleImageDao);
		return getArticleImageDao().getArticleImageById(id);
	}
	
	public ArticleImage getArticleImageByArticleId(int articleId) {
		return getArticleImageDao().getArticleImageByArticleId(articleId); 
	}
	
	public boolean hasArticleImageByArticleId(int articleId) {
		ArticleImage articleImage=getArticleImageDao().getArticleImageByArticleId(articleId);
		if(articleImage.getImage()==null) {
			return false;
		}
		return true;
	}
	
	public ScanImage getScanImageById(int id) {
		return getArticleImageDao().getScanImageById(id);
	}
	
	public String getScanImageDescById(int id) {
		return getArticleImageDao().getScanImageDescById(id);
	}
	
	
	
	public List<ArticleType> getArticleTypeList() {
		return articleTypeDao.getArticleTypeList();
	}
	
	/*
	 * 返回的Article列表用于显示到homepage中， Article不包含content
	 */
	public List<Article> getHomePageArticleList() {
		return articleDao.getHomePageArticleList();
	}
	
	public Pager getArticleListPage(int pageSize, int pageNo, String type, String articleListOrder) {
		 int rowCount=articleDao.getArticleNumByType(type);
		 if(pageNo>(rowCount/pageSize)+1) {//因为在手动输入页号进行跳转时，可能输入的页码大于总页数，因此加此卡口。另外下一页越界的卡口，是在Pager类中实现的。
			 pageNo=(rowCount/pageSize)+1;
		 }
		 List<Article> articleList = null;
		 if("".equals(articleListOrder) || "01".equals(articleListOrder)) {
			 articleList =articleDao.getArticleListPage(pageSize, pageNo, type);
		 }
		 if("02".equals(articleListOrder)) {
			 articleList =articleDao.getArticleListPageOrderTimeAsc(pageSize, pageNo, type);
		 }
		 if("03".equals(articleListOrder)) {
			 articleList =articleDao.getArticleListPageOrderTimeDesc(pageSize, pageNo, type);
		 }
		 if("04".equals(articleListOrder)) {
			 articleList =articleDao.getArticleListPageOrderVisitsDesc(pageSize, pageNo, type);
		 }
		 
		 Pager pager=new Pager(pageSize, pageNo, rowCount, articleList);
		return pager;
	}
	
	public Article getArticleById(int id) {
		Article article=articleDao.getArticleById(id);
		article.setContent(article.getContent().replaceAll(" ", "&nbsp"));
		article.setContent(article.getContent().replaceAll("[\\n\\r]", "</p><p>"));
		article.setContent("<p>"+article.getContent()+"</p>");
		//article.setContent(article.getContent().substring(0, article.getContent().length()-3));
		System.out.println(article.getContent());
		System.out.println("ArticleService getArticleById--------------------------->visits:"+articleDao.increaseArticleVisits(id));
		//articleDao.increaseArticleVisits(id);	//增加ariticle的访问量
		return article;
	}
	
	
}
