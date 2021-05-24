package com.movie.movie.event.dto;

import java.util.Date;

public class EventImageDTO {
	private int event_image_id;        
	private int event_id;                         
	private String event_image_filename;         
	private String event_image_filetype;          
	private Date event_image_credate;
	
	public EventImageDTO() {
		
	}

	public int getEvent_image_id() {
		return event_image_id;
	}

	public void setEvent_image_id(int event_image_id) {
		this.event_image_id = event_image_id;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_image_filename() {
		return event_image_filename;
	}

	public void setEvent_image_filename(String event_image_filename) {
		this.event_image_filename = event_image_filename;
	}

	public String getEvent_image_filetype() {
		return event_image_filetype;
	}

	public void setEvent_image_filetype(String event_image_filetype) {
		this.event_image_filetype = event_image_filetype;
	}

	public Date getEvent_image_credate() {
		return event_image_credate;
	}

	public void setEvent_image_credate(Date event_image_credate) {
		this.event_image_credate = event_image_credate;
	}

	@Override
	public String toString() {
		return "EventImageDTO [event_image_id=" + event_image_id + ", event_id=" + event_id + ", event_image_filename="
				+ event_image_filename + ", event_image_filetype=" + event_image_filetype + ", event_image_credate="
				+ event_image_credate + "]";
	}

	
}
