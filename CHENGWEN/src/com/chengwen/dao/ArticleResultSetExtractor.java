package com.chengwen.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.chengwen.pojo.Article;

public class ArticleResultSetExtractor implements ResultSetExtractor{
	
	@Override
	public Object extractData(ResultSet rs) throws SQLException,
			DataAccessException {
		// TODO Auto-generated method stub
		Article article=new Article();
		rs.next();
		article.setId(rs.getInt("id"));
		article.setTitle(rs.getString("title"));
		article.setType(rs.getString("type"));
		article.setTime(rs.getString("time"));
		article.setAuthor(rs.getString("author"));
		article.setContent(rs.getString("content"));
		article.setVisits(rs.getInt("visits"));
		return article;
	}



}
