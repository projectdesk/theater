package com.movie.dto;

public class ReservationDTO {
	private String seat;
	private String room;
	private String theater;
	private String viewing_id;

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public String getViewing_id() {
		return viewing_id;
	}

	public void setViewing_id(String viewing_id) {
		this.viewing_id = viewing_id;
	}

}
