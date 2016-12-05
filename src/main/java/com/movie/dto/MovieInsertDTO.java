package com.movie.dto;

public class MovieInsertDTO {
	private int no;
	private String theater;
	private String movie;
	private String date;
	private int date_no;
	private String time;
	private int max;
	private String room;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTheater() {
		return theater;
	}
	
	public String getMovie() {
		return movie;
	}
	public void setMovie(String movie) {
		this.movie = movie;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getDate_no() {
		return date_no;
	}
	public void setDate_no(int date_no) {
		this.date_no = date_no;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	
}
