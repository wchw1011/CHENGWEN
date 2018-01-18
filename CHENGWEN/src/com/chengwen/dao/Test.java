package com.chengwen.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.chengwen.pojo.Article;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext ac = new FileSystemXmlApplicationContext("applicationContext.xml"); 
		ArticleDao articleDao=(ArticleDao) ac.getBean("articleDao");
		Article article=articleDao.getArticleById(100033);
		
		//List<Article> articles=articleDao.getArticleListPage(1, 2);
		System.out.println("-------------------------------------------->"+article);
	}

}
