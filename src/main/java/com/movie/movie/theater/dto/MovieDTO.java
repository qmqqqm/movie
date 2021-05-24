package com.movie.movie.theater.dto;

import java.sql.Timestamp;

public class MovieDTO {

	private int	movie_id;     
	private String movie_title;       
	private int movie_time; 
	private String movie_Date;  
	private String movie_endDate;     
	private String movie_foreman;     
	private String movie_actor;    
	private String movie_genre;     
	private String movie_rating;      
	private String movie_isshow;
	
	
	public MovieDTO() { }
	
	public MovieDTO(int movie_id, String movie_title, int movie_time, String movie_Date, String movie_endDate,
			String movie_foreman, String movie_actor, String movie_genre, String movie_rating, String movie_isshow) {
		this.movie_id = movie_id;
		this.movie_title = movie_title;
		this.movie_time = movie_time;
		this.movie_Date = movie_Date;
		this.movie_endDate = movie_endDate;
		this.movie_foreman = movie_foreman;
		this.movie_actor = movie_actor;
		this.movie_genre = movie_genre;
		this.movie_rating = movie_rating;
		this.movie_isshow = movie_isshow;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public int getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(int movie_time) {
		this.movie_time = movie_time;
	}

	public String getMovie_Date() {
		return movie_Date;
	}

	public void setMovie_Date(String movie_Date) {
		this.movie_Date = movie_Date;
	}

	public String getMovie_endDate() {
		return movie_endDate;
	}

	public void setMovie_endDate(String movie_endDate) {
		this.movie_endDate = movie_endDate;
	}

	public String getMovie_foreman() {
		return movie_foreman;
	}

	public void setMovie_foreman(String movie_foreman) {
		this.movie_foreman = movie_foreman;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public String getMovie_rating() {
		return movie_rating;
	}

	public void setMovie_rating(String movie_rating) {
		this.movie_rating = movie_rating;
	}

	public String getMovie_isshow() {
		return movie_isshow;
	}

	public void setMovie_isshow(String movie_isshow) {
		this.movie_isshow = movie_isshow;
	}

	@Override
	public String toString() {
		return "MovieDTO [movie_id=" + movie_id + ", movie_title=" + movie_title + ", movie_time=" + movie_time
				+ ", movie_Date=" + movie_Date + ", movie_endDate=" + movie_endDate + ", movie_foreman=" + movie_foreman
				+ ", movie_actor=" + movie_actor + ", movie_genre=" + movie_genre + ", movie_rating=" + movie_rating
				+ ", movie_isshow=" + movie_isshow + "]";
	}
	
	
	
	
}
