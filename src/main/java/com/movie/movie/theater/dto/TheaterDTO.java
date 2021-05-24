package com.movie.movie.theater.dto;

import org.springframework.stereotype.Component;

@Component("theaterDTO")
public class TheaterDTO {
	private int    theater_id;
	private String theater_name;
	private String theater_location;
	private String theater_address;
	private String theater_phone;
	private String theater_isshow;
	private int image_id;
	
	//constructor	
	public TheaterDTO() {}

	public TheaterDTO(int theater_id, String theater_name, String theater_location, String theater_address,
			String theater_phone, String theater_isshow,int image_id) {
	
		this.theater_id = theater_id;
		this.theater_name = theater_name;
		this.theater_location = theater_location;
		this.theater_address = theater_address;
		this.theater_phone = theater_phone;
		this.theater_isshow = theater_isshow;
		this.image_id = image_id;
	}

	//getter&setter
	public int getTheater_id() {
		return theater_id;
	}

	public void setTheater_id(int theater_id) {
		this.theater_id = theater_id;
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public String getTheater_location() {
		return theater_location;
	}

	public void setTheater_location(String theater_location) {
		this.theater_location = theater_location;
	}

	public String getTheater_address() {
		return theater_address;
	}

	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}

	public String getTheater_phone() {
		return theater_phone;
	}

	public void setTheater_phone(String theater_phone) {
		this.theater_phone = theater_phone;
	}

	public String getTheater_isshow() {
		return theater_isshow;
	}

	public void setTheater_isshow(String theater_isshow) {
		this.theater_isshow = theater_isshow;
	}
	
	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}


	@Override
	public String toString() {
		return "TheaterDTO [theater_id=" + theater_id + ", theater_name=" + theater_name + ", theater_location="
				+ theater_location + ", theater_address=" + theater_address + ", theater_phone=" + theater_phone
				+ ", theater_isshow=" + theater_isshow + ", image_id=" + image_id + "]";
	}

}
