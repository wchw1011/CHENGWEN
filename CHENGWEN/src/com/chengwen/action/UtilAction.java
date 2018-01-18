package com.chengwen.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.chengwen.dao.ArticleDao;
import com.chengwen.service.ArticleService;
import com.opensymphony.xwork2.ActionSupport;


public class UtilAction extends ActionSupport{
	private String imgId;
	private byte[] imageSteam;
	private ArticleService articleService;
	
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public byte[] getImageSteam() {
		return imageSteam;
	}
	public void setImageSteam(byte[] imageSteam) {
		this.imageSteam = imageSteam;
	}
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String getArticleImgStreamById() {
		System.out.println("UtilAction getArticleImgStreamById------------------------------------------>");
		byte[] imageStream=articleService.getArticleImageById(100001).getImage();
		ServletActionContext.getRequest().setAttribute("imageStream", imageStream);
		return "articleimage";
	}
}
