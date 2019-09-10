package com.blog.servicesImpl;


import java.util.List;

import com.blog.dao.UserDAO;
import com.blog.entity.User;
import com.blog.services.UserService;


public class UserServiceImpl implements UserService {


	@Override
	public void addUser(String username,String password,String intro,String headImg) {
		new UserDAO().addUser(username, password, intro, headImg);
	}

	@Override
	public void updateUser(int userid, String password, String intro, String headImg) {
		new UserDAO().updateUser(userid, password, intro, headImg);

	}

	@Override
	public void deleteUser(int userid) {
		new UserDAO().deleteUser(userid);
	}

	@Override
	public User queryById(int userid) {
		return new UserDAO().queryById(userid);

	}

	@Override
	public List<User> queryAll(List<User> list){
		return new UserDAO().queryAll(list);
	}

	@Override
	public User log(String username, String password) {
		return new UserDAO().log(username, password);
	}

	@Override
	public List<User> queryByPage(int pageNo,int pageSize){
		return new UserDAO().queryByPage(pageNo, pageSize);
	}
	public List<User> queryMessage(String username) {
		// TODO Auto-generated method stub
		return new UserDAO().queryMessage(username);
	}

	@Override
	public int queryTotal() {
		
		return new UserDAO().queryTotal();
	}

	
	
	

	





}
