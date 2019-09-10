package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONArray;
import com.blog.dao.UserDAO;
import com.blog.entity.User;
import com.blog.servicesImpl.UserServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/admin/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int  PAGE_SIZE=5;
	public UserServlet() {
		super();

	}

	// 查询用户信息
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if ("tolist".equals(action)) {
			List<User> ulist = new ArrayList<>();
			ulist = new UserServiceImpl().queryAll(ulist);
			session.setAttribute("list", ulist);
			response.sendRedirect("user-list.jsp");
		} else if ("delete".equals(action)) {
			// doGet(request,response);
			String userid = request.getParameter("userid");
			int id = Integer.valueOf(userid);
			new UserServiceImpl().deleteUser(id);
			response.sendRedirect("User?action=tolist");
		} else if ("toupdate".equals(action)) {
			int userid = Integer.valueOf(request.getParameter("userid"));
			User user = new UserServiceImpl().queryById(userid);
			session.setAttribute("user", user);
			response.sendRedirect("user-modify.jsp");
			/*
			 * } else if ("search".equals(action)) {
			 * 
			 * String username = request.getParameter("searchname"); List<User> list = new
			 * ArrayList<>(); list = new UserServiceImpl().queryMessage(username);
			 * session.setAttribute("list", list); // for(User s:list) { //
			 * System.out.println(s.toString()); // }
			 * response.sendRedirect("user-list.jsp");
			 */
		} else if ("logout".equals(action)) {
			Cookie[] cookies = request.getCookies();
			for (Cookie ck : cookies)
				if ("userid".equals(ck.getName())) {
					System.out.println(ck.getName());
					ck.setMaxAge(1);
					ck.setPath("/");
					response.addCookie(ck);
					System.out.println(222);
				}
			session.invalidate();
			response.sendRedirect("../login.jsp");
		} else if(action==null||"page".equals(action)) {
			String pageNo = request.getParameter("pageNo");
			int totalCount = new UserServiceImpl().queryTotal();
			UserServiceImpl userServiceImpl = new UserServiceImpl();
			int totalPage = totalCount/PAGE_SIZE +1;
			int iPageNo = 1;
			if (pageNo != null && !"".equals(pageNo)) 
				iPageNo = Integer.valueOf(pageNo);
			
			List<User> list =userServiceImpl.queryByPage((iPageNo-1)*PAGE_SIZE, PAGE_SIZE);
	
			for (User u : list) {
				System.out.println(u.getUserid());
			}
			request.setAttribute("iPageNo", iPageNo);
			request.setAttribute("totalCount", totalCount);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("list", list);
			request.getRequestDispatcher("user-list.jsp").forward(request, response);
			}
		 else if(action.equals("user")) {
			
		}
		

	}

	// 新增用户信息
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");

		if ("add".equals(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String intro = request.getParameter("intro");
			String headImg = request.getParameter("headImg");
			System.out.println(username);
			if ("".equals(username) || "".equals(password)) {
				response.sendRedirect("user-add.jsp");
			} else {
				new UserServiceImpl().addUser(username, password, intro, headImg);
				response.sendRedirect("User?action=page");
			}
		}

		if ("update".equals(action)) {
			String userid = request.getParameter("userid");
			String password = request.getParameter("password");
			String intro = request.getParameter("intro");
			String headImg = request.getParameter("headImg");

			new UserServiceImpl().updateUser(Integer.valueOf(userid), password, intro, headImg);
			User user = new UserServiceImpl().queryById(Integer.valueOf(userid));
			request.setAttribute("user", user);
			response.sendRedirect("User?action=tolist");
			// request.getRequestDispatcher("user-modify.jsp").forward(request, response);
		} else if ("deleteAll".equals(action)) {
			System.out.println("fdsafsa");
			PrintWriter out = response.getWriter();
			String ids = request.getParameter("ids");
			// System.out.println(ids);
			String[] idStr = ids.split(",");

			for (int i = 0; i < idStr.length; i++)
				new UserServiceImpl().deleteUser(Integer.parseInt(idStr[i]));

			List<User> ulist = new ArrayList<>();
			ulist = new UserServiceImpl().queryAll(ulist);

			// String jStr=JSONArray.toJSONString(ulist);
			String jStr = JSONArray.toJSONString(ulist);

			out.print(jStr);
			out.flush();
			out.close();

		}
		
	}
}
