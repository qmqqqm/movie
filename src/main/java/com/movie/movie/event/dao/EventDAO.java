package com.movie.movie.event.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;
import com.movie.movie.theater.dto.RowDTO;

public interface EventDAO {

	//카테고리 가져오기
	public List<String> categoryList() throws DataAccessException;

	public EventDTO eventInform(int event_id) throws DataAccessException;

	public List<EventImageDTO> imageList(int event_id) throws DataAccessException;

	//카테고리 별 정보가져오기
	public List<EventDTO> eventList(String category, RowDTO rowDTO) throws DataAccessException;
	
}
