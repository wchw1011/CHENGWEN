package com.chengwen.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.chengwen.service.ArticleService;
import com.opensymphony.xwork2.ActionSupport;

public class ArticleImageAction extends ActionSupport{
	private String id;
	private String imageId;
	private byte[] image;
	private ArticleService articleService;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImageId() {
		return imageId;
	}
	public void setImageId(String imageId) {
		this.imageId = imageId;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String getArticleImageStreamById() { 
		System.out.println("ArticleImageAction getArticleImageStreamById------------------------------------------------>id:"+getId());
		byte[] imageStream=getArticleService().getArticleImageById(Integer.parseInt(id)).getImage();
		ServletActionContext.getRequest().setAttribute("imageStream", imageStream);
		return "articleimage";
	}
	
	public String test4() {
		List<String> idList=articleService.getIdByArticleId(100001);
		ServletActionContext.getRequest().setAttribute("idList", idList);
		return "test4";
	}
	
}
