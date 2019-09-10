package com.blog.utils;
import java.util.ArrayList;
import java.util.List;

public class Page<T> {
	// 总页数
	private int totalPageCount = 1;
	// 页面大小，即每页显示记录数
	private int pageSize = 10;
	// 记录总数
	private int totalCount = 0;
	// 当前页码
	private int currPageNo = 1;
	// 每页集合
	List<T> list = new ArrayList<>();

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	// 省略getter/setter方法
	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}


}

