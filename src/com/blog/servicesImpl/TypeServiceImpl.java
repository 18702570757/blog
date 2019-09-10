package com.blog.servicesImpl;

import java.nio.channels.NonReadableChannelException;
import java.util.List;

import com.blog.dao.TypeDao;
import com.blog.entity.Type;
import com.blog.services.TypeService;
import com.sun.swing.internal.plaf.basic.resources.basic;

public class TypeServiceImpl implements TypeService {
	@Override
	public void addType(String t_name, String t_content) {
		new TypeDao().addType(t_name, t_content);
		// TODO Auto-generated method stub	
	}
	@Override
	public List<Type> selectType() {
		List<Type> list = new TypeDao().selectType();
		return list;
	}
	@Override
	public boolean delType(int t_id) {
		
		return new TypeDao().delType(t_id);	
	} 
	@Override
	public void updateType (int t_id, String t_name ,String t_content) {
		new TypeDao().updateType(t_id, t_name,t_content);	
	}
	@Override
	public List<Type> pageType(int pageNo, int pageSize) {
		List<Type> list =  new TypeDao().pageType(pageNo, pageSize);
		return list;	
	}
	@Override
	public int countType() {	
		return new TypeDao().countType();
	}
	@Override
	public Type idType(int t_id) {
		
		return new TypeDao().idType(t_id);
		
	}
	@Override
	public List<Type> selectsType(String s) {
		
		return new TypeDao().selectsType(s);
	}
	
}


