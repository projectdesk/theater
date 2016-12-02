package com.movie.dto;

public class TheaterRoomDTO {
	private int idx;
	private int theater_idx;
	private int theater_room_idx;
	private String room_name;
	private int max_seat;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getTheater_idx() {
		return theater_idx;
	}
	public void setTheater_idx(int theater_idx) {
		this.theater_idx = theater_idx;
	}
	
	
	public int getTheater_room_idx() {
		return theater_room_idx;
	}
	public void setTheater_room_idx(int theater_room_idx) {
		this.theater_room_idx = theater_room_idx;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getMax_seat() {
		return max_seat;
	}
	public void setMax_seat(int max_seat) {
		this.max_seat = max_seat;
	}
	
}
