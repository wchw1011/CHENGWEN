package com.chengwen.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chengwen.pojo.ArticleType;

public class ArticleTypeRowMapper implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ArticleType articleType=new ArticleType();
		articleType.setId(rs.getString("id"));
		articleType.setTypename(rs.getString("typename"));
		return articleType;
	}

}
