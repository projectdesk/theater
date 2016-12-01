package com.movie.dto;

public class TheaterRoomDTO {
	private int room_idx;
	private int theater_no;
	private int theater_room_no;
	private int max_seat;
	public int getRoom_idx() {
		return room_idx;
	}
	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}
	public int getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}
	public int getTheater_room_no() {
		return theater_room_no;
	}
	public void setTheater_room_no(int theater_room_no) {
		this.theater_room_no = theater_room_no;
	}
	public int getMax_seat() {
		return max_seat;
	}
	public void setMax_seat(int max_seat) {
		this.max_seat = max_seat;
	}
	
}
