package com.movie.util;

import java.util.Calendar;

public class GetToday {
	public static String getToday(Calendar cal){
		String st=cal.get(cal.YEAR)+"-"+(cal.get(cal.MONTH)+1)+"-"+cal.get(cal.DATE);
		return st;
	}
}
