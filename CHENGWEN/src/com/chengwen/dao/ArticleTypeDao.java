package com.chengwen.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.chengwen.pojo.ArticleType;

public class ArticleTypeDao {
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<ArticleType> getArticleTypeList() {
		List<ArticleType>  articleTypeList=jdbcTemplate.query("select * from articletype", new ArticleTypeRowMapper());
		return articleTypeList;
	}
	
	
	
}
