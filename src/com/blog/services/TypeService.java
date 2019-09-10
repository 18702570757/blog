package com.blog.services;

import java.util.List;

import com.blog.dao.TypeDao;
import com.blog.entity.Type;

public interface TypeService {
	//添加标题
	public void addType(String t_name, String t_content) ;
	//查询类别返回类别对象
	public  List<Type> selectType();
	//删除类别
	public boolean delType(int t_id) ;
	//修改类别
	public void updateType(int t_id,String t_name,String t_content);
	//分页查询 
	public List<Type> pageType(int pageNo,int pageSize);
	//标题总数
	public int countType();
	//根据ID查询
	public Type idType(int t_id);
	//模糊查询
	public 
	List<Type> selectsType(String s);
	
	

}
