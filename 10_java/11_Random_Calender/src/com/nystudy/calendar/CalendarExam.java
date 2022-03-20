package com.nystudy.calendar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarExam {

	public static void main(String[] args) {
		Date date = new Date();
		System.out.println("new Date() :"+ date);
		
		// 년 : 입력된 년도 값에 더해진 결과값이 사용됨.
		// 월 : 0~11로 되어있다 0:1월 1:2월 2:3월 3:4월 4:5월 5:6월 ....11:12월
		date = new Date(2021-1900,6,29);
		System.out.println(date);
		
		
		System.out.println("------Calendar------");
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		
		System.out.println("년도 :"+cal.get(Calendar.YEAR));
		System.out.println("월 :"+(cal.get(Calendar.MONTH)+1));
		System.out.println("일 :"+cal.get(Calendar.DATE));
		System.out.println("일 :"+cal.get(Calendar.DAY_OF_MONTH));
		
		//cal.add(Calendar.HOUR,5);
		System.out.println("오전오후 :"+cal.get(Calendar.AM_PM));
		System.out.println("시(12시간) :"+cal.get(Calendar.HOUR));
		System.out.println("시(24시간) :"+cal.get(Calendar.HOUR_OF_DAY));
		System.out.println("분 :"+cal.get(Calendar.MINUTE));
		System.out.println("초 :"+cal.get(Calendar.SECOND));
		
		System.out.println("-------------------------------");
		//년-월-일 시:분:초 또는 년/월/일 시:분:초
		String dateTime = cal.get(Calendar.YEAR)+
						"-"+(cal.get(Calendar.MONTH)+1)+
						"-"+cal.get(Calendar.DATE)+
						"-"+cal.get(Calendar.HOUR_OF_DAY)+
						"-"+cal.get(Calendar.MINUTE)+
						"-"+cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초 : "+ dateTime);
		cal.add(Calendar.YEAR,2);
		cal.add(Calendar.MONTH,2);
		cal.add(Calendar.DATE,2);
		cal.add(Calendar.HOUR_OF_DAY,2);
		cal.add(Calendar.MINUTE,2);
		cal.add(Calendar.SECOND,2);
		showDate();
		
		System.out.println();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		date = new Date();
		System.out.println("new Date() :"+date);
		
		System.out.println("yyyy-mm-dd hh:mm:ss : "+sdf.format(date));
		sdf = new SimpleDateFormat("yyyy/mm/dd h:m:s");
		System.out.println("yyyy/mm/dd h:m:s : "+ sdf.format(date));

	}
	static void showDate() {
		Calendar cal = Calendar.getInstance();
		String dateTime = cal.get(Calendar.YEAR)+
				"-"+(cal.get(Calendar.MONTH)+1)+
				"-"+cal.get(Calendar.DATE)+
				"-"+cal.get(Calendar.HOUR_OF_DAY)+
				"-"+cal.get(Calendar.MINUTE)+
				"-"+cal.get(Calendar.SECOND);
		System.out.println(">> 년-월-일 시:분:초"+ dateTime);
		

	}
}



















