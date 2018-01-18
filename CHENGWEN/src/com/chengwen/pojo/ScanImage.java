package com.chengwen.pojo;

/*
 * 在homepage中看到的滑动图片
 */
public class ScanImage {
	private int id;
	private String type;	//01散文，02原创，03技术	暂时不用
	private String flag;	//筛选标志	01为筛选
	private String imgDesc;	//图片描述
	private byte[] image;
	
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
	public String getImgDesc() {
		return imgDesc;
	}
	public void setImgDesc(String imgDesc) {
		this.imgDesc = imgDesc;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
}
