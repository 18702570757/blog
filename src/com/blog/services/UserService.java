package com.blog.services;

import java.util.List;

import com.blog.entity.User;

public interface UserService {
	//登录
	public User log(String username,String password);
	//增加用户
	public void addUser(String username,String password,String intro,String headImg) ;
	//根据u_id修改用户信息
	public void updateUser(int userid,String password,String intro,String headImg);
	//根据u_id删除用户信息
	public void deleteUser(int userid);
	//根据u_id查询用户信息
	public User queryById(int userid);
	//查询全部信息
	public List<User> queryAll(List<User> list);
	//根据页数显示用户信息
	public List<User> queryByPage(int pageNo,int pageSize);
	//查询总页数
	public int queryTotal();
	//根据用户名关键字搜索模糊查询
	public List<User> queryMessage(String username);
	
	}


