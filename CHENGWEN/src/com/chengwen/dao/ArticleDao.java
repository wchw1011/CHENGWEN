package com.chengwen.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;

import com.chengwen.pojo.Article;
import com.chengwen.pojo.ArticleImage;

public class ArticleDao {
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public void addArticle(Article article) {
		System.out.println("ArticleDao addArticle ----------------------------------->");
		getJdbcTemplate().update("insert into article(title, type, time, author, hot, content) values(?, ?, ?, ?, ?, ?)", new Object[]{article.getTitle(), article.getType(), article.getTime(), article.getAuthor(), article.getHot(), article.getContent() });
	}
	
	/*
	 * 每个article中无content
	 */
	public List<Article> getArticleListPage(int pageSize, int pageNo, String type) {
		List<Article> articleList=(List<Article>) jdbcTemplate.query("select * from article where type=?  order by time desc limit ?, ? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setString(1, type);
				pre.setInt(2,  (pageNo-1)*pageSize);
				pre.setInt(3, pageSize);
			}
		}, new ArticleListNoContentExtractor());
		return articleList;
	}
	
	/*
	 * 按照时间降序获取Article列表
	 * 每个article中无content
	 */
	public List<Article> getArticleListPageOrderTimeDesc(int pageSize, int pageNo, String type) {
		List<Article> articleList=(List<Article>) jdbcTemplate.query("select * from article where type=?  order by time desc limit ?, ? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setString(1, type);
				pre.setInt(2,  (pageNo-1)*pageSize);
				pre.setInt(3, pageSize);
			}
		}, new ArticleListNoContentExtractor());
		return articleList;
	}
	
	/*
	 * 按照时间升序获取Article列表
	 * 每个article中无content
	 */
	public List<Article> getArticleListPageOrderTimeAsc(int pageSize, int pageNo, String type) {
		List<Article> articleList=(List<Article>) jdbcTemplate.query("select * from article where type=?  order by time asc limit ?, ? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setString(1, type);
				pre.setInt(2,  (pageNo-1)*pageSize);
				pre.setInt(3, pageSize);
			}
		}, new ArticleListNoContentExtractor());
		return articleList;
	}
	
	/*
	 * 按照访问量降序获取Article列表
	 * 每个article中无content
	 */
	public List<Article> getArticleListPageOrderVisitsDesc(int pageSize, int pageNo, String type) {
		List<Article> articleList=(List<Article>) jdbcTemplate.query("select * from article where type=?  order by visits desc limit ?, ? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setString(1, type);
				pre.setInt(2,  (pageNo-1)*pageSize);
				pre.setInt(3, pageSize);
			}
		}, new ArticleListNoContentExtractor());
		return articleList;
	}
	
	/*
	 * 获取该类型下Article的数目
	 */
	public int getArticleNumByType(String type) {
		/*jdbcTemplate.query("select count(1) from article where type=? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setString(1, type);
			}
			
		}, new RowMapper() {
			@Override
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				return rs.getInt(1);
			}
			
		});*/
		int num=jdbcTemplate.queryForInt("select count(1) from article where type=? ", new Object[]{type});
		return num;
	}
	
	/*
	 * 返回的Article列表用于显示到homepage中， Article不包含content
	 */
	public List<Article> getHomePageArticleList() {
		//List<Article> articleList=jdbcTemplate.query("select * from article order by time desc limit 4", new ArticleNoContentRowMapper());
		List<Article> articleList=jdbcTemplate.query("select * from article where hot=01 order by time ", new ArticleNoContentRowMapper());
		return articleList;
	}
	
	public Article getArticleById(int id) {
		Article article=(Article) jdbcTemplate.query("select * from article where id=? ", new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement pre) throws SQLException {
				// TODO Auto-generated method stub
				pre.setInt(1, id);
			}
		}, new ArticleResultSetExtractor());
		return article;
	}
	
	/*
	 * 获取article中最新插入的记录的id
	 */
	public int getMaxId() {
		int maxId = jdbcTemplate.queryForInt("select max(id) from article");  
		return maxId;
	}
	
	/*
	 * Aritcle的访问量增1
	 * 返回值：当前访问量
	 */
	public int increaseArticleVisits(int id) {
		int visits=(int) getJdbcTemplate().execute("select visits from article where id=?", new PreparedStatementCallback() {
			@Override
			public Object doInPreparedStatement(PreparedStatement pres)
					throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				int visits=-2;
				pres.setInt(1, id);
				ResultSet rs=pres.executeQuery();
				if(rs.next()) {
					visits=rs.getInt(1);
				}
				return visits;
			}
		});
		
		getJdbcTemplate().execute("update article set visits=? where id=?", new PreparedStatementCallback() {
			@Override
			public Object doInPreparedStatement(PreparedStatement pres)
					throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				pres.setInt(1, visits+1);
				pres.setInt(2, id);
				pres.executeUpdate();
				return null;
			}
		});
		return visits+1;
	}
	
	

}
