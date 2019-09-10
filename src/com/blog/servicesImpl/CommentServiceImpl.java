package com.blog.servicesImpl;

import java.util.List;

import com.blog.dao.CommentDao;
import com.blog.dao.TypeDao;
import com.blog.entity.Comment;
import com.blog.entity.Type;
import com.blog.services.CommentService;

public class CommentServiceImpl implements CommentService {

	@Override
	public void addComment(Comment c) {
		new CommentDao().addComment(c);
	}
	@Override
	public Comment selectByCid(int cid) {
		return new CommentDao().selectById(cid);
	}
	@Override
	public boolean deleteByCid(int cid) {
		return new CommentDao().deleteByCid(cid);	
	}
	@Override
	public List<Comment> pageComment(int pageNo, int pageSize) {
		List<Comment> list =  new CommentDao().pageComment(pageNo, pageSize);
		return list;
	}
	@Override
	public int countComment() {
		return new CommentDao().countComment();
	}
	@Override
	public List<Comment> selectsComment(String s) {
		return new CommentDao().selectsComment(s);
	}
	@Override
	public List<Comment> selectByAid(int a,List<Comment> list) {
		return new CommentDao().selectByAid(a,list);
	}
}
