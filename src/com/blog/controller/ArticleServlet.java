package com.blog.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.blog.entity.Article;
import com.blog.entity.Comment;
import com.alibaba.fastjson.JSONArray;
import com.blog.dao.ArticleDao;
import com.blog.dao.TypeDao;
import com.blog.entity.Type;
import com.blog.servicesImpl.ArticleServiceImpl;
import com.blog.servicesImpl.CommentServiceImpl;
import com.blog.servicesImpl.TypeServiceImpl;
import com.blog.utils.DateUtil;



/**
 * 
 * @author liu
 *@date 2019年7月1日  
 *
 */
@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ArticleServlet() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//获取标识
		HttpSession session=request.getSession();
		String flag=request.getParameter("flag");
		PrintWriter out=response.getWriter();
		ArticleDao ad=new ArticleDao();
		TypeDao td=new TypeDao();
		if(flag==null||"beforeAdd".equals(flag)) {
			List<Type> lst=td.selectType();
			String jsonStr=JSONArray.toJSONString(lst);
			out.print(jsonStr);
			out.flush();
			out.close();
		}else if("add".equals(flag)) {
			String title=request.getParameter("atitle");
			String type=request.getParameter("articletype");
			String summary=request.getParameter("abstracts");
			String context=request.getParameter("context");
			Article art=new Article();
			System.out.println(type);
			art.setUid((int)session.getAttribute("userid"));
			art.setAtitle(title);
			art.setAcontent(context);
			art.setAdate(DateUtil.timeToStamp(new Date()));
			art.setAsummary(summary);
			art.setTid(Integer.parseInt(type));
			ad.addArticle(art);
		}

		/**
		 * 文章修改删除以及对应不同的查询功能实现
		 *@author 温思伟
		 */
		else if("delete".equals(flag)) {
			String id=request.getParameter("id");
			int aid=Integer.valueOf(id);
			new ArticleServiceImpl().deleteByAid(aid);
			out.print("<script>alert('删除成功');window.location.href='admin/article-list.jsp'</script>");
		}
		
		else if("deleteAll".equals(flag)) {
			String[] id=request.getParameterValues("id");
			if(id==null) {
				out.print("<script>alert('请选择一个文章');window.location.href='admin/article-list.jsp'</script>");
			}else {
			for(int i=0;i<id.length;i++) {
			new ArticleServiceImpl().deleteByAid(Integer.parseInt(id[i]));
			}
			out.print("<script>alert('删除成功');window.location.href='admin/article-list.jsp'</script>");
		}}
		
		else if("undo".equals(flag)) {
			String  id=request.getParameter("id");
			new ArticleServiceImpl().updateTag(Integer.valueOf(id));
			out.print("<script>alert('已设置文章可找回');window.location.href='admin/article-list.jsp'</script>");
		}
		
		else if("getAllByType".equals(flag)){
			List<Type> tlist=td.selectType();
			session.setAttribute("tlist", tlist);		
			response.sendRedirect("mbfx.jsp");
		}
		else if(flag.equals("getAllByTid")){
			String tid=request.getParameter("id");
			int id=0;
			if(tid!=null) {
				id=Integer.valueOf(tid);
				Type t=new TypeServiceImpl().idType(id);
				session.setAttribute("name", t.getT_name());
				List<Article> alist=new ArticleServiceImpl().selectByTid(id);
				session.setAttribute("alist", alist);
				response.sendRedirect("mbfx.jsp");
			}
		}
		else if(flag.equals("update")) {
			String id=request.getParameter("id");
			String count=request.getParameter("count");
			int aid=0;int ccount=0;
			if(id!=null && count!=null) {
				aid=Integer.valueOf(id);
				ccount=Integer.valueOf(count);
				new ArticleServiceImpl().updateByCount(aid,ccount);
				response.sendRedirect("learn.jsp");
			}
		}else if("all".equals(flag)) {
			int aid = Integer.valueOf(request.getParameter("id"));
			List<Comment> list=new ArrayList<>();
			list=new CommentServiceImpl().selectByAid(aid,list);
			Article article = new ArticleServiceImpl().selectById(aid);
			System.out.println(list.toString());
			session.setAttribute("info", list);
			session.setAttribute("article", article);
			response.sendRedirect("learn.jsp");
		}
		
		else if("updateAll".equals(flag)) {
		     	String aid = request.getParameter("aid");
				String title = request.getParameter("atitle");
				String type = request.getParameter("articletype");
				String summary = request.getParameter("abstracts");
				String context=request.getParameter("context");
				new ArticleServiceImpl().updateByAid(Integer.valueOf(aid), title,Integer.valueOf(type),summary, context);
			    out.print("<script>alert('修改成功');window.location.href='admin/article-list.jsp'</script>");
			}
		}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
