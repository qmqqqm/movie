package com.movie.movie.theater.dto;

import java.util.Date;

public class TheaterImageDTO {

	private int image_id; //이미지 번호
	private String filename;//파일명
	private String reg_name; //등록자 아이디
	private Date credate; //등록일자
	private String isShow; //삭제여부
	
	public TheaterImageDTO() {}
	public TheaterImageDTO(int image_id, String filename, String reg_name, Date credate, String isShow) {
		this.image_id = image_id;
		this.filename = filename;
		this.reg_name = reg_name;
		this.credate = credate;
		this.isShow = isShow;
	}

	public int getImage_id() {
		return image_id;
	}

	public void setImage_id(int image_id) {
		this.image_id = image_id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getReg_name() {
		return reg_name;
	}

	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}

	public Date getCredate() {
		return credate;
	}

	public void setCredate(Date credate) {
		this.credate = credate;
	}

	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}
	
	@Override
	public String toString() {
		return "TheaterImageDTO [image_id=" + image_id + ", filename=" + filename + ", reg_name=" + reg_name
				+ ", credate=" + credate + ", isShow=" + isShow + "]";
	}
	
}
