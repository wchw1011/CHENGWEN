package com.chengwen.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.PDLOverrideSupported;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.support.lob.DefaultLobHandler;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;

import com.chengwen.pojo.ArticleImage;
import com.chengwen.pojo.ScanImage;

public class ArticleImageDao {
private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	/*
	 * 添加的文章图片
	 */
	public void addArticleImage(File image, int imageId) {
		System.out.println("ArticleImageDao addArticleImage ----------------------------------->");
		try {
			InputStream in = new FileInputStream(image);
			final LobHandler lobHandler=new DefaultLobHandler();
			getJdbcTemplate().execute("insert into articleimage(articleid, image) values(?, ?)", new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
				@Override
				protected void setValues(PreparedStatement psmt, LobCreator lobCreator)  throws SQLException, DataAccessException {
					// TODO Auto-generated method stub
					psmt.setInt(1, imageId);
					lobCreator.setBlobAsBinaryStream(psmt,2,in,(int)image.length());
				}
			} );
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*
	 * 添加homepage中的图片
	 */
	public void addScanImage(String type, String flag, String imgdesc, File image) {
		try {
			InputStream in = new FileInputStream(image);
			final LobHandler lobHandler=new DefaultLobHandler();
			getJdbcTemplate().execute("insert into scanimage(type, flag, imgdesc, image) values(?, ?, ?, ?)", new AbstractLobCreatingPreparedStatementCallback(lobHandler) {
				@Override
				protected void setValues(PreparedStatement psmt, LobCreator lobCreator)
						throws SQLException, DataAccessException {
					// TODO Auto-generated method stub
					psmt.setString(1, type);
					psmt.setString(2, flag);
					psmt.setString(3, imgdesc);
					lobCreator.setBlobAsBinaryStream(psmt,4,in,(int)image.length());
				}
			});
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	
	/*
	 * 根据id获取ArticleImage并返回
	 */
	public ArticleImage getArticleImageById(int id) {
		ArticleImage articleImage=new ArticleImage();
		System.out.println("ArticleImageDao getArticleImageById ----------------------------------->id:::"+id);
		getJdbcTemplate().query("select * from articleimage where id = ?",   
				 new Object[] { id }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {//如果查询无结果时，则不执行该方法
						// TODO Auto-generated method stub
						System.out.println("ArticleImageDao getArticleImageById  processRow----------------------------------->");
						byte[] imageStream;
						InputStream in;
						long nlen;
				 		int ilen;
				 		in=rs.getBinaryStream("image");
				 		articleImage.setArticleid(rs.getInt("articleid"));
				 		articleImage.setId(id);
				 		try {
							nlen=in.available();
							ilen=(int)nlen;
							imageStream=new byte[ilen];
							in.read(imageStream);
							articleImage.setImage(imageStream);
							in.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
		});
		return articleImage;
	}
	/*
	 * 根据articleid获取ArticleImage并返回,目前一个article对应一个图片
	 */
	public ArticleImage getArticleImageByArticleId(int articleid) {
		ArticleImage articleImage=new ArticleImage();
		System.out.println("ArticleImageDao getArticleImageByArticleId ----------------------------------->articleid:::"+articleid);
		getJdbcTemplate().query("select * from articleimage where articleid = ?",   
				 new Object[] { articleid }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {//如果查询无结果时，则不执行该方法
						// TODO Auto-generated method stub
						System.out.println("ArticleImageDao articleid  processRow----------------------------------->");
						byte[] imageStream;
						InputStream in;
						long nlen;
				 		int ilen;
				 		in=rs.getBinaryStream("image");
				 		articleImage.setArticleid(rs.getInt("id"));
				 		articleImage.setId(articleid);
				 		try {
							nlen=in.available();
							ilen=(int)nlen;
							imageStream=new byte[ilen];
							in.read(imageStream);
							articleImage.setImage(imageStream);
							in.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
		});
		return articleImage;
	}
	
	
	/*
	 * 根据id获取ScanImage，即显示在homepage中的图片
	 */
	public ScanImage getScanImageById(int id) {
		ScanImage scanImage=new ScanImage();
		System.out.println("ArticleImageDao getScanImageById ----------------------------------->id:::"+id);
		getJdbcTemplate().query("select * from scanimage where id = ?",   
				 new Object[] { id }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {//如果查询无结果时，则不执行该方法
						// TODO Auto-generated method stub
						System.out.println("ArticleImageDao getScanImageById  processRow----------------------------------->");
						byte[] imageStream;
						InputStream in;
						long nlen;
				 		int ilen;
				 		in=rs.getBinaryStream("image");
				 		scanImage.setId(id);
				 		scanImage.setType(rs.getString("type"));
				 		scanImage.setFlag(rs.getString("flag"));
				 		scanImage.setImgDesc(rs.getString("imgdesc"));
				 		try {
							nlen=in.available();
							ilen=(int)nlen;
							imageStream=new byte[ilen];
							in.read(imageStream);
							scanImage.setImage(imageStream);
							in.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
		});
		return scanImage;
	}
	
	public String getScanImageDescById(int id) {
		ScanImage scanImage=new ScanImage();
		getJdbcTemplate().query("select imgdesc from scanimage where id = ?",   
				 new Object[] { id }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {//如果查询无结果时，则不执行该方法
						// TODO Auto-generated method stub
				 		scanImage.setImgDesc(rs.getString("imgdesc"));
					}
		});
		return scanImage.getImgDesc();
	}
	/*
	 * 根据articleid获取articleimage表中的Id，然后讲这些iD以List集合的形式返回
	 */
	public List<String> getIdByArticleId(int articleid) {
		List<String> idList=new ArrayList<String>();
		System.out.println("ArticleImageDao getIdByArticleId  ----------------------------------->getJdbcTemplate::"+getJdbcTemplate());
		getJdbcTemplate().query("select  * from articleimage where articleid=?",   
				 new Object[] { articleid }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {
						// TODO Auto-generated method stub
						idList.add(rs.getInt("id")+"");
						while(rs.next()) {
							idList.add(rs.getInt("id")+"");
						}
					}
		});
		return idList;
	}
	/*
	 * 根据flag获取scanimage的列表, scanimage不包含image
	 */
	public List<ScanImage> getScanImageNoImageList(String flag) {
		List<String> idList=new ArrayList<String>();
		List<ScanImage> scanImageNoImageList=new ArrayList<ScanImage>();
		System.out.println("ArticleImageDao getScanImageNoImageList  ----------------------------------->getJdbcTemplate::"+getJdbcTemplate());
		getJdbcTemplate().query("select  id, type, flag, imgdesc from scanimage where flag=?",   
				 new Object[] { flag }, 
				 new RowCallbackHandler() {
					@Override
					public void processRow(ResultSet rs) throws SQLException {
						// TODO Auto-generated method stub
						//idList.add(rs.getInt("id")+"");
						ScanImage scanImage = new ScanImage();;
						scanImage.setId(rs.getInt("id"));
						scanImage.setType(rs.getString("type"));
						scanImage.setFlag(rs.getString("flag"));
						scanImage.setImgDesc(rs.getString("imgdesc"));
						scanImageNoImageList.add(scanImage);
						while(rs.next()) {
							//idList.add(rs.getInt("id")+"");
							ScanImage scanImage1= new ScanImage();;
							scanImage1.setId(rs.getInt("id"));
							scanImage1.setType(rs.getString("type"));
							scanImage1.setFlag(rs.getString("flag"));
							scanImage1.setImgDesc(rs.getString("imgdesc"));
							scanImageNoImageList.add(scanImage1);
						}
					}
		});
		return scanImageNoImageList;
	}
}
