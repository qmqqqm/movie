package com.movie.movie.theater.dto;

public class BookMarkDTO {
	
	private int bookmark_id;
	private int member_id;
	private String bookmark_fir;
	private String bookmark_se;
	private String bookmark_th;
	private String bookmark_fo;
	private String bookmark_fiv;
	
	public BookMarkDTO() {}
	public BookMarkDTO(int bookmark_id, int member_id, String bookmark_fir, String bookmark_se, String bookmark_th,
			String bookmark_fo, String bookmark_fiv) {
		this.bookmark_id = bookmark_id;
		this.member_id = member_id;
		this.bookmark_fir = bookmark_fir;
		this.bookmark_se = bookmark_se;
		this.bookmark_th = bookmark_th;
		this.bookmark_fo = bookmark_fo;
		this.bookmark_fiv = bookmark_fiv;
	}
	public int getBookmark_id() {
		return bookmark_id;
	}
	public void setBookmark_id(int bookmark_id) {
		this.bookmark_id = bookmark_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getBookmark_fir() {
		return bookmark_fir;
	}
	public void setBookmark_fir(String bookmark_fir) {
		this.bookmark_fir = bookmark_fir;
	}
	public String getBookmark_se() {
		return bookmark_se;
	}
	public void setBookmark_se(String bookmark_se) {
		this.bookmark_se = bookmark_se;
	}
	public String getBookmark_th() {
		return bookmark_th;
	}
	public void setBookmark_th(String bookmark_th) {
		this.bookmark_th = bookmark_th;
	}
	public String getBookmark_fo() {
		return bookmark_fo;
	}
	public void setBookmark_fo(String bookmark_fo) {
		this.bookmark_fo = bookmark_fo;
	}
	public String getBookmark_fiv() {
		return bookmark_fiv;
	}
	public void setBookmark_fiv(String bookmark_fiv) {
		this.bookmark_fiv = bookmark_fiv;
	}
	
	@Override
	public String toString() {
		return "BookMarkDTO [bookmark_id=" + bookmark_id + ", member_id=" + member_id + ", bookmark_fir=" + bookmark_fir
				+ ", bookmark_se=" + bookmark_se + ", bookmark_th=" + bookmark_th + ", bookmark_fo=" + bookmark_fo
				+ ", bookmark_fiv=" + bookmark_fiv + "]";
	}
	
	

}
