package com.chengwen.service;

import java.util.List;

import com.chengwen.dao.ArticleTypeDao;
import com.chengwen.pojo.ArticleType;

public class ArticleTypeService {
	private ArticleTypeDao articleTypeDao;

	public ArticleTypeDao getArticleTypeDao() {
		return articleTypeDao;
	}
	public void setArticleTypeDao(ArticleTypeDao articleTypeDao) {
		this.articleTypeDao = articleTypeDao;
	}
	
	public List<ArticleType> getArticleTypeList() {
		return articleTypeDao.getArticleTypeList();
	}
	

}
