package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.apache.tomcat.util.buf.UEncoder.SafeCharsSet;

import com.blog.dao.TypeDao;
import com.blog.entity.Type;
import com.blog.servicesImpl.TypeServiceImpl;

import javafx.scene.control.Alert;

/**
 * Servlet implementation class TypeServlet
 */
@WebServlet("/TypeServlet")
public class TypeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String flay = request.getParameter("flay");
		PrintWriter out = response.getWriter();
		//删除判断
		if (id!=null&& flay.equals("s")) {
			boolean b1 =  new TypeServiceImpl().delType(Integer.valueOf(id));
			if(!b1) {
			out.print("<script>alert('删除失败，因为该分类下有文章');window.location.href='TypeServlet'</script>");
			}
			if(b1){
			out.print("<script>alert('删除成功');window.location.href='TypeServlet'</script>");
			}
		}
		else
		{

			//分页查询判断
			if(id!=null&& flay.equals("b")) {
				Type t = new TypeServiceImpl().idType(Integer.valueOf(id));
				HttpSession bj = request.getSession();
				bj.setAttribute("bj", t);
				response.sendRedirect("admin/type-modify.jsp");
			}

			//分页+基础显示刷新
			else{
				HttpSession session = request.getSession();
				HttpSession sessionpage = request.getSession();
				String pageNo = request.getParameter("pageNo");
				int  pageSize = 8;
				int count = new TypeServiceImpl().countType();
				if(pageNo==null||"".equals(pageNo)){
					pageNo = "1";		
				}	
				int pageNoo = Integer.valueOf(pageNo);
				if(pageNoo<=0) {
					pageNoo = 1;
					pageNo = "1";	
				}
				int pages = (int) Math.ceil((float)count/ (float)pageSize);	
				if(pageNoo>pages) {
					pageNoo= pages;
					pageNo = String.valueOf(pageNoo); 
				}	
				List<Type> tlist = new TypeServiceImpl().selectType();
				session.setAttribute("tlist", tlist);
				sessionpage.setAttribute("pageNo", pageNo);
				sessionpage.setAttribute("count", count);
				response.sendRedirect("admin/category-list.jsp");
			}}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flay = request.getParameter("flay");	
		PrintWriter out = response.getWriter();
		//添加判断
		if(flay.equals("tj")) {
			List list = new TypeDao().selectType();
			String t_name = request.getParameter("t_name");
			String t_content = request.getParameter("t_content");
			 new TypeServiceImpl().addType(t_name, t_content);
			List lists = new TypeDao().selectType();
			if(lists.size()>list.size()) {
				out.print("<script>alert('添加成功');window.location.href='TypeServlet'</script>");
			}
			
		
		}
		//修改判断
		if(flay.equals("xg")) {
			String t_id = request.getParameter("t_id");
			String t_name = request.getParameter("t_name");
			String t_content = request.getParameter("t_content");
			new TypeServiceImpl().updateType(Integer.valueOf(t_id), t_name, t_content);
			out.print("<script>alert('修改成功');window.location.href='TypeServlet'</script>");
		};
		//批量删除判断
		if(flay!=null&&flay.equals("plscc")) {
			String[] sc= request.getParameterValues("seleteAll");
			String sb = "";
			int cc = 0;
			int t = 0;
			
			if(sc==null) {
				out.print("<script>alert('请选择一个类别');window.location.href='TypeServlet'</script>");
			}else {
				
			
			for(int i = 0;i<sc.length;i++) {
				if("多余".equals(sc[i])) {
					t=1;
					
				}else {
					
				
				
				boolean b1 =  new TypeServiceImpl().delType(Integer.valueOf(sc[i]));
				
				
				 if(!b1) {
					 sb = sb+"类别id:"+sc[i]+",";
					 cc +=1;
					 
				 }
				}
			}
			if(!"".equals(sb)) {
				out.print("<script>alert('"+(sc.length-cc-t)+"个删除成功"+cc+"个删除失败，因为这些分类下有文章："+sb+"');window.location.href='TypeServlet'</script>");
			} 
			else{
				out.print("<script>alert('全部删除成功');window.location.href='TypeServlet'</script>");
			};
			}
			
		}
		//查询判断
		if(flay!=null&&flay.equals("cx")) {
			String s = request.getParameter("s");

			List<Type> tlist = new TypeServiceImpl().selectsType(s);
			HttpSession session = request.getSession();
			session.setAttribute("tlist", tlist);

			response.sendRedirect("admin/category-list.jsp");	
		}
	}
}
