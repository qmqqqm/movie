package com.movie.movie.event.service;

import java.util.List;
import java.util.Map;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.theater.dto.RowDTO;

public interface EventService {

	//events.do 관련
	//카테고리 정보 가져오기 
	public List<String> categoryList() throws Exception;
	
	//카테고리 별 이벤트 정보 가져오기
	public Map<String, List<EventDTO>> eventList(List<String> categoryList, RowDTO rowDTO) throws Exception;


	//DetailEvents.do 관련
	public Map eventInform(int event_id) throws Exception;

	public List<EventDTO> moreEventList(String category, RowDTO rowDTO) throws Exception;


}
