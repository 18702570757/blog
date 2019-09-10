package com.blog.dao;


import java.nio.channels.NonReadableChannelException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.CachedRowSet;

import com.blog.entity.Type;
import com.blog.entity.User;

import com.blog.utils.DBUtil;

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.xml.internal.ws.api.pipe.Tube;

public class TypeDao {
	public void addType(String t_name, String t_content) {
		DBUtil.execUpdate("INSERT  INTO type (t_name,t_content) VALUES (?,?) ;", t_name, t_content);

	}

	// 查询类别返回类别对象
	public List<Type> selectType() {
		List<Type> list = new ArrayList<>();
		CachedRowSet crs = DBUtil.execQuery("SELECT *FROM type;");
		try {
			while (crs.next()) {
				int t_id = crs.getInt("t_id");
				String t_name = crs.getString("t_name");
				String t_content = crs.getString("t_content");
				Type type = new Type(t_id, t_name,t_content);
				list.add(type);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	// 删除类别
	public boolean delType(int t_id) {
		CachedRowSet crs = DBUtil.execQuery("select *from article where t_id=?;", t_id);
		List<Integer> list = new ArrayList<>();
		try {
			while (crs.next()) {
				int a = crs.getInt("t_id");
				list.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 判断类别下是否有新闻
		if (list.size() == 0) {
			DBUtil.execUpdate("DELETE FROM type WHERE t_id =?;", t_id);
			return true; // 没有新闻删除类别返回true
		}else {return false;}
		 // 有新闻返回false

	}

	// 类别修改
	public void updateType(int t_id, String t_name , String t_content ) {

		DBUtil.execUpdate("UPDATE  type set t_name=?,t_content=? WHERE t_id=?",t_name,t_content, t_id);

	}
	//分页查询
	public List<Type> pageType(int pageNo,int pageSize) {
		CachedRowSet crs = DBUtil.execQuery("SELECT * from  type limit ?,?",(pageNo-1)*pageSize,pageSize);
		List<Type> list = new ArrayList ();
		try {
			while(crs.next()) {
			int t_id = crs.getInt("t_id");
			String t_name = crs.getString("t_name");
			String t_content = crs.getString("t_content");
			Type t = new Type(t_id,t_name,t_content);		
			list.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	public int countType() {
		ResultSet re = DBUtil.execQuery("SELECT count(1) as total from type");
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
	//根据t_id进行查询
	public Type idType(int t_id) {
		Type t  = new Type();
		CachedRowSet crs = DBUtil.execQuery("SELECT *FROM type where t_id =?",t_id);
		try {
			while (crs.next()) {
				int id = crs.getInt("t_id");
				String t_name = crs.getString("t_name");
				String t_content = crs.getString("t_content");
				Type type = new Type(t_id, t_name,t_content);
				t.setT_id(id);
				t.setT_name(t_name);
				t.setT_content(t_content);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
		return t;
		
	}
	//模糊查询
	public List<Type> selectsType(String s) {
		List<Type> list = new ArrayList<>();
		CachedRowSet crs = DBUtil.execQuery("SELECT * FROM type WHERE t_name LIKE ?","%"+s+"%");
		try {
			while (crs.next()) {
				int t_id = crs.getInt("t_id");
				String t_name = crs.getString("t_name");
				String t_content = crs.getString("t_content");
				Type type = new Type(t_id, t_name,t_content);
				list.add(type);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		;
		return list;
		
	}

}
