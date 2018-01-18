package com.chengwen.action;

import com.chengwen.util.Constants;
import com.chengwen.util.Pager;



public class PageAction extends BaseAction{
	protected int pageSize=Constants.pageSize;
	protected int pageNo=Constants.pageNo;
	protected Pager pager;
	
	public int getPageSize() {
		return pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
}
