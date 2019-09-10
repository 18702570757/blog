package com.blog.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class User {
	@Column(name="u_id")
	private int userid;//用户编号
	@Column(name="u_name")
	private String username;//用户名
	@Column(name="upwd")
	private String password;//用户密码
	@Column(name="u_intro")
	private String intro;//用户简介
	@Column(name="u_headImg")
	private String headImg;//用户头像
	private String searchname;//搜索关键字
	private List<User> list;
	
	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}


	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", intro=" + intro
				+ ", headImg=" + headImg + "]";
	}


	public int getUserid() {
		return userid;
	}


	public void setUserid(int userid) {
		this.userid = userid;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}


	public String getHeadImg() {
		return headImg;
	}


	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}


	public User() {
		super();
	}


	public User(int userid, String username, String password, String intro, String headImg) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.intro = intro;
		this.headImg = headImg;
	}
	
	
	
	

}
