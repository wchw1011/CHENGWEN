package com.chengwen.util;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	protected int[] pageSizeList={3,5,10,20,50,100,200,300,500};
	protected int pageSize=Constants.pageSize;
	protected int pageNo=Constants.pageNo;
	//璁板綍鎬绘暟
	protected int rowCount=0;
	//鎬婚〉鏁�	
	protected int pageCount=1;
	//璧峰琛屾暟
	protected int startIndex=1;
	//缁撴潫琛屾暟
	protected int endIndex=1;
	protected int firstPageNo=1;
	protected int prePageNo=1;
	protected int nextPageNo=1;
	protected int lastPageNo=1;
	//缁撴灉闆嗗瓨鏀綥ist
	protected List resultList;
	
	public Pager(int pageSize, int pageNo, int rowCount, List resultList) {
		this.pageSize=pageSize;
		this.pageNo=pageNo;
		this.rowCount=rowCount;
		this.resultList=resultList;
		if(rowCount % pageSize==0) {
			this.pageCount=rowCount/pageSize;
		}
		else {
			this.pageCount=rowCount/pageSize+1;
		}
		this.startIndex=pageSize*(pageNo)-1;
		this.endIndex=this.startIndex+resultList.size();
		
		this.lastPageNo=this.pageCount;
		if(this.pageNo>1) {
			this.prePageNo=this.pageNo-1;
		}
		if(this.pageNo>=this.lastPageNo) {
			this.nextPageNo=this.lastPageNo;
		}
		else {
			this.nextPageNo=this.pageNo+1;
		}
	}
	
	
	public int[] getPageSizeList() {
		return pageSizeList;
	}


	public int getPageSize() {
		return pageSize;
	}


	public int getPageNo() {
		return pageNo;
	}


	public int getRowCount() {
		return rowCount;
	}


	public int getPageCount() {
		return pageCount;
	}


	public int getStartIndex() {
		return startIndex;
	}


	public int getEndIndex() {
		return endIndex;
	}


	public int getFirstPageNo() {
		return firstPageNo;
	}


	public int getPrePageNo() {
		return prePageNo;
	}


	public int getNextPageNo() {
		return nextPageNo;
	}


	public int getLastPageNo() {
		return lastPageNo;
	}


	public void setPageSizeList(int[] pageSizeList) {
		this.pageSizeList = pageSizeList;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}


	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}


	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}


	public void setPrePageNo(int prePageNo) {
		this.prePageNo = prePageNo;
	}


	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}


	public void setLastPageNo(int lastPageNo) {
		this.lastPageNo = lastPageNo;
	}


	public void setResultList(List resultList) {
		this.resultList = resultList;
	}


	public Object[] getPageSizeIndexs() {
		List result=new ArrayList(pageSizeList.length);
		for(int i=0;i<pageSizeList.length;i++) {
			result.add(String.valueOf(pageSizeList[i]));
		}
		Object[] indexs=result.toArray();
		return indexs;
	}
	public Object[] getPageNoIndexs() {
		List result=new ArrayList(pageCount);
		for(int i=0;i<pageCount;i++) {
			result.add(String.valueOf(i+1));
		}
		Object[] indexs=result.toArray();
		return indexs;
	}
	
	public List getResultList() {
		return resultList;
	}
}
