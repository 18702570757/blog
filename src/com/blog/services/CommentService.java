package com.blog.services;

import java.util.List;

import com.blog.entity.Comment;
import com.blog.entity.Type;

/**
 * @author fq
 *
 * 2019年7月1日
 */
public interface CommentService {

		//添加评论
		public  void addComment(Comment c);
		//查询评论
		public Comment selectByCid(int cid);
		//根据cid来删除相应的评论
		public boolean deleteByCid(int cid);
		//分页查询
		List<Comment> pageComment(int pageNoo, int pageSize);
		//记录总数
		int countComment();
		//模糊查询
		public List<Comment> selectsComment(String s);
		//显示评论
		public List<Comment> selectByAid(int a,List<Comment> list);

}