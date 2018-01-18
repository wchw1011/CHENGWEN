package com.chengwen.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.chengwen.pojo.Article;
/*
 * 用于jdbcTemplate.query中的条件查询
 */
public class ArticleListNoContentExtractor implements ResultSetExtractor{

	@Override
	public Object extractData(ResultSet rs) throws SQLException,
			DataAccessException {
		// TODO Auto-generated method stub
		List<Article> articleList=new ArrayList<Article>();
		while(rs.next()) {
			Article article=new Article();
			article.setId(rs.getInt("id"));
			article.setTitle(rs.getString("title"));
			article.setType(rs.getString("type"));
			article.setTime(rs.getString("time"));
			article.setAuthor(rs.getString("author"));
			article.setVisits(rs.getInt("visits"));
			articleList.add(article);
		}
		return articleList;
	}

}
