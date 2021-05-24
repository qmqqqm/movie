package com.movie.movie.board.notice.dto;

import java.util.Date;

import org.springframework.stereotype.Component;


@Component("NoticeDTO")
public class NoticeDTO {
	private int notice_id;
	private String notice_title;
	private String member_id;
	private String  notice_content;
	private Date notice_date;
	private Date notice_modify;
	private String notice_isShow;
	
	public NoticeDTO() {}

	public NoticeDTO(int notice_id, String notice_title, String member_id, String notice_content, Date notice_date,
			Date notice_modify, String notice_isShow) {
		super();
		this.notice_id = notice_id;
		this.notice_title = notice_title;
		this.member_id = member_id;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_modify = notice_modify;
		this.notice_isShow = notice_isShow;
	}

	public int getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public Date getNotice_modify() {
		return notice_modify;
	}

	public void setNotice_modify(Date notice_modify) {
		this.notice_modify = notice_modify;
	}

	public String getNotice_isShow() {
		return notice_isShow;
	}

	public void setNotice_isShow(String notice_isShow) {
		this.notice_isShow = notice_isShow;
	}

	@Override
	public String toString() {
		return "NoticerDTO [notice_id=" + notice_id + ", notice_title=" + notice_title + ", member_id=" + member_id
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_modify="
				+ notice_modify + ", notice_isShow=" + notice_isShow + "]";
	}

}