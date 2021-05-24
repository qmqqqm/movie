package com.movie.movie.event.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;
import com.movie.movie.theater.dto.RowDTO;

@Repository("eventDAO")
public class EventDAOImpl implements EventDAO{

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<String> categoryList() throws DataAccessException {
		List<String> categoryList = sqlSession.selectList("event.categoryList");
		return categoryList;
	}
	
	@Override
	public List<EventDTO> eventList(String category, RowDTO rowDTO) throws DataAccessException {
		Map temp = new HashMap();
		temp.put("category", category);
		temp.put("start", rowDTO.getStart());
		temp.put("end", rowDTO.getEnd());
		System.out.println(temp);
		List<EventDTO> eventList = sqlSession.selectList("event.eventList", temp);
		System.out.println(eventList);
		return eventList;
	}

	//이벤트 상세정보 가져오기
	@Override
	public EventDTO eventInform(int event_id) throws DataAccessException {
		EventDTO eventInform = sqlSession.selectOne("event.eventInform", event_id);
		return eventInform;
	}
	//이벤트 detailImage들 가져오기
	@Override
	public List<EventImageDTO> imageList(int event_id) throws DataAccessException {
		List<EventImageDTO> imageList = (ArrayList)sqlSession.selectList("event.eventImageList", event_id);
		return imageList;
	}

	
}
