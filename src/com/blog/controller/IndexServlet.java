package com.blog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.entity.Article;
import com.blog.services.ArticleService;
import com.blog.servicesImpl.ArticleServiceImpl;
/**
 * 用于对主页时间轴的信息展示
 * @author 肖超
 *
 */
@WebServlet("/IndexServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		ArticleService as = new ArticleServiceImpl();
		List<Article> list = new ArrayList<Article>();
		List<Article> hotArticle = new ArrayList<Article>();
		int totalCount = as.getTotalCount();
		int pageIndex = 1;
		int pageSize = 5;
		int totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
		if(request.getParameter("pageIndex") != null) {
			pageIndex = Integer.valueOf(request.getParameter("pageIndex"));
		}
		if(pageIndex < 1)
			pageIndex = 1;
		if(pageIndex > totalPage)
			pageIndex = totalPage;
		list = as.getPageByDate(pageIndex, pageSize);
		request.setAttribute("idlist", list);
		if("toindex".equals(action)) {
			hotArticle = as.getHotArticles();
			request.setAttribute("hotarticle", hotArticle);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			//response.sendRedirect("index.jsp");
		}else if("tomsh".equals(action)) {
			session.setAttribute("totalCount", totalCount);
			session.setAttribute("totalPage", totalPage);
			request.getRequestDispatcher("manshenghuo.jsp?pageIndex=" + pageIndex).forward(request, response);;
		}
		
		else if("zan".equals(action)) {
			int id=Integer.valueOf(request.getParameter("a_id"));
			int count=Integer.valueOf(request.getParameter("count"));
			as.updateByCount(id, count);
		}else if("cai".equals(action)) {
			int id=Integer.valueOf(request.getParameter("a_id"));
			int count=Integer.valueOf(request.getParameter("count"));
			as.updateByDiss(id, count);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
