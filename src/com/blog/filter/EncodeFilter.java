package com.blog.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter("/EncondFilter")
public class EncodeFilter implements Filter {


	public EncodeFilter() {

	}

	// 定义编码方式 默认为空
	private String encoding =null;
	public void destroy() {
	}
	// 自动调用过滤方法 doFilter
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {


		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse)  response;
		HttpSession session = req.getSession();
		String url = req.getRequestURI();
		String contextPath = req.getContextPath();

		if(url.contains(".css") || url.contains(".js"))
		{//如果发现是css或者js文件，直接放行

		}else {
			// 如果编码不为空就过滤请求中的数据
			if (encoding != null) {
				// 设置request字符编码
				request.setCharacterEncoding(encoding);
				// 设置response字符编码
				response.setContentType("text/html;charset=" + encoding);
			}
			// 传递给下一个过滤器或者下一个servlet/jsp 

		}
		chain.doFilter(request, response);

	}
	public void init(FilterConfig config) throws ServletException {
		//将web.xml中的过滤器的配置编码取出来赋值给  encoding
		encoding=config.getInitParameter("encoding");
	}

}
