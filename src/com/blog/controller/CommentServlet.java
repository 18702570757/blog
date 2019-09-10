package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.CommentDao;
import com.blog.entity.Comment;
import com.blog.entity.Type;
import com.blog.services.CommentService;
import com.blog.servicesImpl.CommentServiceImpl;
import com.blog.servicesImpl.TypeServiceImpl;

/**
 * Servlet implementation class CommentServlet
 */
/**
 * @author fq
 *
 * 2019年7月3日
 */
@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CommentServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		HttpSession session=request.getSession(); 
		String id = request.getParameter("id");
		String flay = request.getParameter("flay");
		PrintWriter out = response.getWriter();
		//删除判断
		if (id!=null && flay.equals("s")) {
			boolean b1 =  new CommentServiceImpl().deleteByCid(Integer.valueOf(id));
			if(!b1) {
				out.print("<script>alert('删除失败');window.location.href='CommentServlet'</script>");
			}
			if(b1){
				out.print("<script>alert('删除成功');window.location.href='CommentServlet'</script>");
			}
		}
		//分页+基础显示刷新
		else
		{
			HttpSession sessionpage =request.getSession(); 
			String pageNo = request.getParameter("pageNo"); 
			int	pageSize = 8; int count = new CommentServiceImpl().countComment();
			if(pageNo==null||"".equals(pageNo)){ 
				pageNo = "1"; 
				} 
			int pageNoo = Integer.valueOf(pageNo); 
			if(pageNoo<=0) { 
				pageNoo = 1; pageNo = "1";
			} 
			int pages = (int) Math.ceil((float)count/ (float)pageSize);

			if(pageNoo>pages) { 
				pageNoo= pages;
				pageNo = String.valueOf(pageNoo); 
				}
				List<Comment> tlist = new CommentServiceImpl().pageComment(pageNoo,pageSize); 
				//List<Comment> list = new CommentDao().selectALL();
				System.out.println(tlist.size()); request.setAttribute("comments", tlist);

				session.setAttribute("comments", tlist);
				response.sendRedirect("admin/feedback-list.jsp");
				sessionpage.setAttribute("pageNo", pageNo); sessionpage.setAttribute("count",count);
				//request.getRequestDispatcher("admin/feedback-list.jsp").forward(request,response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String flay = request.getParameter("flay");
		PrintWriter out = response.getWriter();
		//查询判断
		if(flay!=null&&flay.equals("cx")) {
			String s = request.getParameter("key");
			List<Comment> tlist = new CommentServiceImpl().selectsComment(s);
			HttpSession session = request.getSession();
			session.setAttribute("comments", tlist);
			response.sendRedirect("admin/feedback-list.jsp");	
		}
		String action = request.getParameter("action");
		CommentService cs = new CommentServiceImpl();
		if("add".equals(action)) {
			Comment c = new Comment();
			String username = request.getParameter("username");
			if(username == null || username.equals("")) {
				String ip = request.getRemoteAddr();
				if(ip.equals("0:0:0:0:0:0:0:1")) {
					username = "localhost";
				}else {
					username = ip;
				}
			}
			String content = request.getParameter("content");
			int aid = Integer.valueOf(request.getParameter("aid"));
			String pidRaw = request.getParameter("pid");
			int pid;
			if(pidRaw != null && pidRaw != "") {
				pid = Integer.valueOf(pidRaw);
				c.setPid(pid);
			}
			c.setAid(aid);
			c.setCcontent(content);
			c.setCip(username);
			cs.addComment(c);
		}
	}

}
