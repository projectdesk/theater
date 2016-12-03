package com.movie.dto;

public class TimeDTO {
	private int no;
	private String time;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time.substring(0, 5);
	}
	
}
