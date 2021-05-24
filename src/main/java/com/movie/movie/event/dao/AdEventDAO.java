package com.movie.movie.event.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;

public interface AdEventDAO {

	public List<String> categoryList() throws DataAccessException;

	public List<EventDTO> eventList(String category)throws DataAccessException;

	public int insertEvent(Map newEventMap)throws DataAccessException;

	public void insertEventImage(List eventImageList)throws DataAccessException;

	public EventDTO updateEvent(EventDTO event)throws DataAccessException;

	public void deleteEvent(int event_id)throws DataAccessException;

	public EventDTO eventInform(int event_id)throws DataAccessException;

	public List<EventImageDTO> imageList(int event_id) throws DataAccessException;

	public int modifyEvent(Map newEventMap) throws DataAccessException;

	public void insertFile(Map<String, Object> temp) throws DataAccessException;

	public void updateFile(Map<String, Object> temp) throws DataAccessException;

	public void deleteDel(Map newEventMap) throws DataAccessException;

	public void deleteEventDel(int event_id) throws DataAccessException;

	public List<String> selectdel(int event_id) throws DataAccessException;



}
