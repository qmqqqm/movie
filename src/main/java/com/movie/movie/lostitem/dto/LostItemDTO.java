package com.movie.movie.lostitem.dto;

import java.util.Date;

public class LostItemDTO {

	private int lost_id;
	private int member_id;
	private int member_tel;
	private String member_email;
	private String lost_loc;
	private String lost_theater;
	private String lost_etc;
	private Date lost_day;
	private String lost_type;
	private String lost_color;
	private String lost_title;
	private String lost_content;
	private String lost_isshow;
	private int lost_hour;
	private int lost_min;
	private String lost_anser;
	
	
	public LostItemDTO() {}


	public LostItemDTO(int lost_id, int member_id, int member_tel, String member_email, String lost_loc,
			String lost_theater, String lost_etc, Date lost_day, String lost_type, String lost_color, String lost_title,
			String lost_content, String lost_isshow, int lost_hour, int lost_min, String lost_anser) {
		this.lost_id = lost_id;
		this.member_id = member_id;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.lost_loc = lost_loc;
		this.lost_theater = lost_theater;
		this.lost_etc = lost_etc;
		this.lost_day = lost_day;
		this.lost_type = lost_type;
		this.lost_color = lost_color;
		this.lost_title = lost_title;
		this.lost_content = lost_content;
		this.lost_isshow = lost_isshow;
		this.lost_hour = lost_hour;
		this.lost_min = lost_min;
		this.lost_anser = lost_anser;
	}


	public int getLost_id() {
		return lost_id;
	}


	public void setLost_id(int lost_id) {
		this.lost_id = lost_id;
	}


	public int getMember_id() {
		return member_id;
	}


	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}


	public int getMember_tel() {
		return member_tel;
	}


	public void setMember_tel(int member_tel) {
		this.member_tel = member_tel;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getLost_loc() {
		return lost_loc;
	}


	public void setLost_loc(String lost_loc) {
		this.lost_loc = lost_loc;
	}


	public String getLost_theater() {
		return lost_theater;
	}


	public void setLost_theater(String lost_theater) {
		this.lost_theater = lost_theater;
	}


	public String getLost_etc() {
		return lost_etc;
	}


	public void setLost_etc(String lost_etc) {
		this.lost_etc = lost_etc;
	}


	public Date getLost_day() {
		return lost_day;
	}


	public void setLost_day(Date lost_day) {
		this.lost_day = lost_day;
	}


	public String getLost_type() {
		return lost_type;
	}


	public void setLost_type(String lost_type) {
		this.lost_type = lost_type;
	}


	public String getLost_color() {
		return lost_color;
	}


	public void setLost_color(String lost_color) {
		this.lost_color = lost_color;
	}


	public String getLost_title() {
		return lost_title;
	}


	public void setLost_title(String lost_title) {
		this.lost_title = lost_title;
	}


	public String getLost_content() {
		return lost_content;
	}


	public void setLost_content(String lost_content) {
		this.lost_content = lost_content;
	}


	public String getLost_isshow() {
		return lost_isshow;
	}


	public void setLost_isshow(String lost_isshow) {
		this.lost_isshow = lost_isshow;
	}


	public int getLost_hour() {
		return lost_hour;
	}


	public void setLost_hour(int lost_hour) {
		this.lost_hour = lost_hour;
	}


	public int getLost_min() {
		return lost_min;
	}


	public void setLost_min(int lost_min) {
		this.lost_min = lost_min;
	}


	public String getLost_anser() {
		return lost_anser;
	}


	public void setLost_anser(String lost_anser) {
		this.lost_anser = lost_anser;
	}


	@Override
	public String toString() {
		return "LostItemDTO [lost_id=" + lost_id + ", member_id=" + member_id + ", member_tel=" + member_tel
				+ ", member_email=" + member_email + ", lost_loc=" + lost_loc + ", lost_theater=" + lost_theater
				+ ", lost_etc=" + lost_etc + ", lost_day=" + lost_day + ", lost_type=" + lost_type + ", lost_color="
				+ lost_color + ", lost_title=" + lost_title + ", lost_content=" + lost_content + ", lost_isshow="
				+ lost_isshow + ", lost_hour=" + lost_hour + ", lost_min=" + lost_min + ", lost_anser=" + lost_anser
				+ "]";
	}


	
}
