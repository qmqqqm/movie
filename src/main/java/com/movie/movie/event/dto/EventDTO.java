package com.movie.movie.event.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EventDTO {
		private int event_id;       
		private String event_category;   
		private String event_title;
		private String event_content; 
		private String event_wday; 
		private String event_start; 
		private String event_end;  
		private String event_isshow;
		private String event_image_filename;
		private String event_status;
	
		public EventDTO() {
		}

		
		public String getEvent_status() {
			return event_status;
		}


		public void setEvent_status(String event_status) {
			this.event_status = event_status;
		}


		public int getEvent_id() {
			return event_id;
		}

		public void setEvent_id(int event_id) {
			this.event_id = event_id;
		}

		public String getEvent_category() {
			return event_category;
		}

		public void setEvent_category(String event_category) {
			this.event_category = event_category;
		}

		public String getEvent_title() {
			return event_title;
		}

		public void setEvent_title(String event_title) {
			this.event_title = event_title;
		}

		public String getEvent_content() {
			return event_content;
		}

		public void setEvent_content(String event_content) {
			this.event_content = event_content;
		}

		public String getEvent_wday() {
			return event_wday;
		}

		public void setEvent_wday(Date event_wday) {
			this.event_wday = changeFormat(event_wday);
		}

		public String getEvent_start() {
			return event_start;
		}

		public void setEvent_start(Date event_start) {
			this.event_start = changeFormat(event_start);
		}

		public String getEvent_end() {
			return event_end;
		}

		public void setEvent_end(Date event_end) {
			this.event_end = changeFormat(event_end);
		}

		public String getEvent_isshow() {
			return event_isshow;
		}

		public void setEvent_isshow(String event_isshow) {
			this.event_isshow = event_isshow;
		}

		public String getEvent_image_filename() {
			return event_image_filename;
		}

		public void setEvent_image_filename(String event_image_filename) {
			this.event_image_filename = event_image_filename;
		}

		@Override
		public String toString() {
			return "EventDTO [event_id=" + event_id + ", event_category=" + event_category + ", event_title="
					+ event_title + ", event_content=" + event_content + ", event_wday=" + event_wday + ", event_start="
					+ event_start + ", event_end=" + event_end + ", event_isshow=" + event_isshow
					+ ", event_image_filename=" + event_image_filename + "]";
		}

		public String changeFormat(Date date) {
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String changedDate = transFormat.format(date);
			return changedDate;}

		
		

		
}
