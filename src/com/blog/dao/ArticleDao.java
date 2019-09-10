
package com.blog.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.blog.entity.Article;
import com.blog.utils.DBUtil;

public class ArticleDao {
	/**
	 * 主页时间轴和慢生活界面的分页
	 */
	public List<Article> getPageByDate(int pageIndex,int pageSize){
		List<Article> list = new ArrayList<Article>();
		String sql = "SELECT a_id,a_title,a_date,v_count,c_count,c_diss,article.t_id,t_name,a_summary FROM article LEFT JOIN type ON article.t_id = type.t_id WHERE a_tag = 0 ORDER BY a_date DESC LIMIT ?,?";
		Object[] param = {(pageIndex - 1) * pageSize ,pageSize};
		CachedRowSet crs = DBUtil.execQuery(sql, param);
		try {
			while(crs.next()) {
				Article article = new Article();
				article.setAid(crs.getInt("a_id"));
				article.setAtitle(crs.getString("a_title"));
				article.setAdate(crs.getTimestamp("a_date"));
				article.setVcount(crs.getInt("v_count"));
				article.setCcount(crs.getInt("c_count"));
				article.setCdiss(crs.getInt("c_diss"));
				article.setTid(crs.getInt("t_id"));
				article.setTname(crs.getString("t_name"));
				article.setAsummary(crs.getString("a_summary"));
				list.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 主页时间轴上面的三个文本，逻辑：用于显示访问人数最多的博文
	 */
	public List<Article> getHotArticles(){
		List<Article> list = new ArrayList<Article>();
		String sql = "SELECT a_id,a_title,a_date,v_count,c_count,c_diss,article.t_id,t_name,a_summary FROM article LEFT JOIN type ON article.t_id = type.t_id WHERE a_tag = 0 ORDER BY v_count DESC LIMIT 0,3";
		Object[] param = {};
		CachedRowSet crs = DBUtil.execQuery(sql, param);
		try {
			while(crs.next()) {
				Article article = new Article();
				article.setAid(crs.getInt("a_id"));
				article.setAtitle(crs.getString("a_title"));
				article.setAdate(crs.getTimestamp("a_date"));
				article.setVcount(crs.getInt("v_count"));
				article.setCcount(crs.getInt("c_count"));
				article.setCdiss(crs.getInt("c_diss"));
				article.setTid(crs.getInt("t_id"));
				article.setTname(crs.getString("t_name"));
				article.setAsummary(crs.getString("a_summary"));
				list.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 获取数据库中博客总数
	 * @author 肖超
	 */
	public int getTotalCount() {
		int count = 0;
		String sql = "select count(1) from article";
		Object[] param = {};
		CachedRowSet crs = DBUtil.execQuery(sql, param);
		try {
			if(crs.next()) {
				count = crs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	public void addArticle(Article a) {
		DBUtil.execUpdate("insert into article(a_id,a_title,a_content,a_date,v_count,c_count,c_diss,t_id,u_id,a_tag,a_summary)values(null,?,?,current_timestamp(),?,?,?,?,?,?,?)",a.getAtitle(),a.getAcontent(),a.getVcount(),a.getCcount(),a.getCdiss(),a.getTid(),a.getUid(),a.getAtag(),a.getAsummary());
	}

	/**
	 * 文章修改删除以及对应不同的查询功能实现
	 *@author 温思伟
	 */

	//根据文章编号删除记录
	public void deleteById(int aid) {
		DBUtil.execUpdate("delete from article where a_id=?",aid);
	}

	//根据文章编号查看记录
	public Article selectById(int aid) {
		CachedRowSet set=DBUtil.execQuery("select *from article where a_id=?", aid);
		Article a=null;
		try {
			while(set.next()) {
				int id=set.getInt("a_id");
				String title=set.getString("a_title");
				String content=set.getString("a_content");
				Timestamp date=set.getTimestamp("a_date");
				int vc=set.getInt("v_count");
				int cc=set.getInt("c_count");
				int cd=set.getInt("c_diss");
				int tid=set.getInt("t_id");
				int uid=set.getInt("u_id");
				int tag=set.getInt("a_tag");
				String summary=set.getString("a_summary");
				a=new Article(id,title,content,date,vc,cc,cd,tid,uid,tag,summary);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

	//查看所有记录
	public List<Article> selectAll(List<Article> list) {
		CachedRowSet set=DBUtil.execQuery("select *from article");
		try {
			while(set.next()) {
				int id=set.getInt("a_id");
				String title=set.getString("a_title");
				String content=set.getString("a_content");
				Timestamp date=set.getTimestamp("a_date");
				int vc=set.getInt("v_count");
				int cc=set.getInt("c_count");
				int cd=set.getInt("c_diss");
				int tid=set.getInt("t_id");
				int uid=set.getInt("u_id");
				int tag=set.getInt("a_tag");
				String summary=set.getString("a_summary");
				list.add(new Article(id,title,content,date,vc,cc,cd,tid,uid,tag,summary));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	//根据类别编号将对应的数量查询出来
	public int getCountByTid() {
		int count=0;
		CachedRowSet set=DBUtil.execQuery("select t_id as 类别编号,count(1) as 数量 from article group by t_id;");
		try {
			while(set.next()) {
				count=set.getInt(2);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return count;
	}

	//搜索功能实现:根据文章内容查询所有文章
	public List<Article> getAllByAcontent(String a){
		CachedRowSet set=DBUtil.execQuery("select *from article where a_content like ?","%"+a+"%");
		List<Article> list=new ArrayList<>();;
		try {
			
			while(set.next()) {
				int id=set.getInt("a_id");
				String title=set.getString("a_title");
				String content=set.getString("a_content");
				Timestamp date=set.getTimestamp("a_date");
				int vc=set.getInt("v_count");
				int cc=set.getInt("c_count");
				int cd=set.getInt("c_diss");
				int tid=set.getInt("t_id");
				int uid=set.getInt("u_id");
				int tag=set.getInt("a_tag");
				String summary=set.getString("a_summary");
				list.add(new Article(id,title,content,date,vc,cc,cd,tid,uid,tag,summary)); 
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return list;
	}

	//根据类别id获取所有的文章
	public List<Article> getAllByTid(int tid){
		CachedRowSet set=DBUtil.execQuery("select *from article where t_id= ?",tid);
		List<Article> list=new ArrayList<>();;
		try {
			while(set.next()) {
				int id=set.getInt("a_id");
				String title=set.getString("a_title");
				String content=set.getString("a_content");
				Timestamp date=set.getTimestamp("a_date");
				int vc=set.getInt("v_count");
				int cc=set.getInt("c_count");
				int cd=set.getInt("c_diss");
				int tyid=set.getInt("t_id");
				int uid=set.getInt("u_id");
				int tag=set.getInt("a_tag");
				String summary=set.getString("a_summary");
				list.add(new Article(id,title,content,date,vc,cc,cd,tyid,uid,tag,summary)); 
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return list;
	}

	//更新点赞次数
	public void updateByCount(int id,int count) {
		DBUtil.execUpdate("update article set c_count=? where a_id=?", count,id);
	}
	
	//更新反赞次数
	public void updateByDiss(int id,int count) {
		DBUtil.execUpdate("update article set c_diss=? where a_id=?", count,id);
	}
	//根据文章id更新记录
	public void updateByAid(int id,String title,int type,String summary,String context) {
		DBUtil.execUpdate("update article set a_title=?,t_id=?,a_summary=?,a_content=? where a_id=?", title,type,summary,context,id);
	}
	
	//设置文章可找回
	public void updateTag(int id) {
		DBUtil.execUpdate("update article set a_tag=2 where a_id=?", id);
	}

}
