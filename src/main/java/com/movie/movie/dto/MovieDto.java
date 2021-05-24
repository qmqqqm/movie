package com.movie.movie.dto;

import java.sql.Date;

public class MovieDto {

	private int movie_id;
	private String movie_title;
	private String movie_time;
	private String movie_Date;
	private String movie_endDate;   
	private String  movie_actor;
	private String  movie_genre;
	private String movie_foreman;
	private String  movie_rating;
	private String movie_mainInfo;
	private String movieImage_fileName;
	private String movieimage_filetype;
	private int movieimage_id;
	private int rownum;
	
	public MovieDto() {}

	
	public int getMovieimage_id() {
		return movieimage_id;
	}

	public void setMovieimage_id(int movieimage_id) {
		this.movieimage_id = movieimage_id;
	}

	public String getMovieimage_filetype() {
		return movieimage_filetype;
	}


	public void setMovieimage_filetype(String movieimage_filetype) {
		this.movieimage_filetype = movieimage_filetype;
	}


	public String getMovieImage_fileName() {
		return movieImage_fileName;
	}

	public void setMovieImage_fileName(String movieImage_fileName) {
		this.movieImage_fileName = movieImage_fileName;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getMovie_mainInfo() {
		return movie_mainInfo;
	}


	public void setMovie_mainInfo(String movie_mainInfo) {
		this.movie_mainInfo = movie_mainInfo;
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

	public String getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(String movie_time) {
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

	public String getMovie_foreman() {
		return movie_foreman;
	}

	public void setMovie_foreman(String movie_foreman) {
		this.movie_foreman = movie_foreman;
	}

	public String getMovie_rating() {
		return movie_rating;
	}

	public void setMovie_rating(String movie_rating) {
		this.movie_rating = movie_rating;
	}



	@Override
	public String toString() {
		return "MovieDto [movie_id=" + movie_id + ", movie_title=" + movie_title + ", movie_time=" + movie_time
				+ ", movie_Date=" + movie_Date + ", movie_endDate=" + movie_endDate + ", movie_actor=" + movie_actor
				+ ", movie_genre=" + movie_genre + ", movie_foreman=" + movie_foreman + ", movie_rating=" + movie_rating
				+ ", movie_mainInfo=" + movie_mainInfo + ", movieImage_fileName=" + movieImage_fileName
				+ ", movieimage_filetype=" + movieimage_filetype + ", rownum=" + rownum + "]";
	}


	
	
	
}
