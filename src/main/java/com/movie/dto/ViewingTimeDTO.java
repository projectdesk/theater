package com.movie.dto;

public class ViewingTimeDTO {
	private int viewing_id;
	private int rood_idx;
	private String movie_serial;
	private String movie_name;
	private int viewing_minuit;
	private int remain_seat;
	public int getViewing_id() {
		return viewing_id;
	}
	public void setViewing_id(int viewing_id) {
		this.viewing_id = viewing_id;
	}
	public int getRood_idx() {
		return rood_idx;
	}
	public void setRood_idx(int rood_idx) {
		this.rood_idx = rood_idx;
	}
	public String getMovie_serial() {
		return movie_serial;
	}
	public void setMovie_serial(String movie_serial) {
		this.movie_serial = movie_serial;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public int getViewing_minuit() {
		return viewing_minuit;
	}
	public void setViewing_minuit(int viewing_minuit) {
		this.viewing_minuit = viewing_minuit;
	}
	public int getRemain_seat() {
		return remain_seat;
	}
	public void setRemain_seat(int remain_seat) {
		this.remain_seat = remain_seat;
	}
	
}
