package com.movie.movie.dto;

public class ReviewDto {

	private int review_id;
	private int movie_id;
	private String review_review;
	private String review_grade;
	private String member_id;
	private String member_name;
	
	public ReviewDto() {}
	
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_review() {
		return review_review;
	}
	public void setReview_review(String review_review) {
		this.review_review = review_review;
	}
	public String getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	@Override
	public String toString() {
		return "ReviewDto [review_id=" + review_id + ", movie_id=" + movie_id + ", review_review=" + review_review
				+ ", review_grade=" + review_grade + ", member_id=" + member_id + ", member_name=" + member_name + "]";
	}




	
	
	
}
