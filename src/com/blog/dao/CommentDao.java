package com.blog.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.blog.entity.Comment;
import com.blog.entity.Type;
import com.blog.utils.DBUtil;

/**
 * @author fq
 *
 * 2019年7月1日
 */
public class CommentDao {


		//进行评论
		public void addComment(Comment c) {
			DBUtil.execUpdate("insert into comment(c_id,c_content,c_date,c_ip,a_id,p_id) values (?,?,?,?,?,?)",c.getCid(),c.getCcontent(),c.getCdate(),c.getCip(),c.getAid(),c.getPid());
		}
		//根据评论id查看评论
		public Comment selectById(int cid) {
			CachedRowSet set=DBUtil.execQuery("select *from Comment where c_id=?", cid);
			Comment c=null;
			try {
				while(set.next()) {
				 int id=set.getInt("c_id");
				 String content=set.getString("c_content");
				 Timestamp date=set.getTimestamp("c_date");
				 String ip=set.getString("c_ip");
				 int aid=set.getInt("a_id");
				 int pid=set.getInt("p_id");
				 c=new Comment(id,content,date,ip,aid,pid);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return c;
		}
	//根据评论编号删除评论
	public boolean deleteByCid(int cid) {
		DBUtil.execUpdate("delete from comment where c_id=?",cid);
		return true; 
	}

	//查看所有的评论
	public List<Comment> selectALL() {
		List<Comment> list = new ArrayList<>();

		CachedRowSet set= DBUtil.execQuery("select * from Comment");
		try {
			while(set.next()) {
				//获取评论的ID
				int cid = set.getInt("c_id");
				//获取评论的内容
				String ccontent = set.getString("c_content");
				//获取评论的日期
				Timestamp cdate = set.getTimestamp("c_date"); 
				//获取评论所在的主机ip
				String cip = set.getString("c_ip");
				//获取评论所在文章的id
				int aid = set.getInt("a_id");
				//用于评论用户信息交互，评论用户的父级id，默认是0
				int pid = set.getInt("p_id");
				Comment c = new Comment();
				c.setCid(cid);
				c.setCcontent(ccontent);
				c.setCdate(cdate);
				c.setCip(cip);
				c.setAid(aid);
				c.setPid(pid);

				//将获取的数据放到list集合中
				list.add(c);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	//分页查询
	public List<Comment> pageComment(int pageNo,int pageSize) {
		CachedRowSet crs = DBUtil.execQuery("SELECT * from  comment limit ?,?",(pageNo-1)*pageSize,pageSize);
		List<Comment> list = new ArrayList ();
		try {
			while(crs.next()) {
				int c_id = crs.getInt("c_id");
				String c_content = crs.getString("c_content");
				Timestamp c_date = crs.getTimestamp("c_date");
				String c_ip = crs.getString("c_ip");
				int a_id = crs.getInt("a_id");
				int p_id = crs.getInt("p_id");
				Comment com = new Comment(c_id,c_content,c_date,c_ip,a_id,p_id);		
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	public int countComment() {
		ResultSet re = DBUtil.execQuery("SELECT count(1) as total from comment");
		int count = 0;
		try {
			while(re.next())
				count = re.getInt("total");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	//模糊查询
	public List<Comment> selectsComment(String s) {
		List<Comment> list = new ArrayList<>();
		CachedRowSet crs = DBUtil.execQuery("SELECT * FROM comment WHERE c_content LIKE ?","%"+s+"%");
		System.out.println(crs.size());
		try {
			while (crs.next()) {
				int c_id = crs.getInt("c_id");
				String c_content = crs.getString("c_content");
				Timestamp c_date = crs.getTimestamp("c_date");
				String c_ip = crs.getString("c_ip");
				int a_id = crs.getInt("a_id");
				int p_id = crs.getInt("p_id");
				Comment com = new Comment(c_id,c_content,c_date,c_ip,a_id,p_id);
				list.add(com);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;

	}

	//根据评论aid查看评论
	public List<Comment> selectByAid(int a,List<Comment> list ) {
		CachedRowSet set=DBUtil.execQuery("select *from comment where a_id= ?",a);
		try {
			while(set.next()) {
				int id=set.getInt("c_id");
				String content=set.getString("c_content");
				Timestamp date=set.getTimestamp("c_date");
				String ip=set.getString("c_ip");
				int aid=set.getInt("a_id");
				list.add(new Comment(id,content,date,ip,aid));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
