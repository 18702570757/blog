package com.blog.servicesImpl;

import java.sql.Timestamp;
import java.util.List;

import com.blog.dao.ArticleDao;
import com.blog.entity.Article;
import com.blog.services.ArticleService;

public class ArticleServiceImpl implements ArticleService {


	private static ArticleDao ad = new ArticleDao();

	@Override
	public void addArticle(Article a) {
		ad.addArticle(a);
	}

	@Override
	public void deleteByAid(int aid) {
		ad.deleteById(aid);
	}

	@Override
	public Article selectByAdate(Timestamp adate) {
		return null;
	}

	@Override
	public List<Article> selectByTid(int tid) {
		return ad.getAllByTid(tid);
	}

	@Override
	public Article updateArticle(int aid) {
		return null;
	}

	@Override
	public List<Article> getPageByDate(int pageIndex, int pageSize) {
		return ad.getPageByDate(pageIndex, pageSize);
	}
	
	@Override
	public List<Article> getHotArticles() {
		return ad.getHotArticles();
	}

	@Override
	public Article selectById(int aid) {
		return ad.selectById(aid);
	}

	@Override
	public int getTotalCount() {
		
		return ad.getTotalCount();
	}

	@Override
	public List<Article> selectAll(List<Article> list) {
		return ad.selectAll(list);
	}

	@Override
	public List<Article> getAllByAcontent(String a) {
		
		return ad.getAllByAcontent(a);
	}

	@Override
	public void updateByCount(int id,int count) {
		ad.updateByCount(id,count);
	}

	@Override
	public void updateByDiss(int id, int count) {
		ad.updateByDiss(id, count);
	}

	@Override
	public void updateByAid(int id, String title,int type, String summary, String context) {
		new ArticleDao().updateByAid(id, title,type,summary, context);	
	}

	@Override
	public void updateTag(int id) {
		ad.updateTag(id);
	}

}
