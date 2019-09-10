package com.blog.entity;

import java.sql.Timestamp;
/**
 * @author fq
 *
 * 2019年7月1日
 */
public class Comment {
	//该评论的id
	private int cid;
	//评论的内容
	private String ccontent;
	//评论的日期
	private Timestamp cdate;
	//评论所在的主机ip
	private String cip;
	//评论所在文章的id
	private int aid;
	//用于评论用户信息交互，评论用户的父级id，默认是0
	private int pid;
	public Comment() {
		super();
	}
	public Comment(int cid, String ccontent, Timestamp c_date, String cip, int aid, int pid) {
		super();
		this.cid = cid;
		this.ccontent = ccontent;
		this.cdate = c_date;
		this.cip = cip;
		this.aid = aid;
		this.pid = pid;
	}
	public Comment(int cid, String ccontent, Timestamp c_date, String cip, int aid) {
		super();
		this.cid = cid;
		this.ccontent = ccontent;
		this.cdate = c_date;
		this.cip = cip;
		this.aid = aid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public String getCip() {
		return cip;
	}
	public void setCip(String cip) {
		this.cip = cip;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", ccontent=" + ccontent + ", cdate=" + cdate + ", cip=" + cip + ", aid=" + aid
				+ ", pid=" + pid + "]";
	}
	
}
