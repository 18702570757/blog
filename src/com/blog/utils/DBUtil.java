package com.blog.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.sql.rowset.CachedRowSet;
import com.sun.rowset.CachedRowSetImpl;

public class DBUtil {

	private final static String URL = "jdbc:mysql://localhost/blog";
	private final static String USER = "root";
	private final static String PASSWORD = "123456";
	private final static String DRIVER = "com.mysql.jdbc.Driver";




	/**
	 * 定义方法返回一个连接(Connection)对象
	 * 
	 * @return 返回值就是一个连接对象
	 */

	static DataSource datasource;
	//静态代码块加载类时立即加载
	static {
		Context initial;
		try {
			initial = new InitialContext();
			//得到上下文引用
			datasource= (DataSource) initial.lookup("java:comp/env/jdbc/mysql");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
	}
	
	//利用context上下文获取数据库连接池属性进行连接

	private static Connection getConnection() {
		Connection conn=null;
		try {
			conn = datasource.getConnection();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return conn;
	}
	
	//增删改操作
	public static int execUpdate(String sql, Object... param) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
		return result;
	}

	//查询操作
	public static CachedRowSet execQuery(String sql, Object... param) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 实例化CachedRowSetImpl
		CachedRowSetImpl crs = null;
		try {
			crs = new CachedRowSetImpl();
			pstmt = conn.prepareStatement(sql);
			//param当成是一个数组
			for (int i = 0; i < param.length; i++) {
				pstmt.setObject(i + 1, param[i]);
			}
			rs = pstmt.executeQuery();
			
			// 建立rs和crs关系，可以将rs的数据行缓存到crs中了
			crs.populate(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放资源等 此处代码省略
			closeAll(rs, pstmt, conn);
		}
		
		
		return crs;
	}

	//释放资源操作
	private static void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
