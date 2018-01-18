package com.chengwen.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.chengwen.pojo.Article;
import com.chengwen.pojo.ArticleImage;
import com.chengwen.pojo.ArticleType;
import com.chengwen.pojo.ScanImage;
import com.chengwen.service.ArticleService;
import com.chengwen.service.ArticleTypeService;
import com.chengwen.util.Pager;

public class ArticleAction  extends PageAction{
	private String id;
	private String title;
	private String type;
	private String time;
	private String author;
	private String content;
	private File image;
	private byte[] imageSteam;
	private String articleListOrder;	//01默认排序，02时间升序，03时间降序，04访问量排序

	private Pager articlePager;
	
	private List<ArticleType> articleTypeList;
	private List<Article> articleList;

	private ArticleService articleService;
	private ArticleTypeService articleTypeService;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public byte[] getImageSteam() {
		return imageSteam;
	}
	public void setImageSteam(byte[] imageSteam) {
		this.imageSteam = imageSteam;
	}
	public String getArticleListOrder() {
		return articleListOrder;
	}
	public void setArticleListOrder(String articleListOrder) {
		this.articleListOrder = articleListOrder;
	}
	public Pager getArticlePager() {
		return articlePager;
	}
	public void setArticlePager(Pager articlePager) {
		this.articlePager = articlePager;
	}
	public List<ArticleType> getArticleTypeList() {
		return articleTypeList;
	}
	public void setArticleTypeList(List<ArticleType> articleTypeList) {
		this.articleTypeList = articleTypeList;
	}
	public List<Article> getArticleList() {
		return articleList;
	}
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	public ArticleTypeService getArticleTypeService() {
		return articleTypeService;
	}
	public void setArticleTypeService(ArticleTypeService articleTypeService) {
		this.articleTypeService = articleTypeService;
	}
	
	public String insertArticle() {
		//time的值先为空，在service中获取当前时间并赋值，写上是为了保持统一性
		System.out.println("ArticleAction  addArticle------------------------------------------->content:"+getContent());
		System.out.println("ArticleAction  addArticle------------------------------------------->image:"+getImage());
		articleService.addArticle(title, type, time, author, "02", content, image);	//表示该文章不热，即在首页不显示
		return "insertarticlesuccess";
	}
	
	/*
	 *  进入addarticle.jsp   ,   jquerymobile模式
	 */
	public String editArticle() {
		System.out.println("ArticleAction  editArticle------------------------------------------->");
		List<ArticleType> articleTypeList=articleService.getArticleTypeList();
		System.out.println("ArticleAction  editArticle------------------------------------------->articleTypeList:"+articleTypeList);
		//ServletActionContext.getRequest().setAttribute("articleTypeList", articleTypeList);
		setArticleTypeList(articleTypeList);
		return "editarticle";
	}
	/*
	 * 进入addarticle.jsp   非jquerymobile模式
	 */
	public String addArticle() {
		System.out.println("ArticleAction  addArticle------------------------------------------->");
		List<ArticleType> articleTypeList=articleService.getArticleTypeList();
		System.out.println("ArticleAction  addArticle------------------------------------------->articleTypeList:"+articleTypeList);
		//ServletActionContext.getRequest().setAttribute("articleTypeList", articleTypeList);
		setArticleTypeList(articleTypeList);
		return "addarticle";
	}
	
	/*
	 *  进入editscanimage.jsp
	 */
	public String addScanImage() {
		return "editscanimage";
	}
	
	/*
	 * 进入首页
	 */
	public String enterHomePage() {
		List<Article> articleList=articleService.getHomePageArticleList();
		List<ScanImage> scanImageList=articleService.getScanImageNoImageList("01");
		ServletActionContext.getRequest().setAttribute("articleList", articleList);
		ServletActionContext.getRequest().setAttribute("scanImageList", scanImageList);
		return "homepage";
	}
	/*
	 * 进入散文页
	 */
	public String enterProsePage() {
		pager=articleService.getArticleListPage(pageSize, pageNo, "01", articleListOrder);
		System.out.println("ArticleAction  enterProsePage------------------------------------------->getPageSize():"+getPageSize()+"    getPageNo():"+getPageNo()+"   getArticleListOrder():"+getArticleListOrder()+"    pager roecount:"+pager.getRowCount());
		ServletActionContext.getRequest().setAttribute("pager", pager);
		//setArticlePager(pager);
		return "prosepage";
	}
	
	public String enterOriginalPage() {
		pager=articleService.getArticleListPage(pageSize, pageNo, "02", articleListOrder);
		System.out.println("ArticleAction  enterOriginalPage------------------------------------------->getPageSize():"+getPageSize()+"    getPageNo():"+getPageNo()+"    pager roecount:"+pager.getRowCount());
		ServletActionContext.getRequest().setAttribute("pager", pager);
		setArticlePager(pager);
		return "originalpage";
	}
	
	public String enterTechnologyPage() {
		pager=articleService.getArticleListPage(pageSize, pageNo, "03", articleListOrder);
		System.out.println("ArticleAction  enterTechnologyPage------------------------------------------->getPageSize():"+getPageSize()+"    getPageNo():"+getPageNo()+"    pager roecount:"+pager.getRowCount());
		ServletActionContext.getRequest().setAttribute("pager", pager);
		setArticlePager(pager);
		return "technologypage";
	}
	
	/*
	 * 显示Article的内容
	 */
	public String getArticle() {
		Article article=articleService.getArticleById(Integer.parseInt(id));
		System.out.println("ArticleAction  getArticle-------------------------------->author:"+article.getAuthor());
		ServletActionContext.getRequest().setAttribute("article", article);
		return "articlepage";
	}
	
	/*
	 * 根据ArticleId获取图片，目前一个article对应一个图片
	 */
	public String getArticleImageByArticleId() {
		System.out.println("ArticleAction getArticleImageByArticleId------------------------------------------------>id:"+getId());
		byte[] imageStream=articleService.getArticleImageByArticleId(Integer.parseInt(getId())).getImage();
		ServletActionContext.getRequest().setAttribute("imageStream", imageStream);
		return "articleimage";
	}
	
	
	
	
	
	
}
