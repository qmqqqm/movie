package com.movie.movie.theater.dto;

import java.util.Date;

public class BeforeTimeDTO {
	private int sangyg_id;
	private int theater_id;
	private int movie_id;
	private int times_seat;
	private Date times_time;
	
	
	public BeforeTimeDTO() {
	}
	public BeforeTimeDTO(int sangyg_id, int theater_id, int movie_id, int times_seat, Date times_time) {
		this.sangyg_id = sangyg_id;
		this.theater_id = theater_id;
		this.movie_id = movie_id;
		this.times_seat = times_seat;
		this.times_time = times_time;
	}
	public int getSangyg_id() {
		return sangyg_id;
	}
	public void setSangyg_id(int sangyg_id) {
		this.sangyg_id = sangyg_id;
	}
	public int getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public int getTimes_seat() {
		return times_seat;
	}
	public void setTimes_seat(int times_seat) {
		this.times_seat = times_seat;
	}
	public Date getTimes_time() {
		return times_time;
	}
	public void setTimes_time(Date times_time) {
		this.times_time = times_time;
	}
	
	
}

