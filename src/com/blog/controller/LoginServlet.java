package com.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.UserDAO;
import com.blog.entity.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if ("login".equals(action)) {
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			String[] rem = request.getParameterValues("rem");
			String r = "";
			if(rem != null)
				r = rem[0];
			System.out.println(r);
			User user = new UserDAO().log(name, pwd);
			if (user == null) {
				response.sendRedirect("login.jsp?tag=1");
			} else {
				if ("on".equals(r)) {
					Cookie cookie = new Cookie("userid", String.valueOf(user.getUserid()));
					cookie.setPath("/");
					cookie.setMaxAge(60 * 30);
					response.addCookie(cookie);
				}
				session.setAttribute("userid", user.getUserid());
				session.setAttribute("username", user.getUsername());
				response.sendRedirect("admin/index.jsp");
			}
			// doGet(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
