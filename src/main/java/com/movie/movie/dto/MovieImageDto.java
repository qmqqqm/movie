package com.movie.movie.dto;

import java.util.Date;

public class MovieImageDto {

	private int movie_id;   
	private int movieImage_id;
	private String movieImage_fileName;
	private String movieImage_fileType;
	private Date movieImage_created;
	
	public MovieImageDto(){}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public int getMovieImage_id() {
		return movieImage_id;
	}

	public void setMovieImage_id(int movieImage_id) {
		this.movieImage_id = movieImage_id;
	}

	public String getMovieImage_fileName() {
		return movieImage_fileName;
	}

	public void setMovieImage_fileName(String movieImage_fileName) {
		this.movieImage_fileName = movieImage_fileName;
	}

	public String getMovieImage_fileType() {
		return movieImage_fileType;
	}

	public void setMovieImage_fileType(String movieImage_fileType) {
		this.movieImage_fileType = movieImage_fileType;
	}

	public Date getMovieImage_created() {
		return movieImage_created;
	}

	public void setMovieImage_created(Date movieImage_created) {
		this.movieImage_created = movieImage_created;
	}
	
	
}
	
	
