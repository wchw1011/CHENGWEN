package com.chengwen.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chengwen.pojo.Article;

/*
 * 对于Article中的除去content之外的属性进行设置，因为content太大，传输时浪费资源
 */
public class ArticleNoContentRowMapper implements RowMapper {
	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Article article=new Article();
		article.setId(rs.getInt("id"));
		article.setTitle(rs.getString("title"));
		article.setType(rs.getString("type"));
		article.setTime(rs.getString("time"));
		article.setAuthor(rs.getString("author"));
		article.setHot(rs.getString("hot"));
		article.setVisits(rs.getInt("visits"));
		return article;
	}

}
