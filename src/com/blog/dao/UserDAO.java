package com.blog.dao;
import com.blog.entity.User;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.rowset.CachedRowSet;
import com.blog.utils.DBUtil;

public class UserDAO  {

	//登录
	public User log(String username,String password){
		CachedRowSet crs=DBUtil.execQuery("select * from user where u_name=? and upwd=?", username,password);
		User u=null;
		try {
			while(crs.next()) { 
				int userid=crs.getInt("u_id");
				String username1=crs.getString("u_name"); 
				String password1=crs.getString("upwd");
				String intro=crs.getString("u_intro");
				String headImg=crs.getString("u_headImg"); 
				//实例化一个对象
				u=new User(userid,username1, password1, intro, headImg); 

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return u;
	}
	//新增用户和用户信息

	public void addUser(String username,String password,String intro,String headImg) { 
		//DBUtil.execUpdate("insert into user(u_id,u_name,upwd,u_intro,u_headImg) VALUES(null,?,?,?,?);",user.getUserid(),user.getUsername(),user.getPassword(),user.getIntro(),user.getHeadImg()); }
		DBUtil.execUpdate("insert into user(u_name,upwd,u_intro,u_headImg) VALUES(?,?,?,?);", username,password,intro,headImg);
	}
	//根据u_id修改用户信息
	public void updateUser(int userid,String password,String intro,String headImg){ 
		DBUtil.execUpdate("update user set upwd=?,u_headImg=?,u_intro=? where u_id=?;",password,headImg,intro,userid); } 
	//根据u_id修改删除用户信息 
	public void deleteUser(int userid) {
		DBUtil.execUpdate("delete from user where u_id=?;" , userid); 
	} 
	//查询全部用户信息
	public List<User> queryAll(List<User> list)  {

		CachedRowSet crs=DBUtil.execQuery("select * from user");
		try {

			while(crs.next()) { 
				int userid=crs.getInt("u_id");
				String username=crs.getString("u_name"); 
				String password=crs.getString("upwd");
				String intro=crs.getString("u_intro");
				String headImg=crs.getString("u_headImg"); 
				//实例化一个对象
				User user=new User(userid,username, password, intro, headImg); 
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;

	}

	//根据u_id查询某条用户信息
	public User queryById(int userid) {
		CachedRowSet set=DBUtil.execQuery("select * from user where u_id=?", userid);
		User u=null;
		try {
			while(set.next()) {
				int userid1=set.getInt("u_id");
				String username=set.getString("u_name");
				String password=set.getString("upwd");
				String intro=set.getString("u_intro");
				String headImg=set.getString("u_headImg");
				u=new User(userid1, username, password, intro, headImg);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}
	//根据用户名搜索模糊查询
	public List<User> queryMessage(String username) {
		CachedRowSet crs=DBUtil.execQuery("select * from user where u_name like ?","%"+username+"%");
		List<User> list=null;
		try {
			while(crs.next()) { 
				int userid=crs.getInt("u_id");
				String username1=crs.getString("u_name"); 
				String password=crs.getString("upwd");
				String intro=crs.getString("u_intro");
				String headImg=crs.getString("u_headImg"); 
				//实例化一个对象
				User user=new User(userid,username1, password, intro, headImg); 
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;

	}
	public List<User> queryByPage(int pageNo,int pageSize){
		List<User> list1=new ArrayList<User>();
		/*
		 * CachedRowSet crs = DBUtil.execQuery("select count(1) as total from user;");
		 * int total = 0; try {
		 * 
		 * while(crs.next()) { total=crs.getInt(1); } } catch (SQLException e) { // TODO
		 * Auto-generated catch block e.printStackTrace(); }
		 */
		CachedRowSet crs1=DBUtil.execQuery("select * from user limit ?,?;",pageNo,pageSize);
		try {
			while(crs1.next()) { 
				int userid=crs1.getInt("u_id");
				String username1=crs1.getString("u_name"); 
				String password=crs1.getString("upwd");
				String intro=crs1.getString("u_intro");
				String headImg=crs1.getString("u_headImg"); 
				User user=new User(userid,username1, password, intro, headImg); 
				list1.add(user);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} 
		return list1;
	}

	public int queryTotal() {
		CachedRowSet crs = DBUtil.execQuery("select count(1) as total from user;");
		int total=0;
		try {
			while(crs.next()) {
				try {
					total=crs.getInt(1);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return total;
	}



}
