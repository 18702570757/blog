package com.blog.dao;
import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Total {
	@Column(name = "total")
	private int total;

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
