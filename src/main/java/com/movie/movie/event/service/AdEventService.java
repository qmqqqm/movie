package com.movie.movie.event.service;

import java.util.List;
import java.util.Map;

import com.movie.movie.event.dto.EventDTO;

public interface AdEventService {

	public List<String> categoryList()throws Exception;

	public Map<String, Object> eventList(List<String> categoryList) throws Exception;

	public int insertEvent(Map newEventMap) throws Exception;

	public void deleteEvent(int event_id) throws Exception;

	public Map eventInform(int event_id) throws Exception;

	public void modifyEvent(Map newEventMap) throws Exception;

	public void insertFile(Map<String, Object> temp) throws Exception;

	public void updateFile(Map<String, Object> temp) throws Exception;

	public void deleteEventDel(int event_id) throws Exception;

	public List<String> selectdel(int event_id) throws Exception;


}
