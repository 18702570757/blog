package com.blog.entity;

import java.sql.Timestamp;

//文章实体类
public class Article {
	//文章编号
	private int aid;
	//文章标题
	private String atitle;
	//文章内容
	private String acontent;
	//文章发布时间戳
	private Timestamp adate;
	//访问次数
	private int vcount;
	//点赞次数
	private int ccount;
	//反赞次数
	private int cdiss;
	//类别编号
	private int tid;
	
	//用户编号
	private int uid;
	//文章标签
	private int atag;
	//文章摘要
	private String asummary;
	
	//存储类别名称（仅用于存储数据，无需将其加入数据库）
	private String tname;
	
	public Article() {
		super();
	}
	
	public Article(int aid, String atitle, String acontent, Timestamp adate, int vcount, int ccount,
			int cdiss, int tid, int uid, int atag,String asummary) {
		super();
		this.aid = aid;
		this.atitle = atitle;
		this.acontent = acontent;
		this.adate = adate;
		this.vcount = vcount;
		this.ccount = ccount;
		this.cdiss = cdiss;
		this.tid = tid;
		this.uid = uid;
		this.atag = atag;
		this.asummary=asummary;
		
	}
	public String getAsummary() {
		return asummary;
	}

	public void setAsummary(String asummary) {
		this.asummary = asummary;
	}

	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getAtitle() {
		return atitle;
	}
	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public Timestamp getAdate() {
		return adate;
	}
	public void setAdate(Timestamp adate) {
		this.adate = adate;
	}
	public int getVcount() {
		return vcount;
	}
	public void setVcount(int vcount) {
		this.vcount = vcount;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
	public int getCdiss() {
		return cdiss;
	}
	public void setCdiss(int cdiss) {
		this.cdiss = cdiss;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getAtag() {
		return atag;
	}
	public void setAtag(int atag) {
		this.atag = atag;
	}
	
	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	@Override
	public String toString() {
		return "Article [aid=" + aid + ", atitle=" + atitle + ", acontent=" + acontent + ", adate=" + adate
				+ ", vcount=" + vcount + ", ccount=" + ccount + ", cdiss=" + cdiss + ", tid=" + tid + ", uid=" + uid
				+ ", atag=" + atag + ", asummary=" + asummary + ", tname=" + tname + "]";
	}

}
