package com.movie.movie.event.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.event.dao.EventDAO;
import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;
import com.movie.movie.theater.dto.RowDTO;

@Service("eventService")
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDAO;
	
	//카테고리 리스트 가져오기
	@Override
	public List<String> categoryList() throws Exception {
		 List<String> categoryList = eventDAO.categoryList();
		return categoryList;
	}
	
	//카테고리 별 이벤트 정보 가져오기
	@Override
	public Map<String, List<EventDTO>> eventList(List<String> categoryList, RowDTO rowDTO) throws Exception {
		Map<String, List<EventDTO>> eventMap = new HashMap<String, List<EventDTO>>();
		
		for(String category : categoryList) {
			List<EventDTO> eventList = eventDAO.eventList(category,rowDTO);
			eventMap.put(category, eventList);
		}
		
		return eventMap;
	}
	
	//이벤트 상세보기
	@Override
	public Map eventInform(int event_id) throws Exception {
		Map eventInformMap = new HashMap();
		
		//1-1 이벤트 정보가져오기
		EventDTO eventInform = eventDAO.eventInform(event_id);
		eventInformMap.put("eventInform", eventInform);
		
		//1-2.이벤트 detailImage 가져오기
		List<EventImageDTO> imageList = eventDAO.imageList(event_id); 
		eventInformMap.put("imageList", imageList);
		
		return eventInformMap;
	}

	//이벤트 정보 추가하기
	@Override
	public List<EventDTO> moreEventList(String category, RowDTO rowDTO) throws Exception {
		List<EventDTO> eventList = eventDAO.eventList(category,rowDTO);
		return eventList;
	}

}
