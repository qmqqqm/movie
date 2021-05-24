package com.movie.movie.theater.dto;

public class SangygDTO {
	private int sangyg_id;
	private int theater_id;        
	private String sangyg_name;   
	private String sangyg_isshow;   
	private int sangyg_seats;
	
	
	public SangygDTO() {}
	public SangygDTO(int sangyg_id, int theater_id, String sangyg_name, String sangyg_isshow, int sangyg_seats) {
		this.sangyg_id = sangyg_id;
		this.theater_id = theater_id;
		this.sangyg_name = sangyg_name;
		this.sangyg_isshow = sangyg_isshow;
		this.sangyg_seats = sangyg_seats;
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
	public String getSangyg_name() {
		return sangyg_name;
	}
	public void setSangyg_name(String sangyg_name) {
		this.sangyg_name = sangyg_name;
	}
	public String getSangyg_isshow() {
		return sangyg_isshow;
	}
	public void setSangyg_isshow(String sangyg_isshow) {
		this.sangyg_isshow = sangyg_isshow;
	}
	public int getSangyg_seats() {
		return sangyg_seats;
	}
	public void setSangyg_seats(int sangyg_seats) {
		this.sangyg_seats = sangyg_seats;
	}
	
	@Override
	public String toString() {
		return "SangygDTO [sangyg_id=" + sangyg_id + ", theater_id=" + theater_id + ", sangyg_name=" + sangyg_name
				+ ", sangyg_isshow=" + sangyg_isshow + ", sangyg_seats=" + sangyg_seats + "]";
	}  
	
	
	

	
	
}
