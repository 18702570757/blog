package com.blog.utils;


import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DateUtil {
	public static final String DATEFORMAT="yyyy-MM-dd HH:mm:ss";
	
	//将日期转化为时间戳
	public static Timestamp timeToStamp(Date date) {
		SimpleDateFormat smf=new SimpleDateFormat(DATEFORMAT);
		String time=smf.format(date.getTime());
		return dateToStamp(time);
	}
	//将时间戳转化为字符串
	public static String stampToDate(Timestamp ts) {
		SimpleDateFormat smf=new SimpleDateFormat(DATEFORMAT);
		return smf.format(ts);
	}
	
	//将字符串转化为timestamp
	public static Timestamp dateToStamp(String date) {
		SimpleDateFormat smf=new SimpleDateFormat(DATEFORMAT);
		Date da=null;
		try {
			da=smf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return new Timestamp(da.getTime());
	}
}
