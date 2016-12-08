package com.movie.dto;

public class ReservationDTO {
	private int time_no;
	private String seat;
	private String user;
	public int getTime_no() {
		return time_no;
	}
	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	
}
