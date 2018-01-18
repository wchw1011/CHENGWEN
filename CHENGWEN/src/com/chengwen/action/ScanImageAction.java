package com.chengwen.action;

import java.io.File;

import org.apache.struts2.ServletActionContext;

import com.chengwen.service.ArticleService;
import com.opensymphony.xwork2.ActionSupport;

public class ScanImageAction extends ActionSupport {
	private int id;
	private String type;
	private String flag;
	private String imgdesc;

	private File image;
	private byte[] imageStream;
	private ArticleService articleService;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getImgdesc() {
		return imgdesc;
	}
	public void setImgdesc(String imgdesc) {
		this.imgdesc = imgdesc;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public byte[] getImageStream() {
		return imageStream;
	}
	public void setImageStream(byte[] imageStream) {
		this.imageStream = imageStream;
	}
	public ArticleService getArticleService() {
		return articleService;
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	public String insertScanImage() {
		articleService.addScanImage("01", "01",imgdesc, image);
		return "editscanimage";
	}
	
	public String getScanImageById() {
		System.out.println("ScanImageAction getScanImageById------------------------------------------------>id:"+getId());
		byte[] imageStream=	getArticleService().getScanImageById(id).getImage();
		System.out.println("ScanImageAction getScanImageById------------------------------------------------>imageStream:"+imageStream.length);
		ServletActionContext.getRequest().setAttribute("imageStream", imageStream);
		return "articleimage";
	}
	
}
