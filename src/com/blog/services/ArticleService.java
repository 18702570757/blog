package com.blog.services;

import java.util.List;


import java.sql.Timestamp;


import com.blog.entity.Article;

public interface ArticleService {

	//根据日期分页（时间轴）
	public abstract List<Article> getPageByDate(int pageIndex,int pageSize);

	public abstract List<Article> getHotArticles();

	//增加文章
	public void addArticle(Article a);

	//查看所有文章
	public List<Article> selectAll(List<Article> list);

	//根据文章id删除文章
	public void deleteByAid(int aid);

	//根据文章id查找记录
	public Article selectById(int aid);

	//根据文章发布时间戳查找记录
	public Article selectByAdate(Timestamp adate);

	//根据文章类别id查找记录
	public List<Article> selectByTid(int tid);

	//根据文章id修改文章记录
	public Article updateArticle(int aid);

	//获取博客总记录数
	public abstract int getTotalCount();

	//根据文章内容获取所有相关文章
	public List<Article> getAllByAcontent(String a);

	//更新点赞次数
	public void updateByCount(int id,int count);

	//更新反赞次数
	public void updateByDiss(int id,int count);

	//根据文章id更新记录
	public void updateByAid(int id,String title,int type,String summary,String context); 

	//设置文章可找回
	public void updateTag(int id);
	
}
