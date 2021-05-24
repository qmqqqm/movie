package com.movie.movie.event.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;

@Repository("adEventDAO")
public class AdEventDAOImpl implements AdEventDAO{

	@Autowired
	SqlSession sqlSession;
	
	//카테고리 
	@Override
	public List<String> categoryList() throws DataAccessException {
		List<String> categoryList = sqlSession.selectList("adEvent.categoryList");
		return categoryList;
	}
	//이벤트 리스트 
	@Override
	public List<EventDTO> eventList(String category) throws DataAccessException {
		List<EventDTO> eventList = sqlSession.selectList("adEvent.eventList", category);
		System.out.println(eventList);
		return eventList;
	}
	//이벤트 넣기
	@Override
	public int insertEvent(Map newEventMap) throws DataAccessException {
		System.out.println("insertEvent 진입 성공");
		sqlSession.insert("adEvent.insertEvent", newEventMap);
		
		int event_id = (Integer)newEventMap.get("event_id");
		System.out.println(event_id);
		return event_id;
		
	}

	@Override
	public void insertEventImage(List eventImageList) throws DataAccessException {
		//이미지파일의 개수만큼  insert쿼리를 실행
		for(int i=0; i<eventImageList.size() ;i++) {
			EventImageDTO eventImageDTO = (EventImageDTO)eventImageList.get(i);
			sqlSession.insert("adEvent.insertEventImage", eventImageDTO);
		}
		
	}
	//진행상태가 진행완료인 이벤트들은 isshow를 n으로 변경하고 다시 그 정보를 가져오는 메서드
	@Override
	public EventDTO updateEvent(EventDTO event) throws DataAccessException {
		int event_id = event.getEvent_id();
		//update하기
		sqlSession.update("adEvent.updateEvent", event_id);
		
		//update 된 결과문을 다시 가져오기
		return sqlSession.selectOne("adEvent.selectUpdateEvent", event_id);
	}
	
	//이벤트 삭제하기
	@Override
	public void deleteEvent(int event_id) throws DataAccessException {
		//이벤트 테이블 삭제하기
		sqlSession.delete("adEvent.deleteEvent", event_id);
		
		//이벤트 이미지 테이블 삭제하기
		sqlSession.delete("adEvent.deleteEvent_Image", event_id);
	}
	
	//이벤트 수정폼을 위해 정보 가져오기 - 아래 2개
	@Override
	public EventDTO eventInform(int event_id) throws DataAccessException {
		EventDTO eventInform = sqlSession.selectOne("adEvent.eventInform", event_id);
		return eventInform;
	}
	@Override
	public List<EventImageDTO> imageList(int event_id) throws DataAccessException {
		List<EventImageDTO> imageList = (ArrayList)sqlSession.selectList("adEvent.eventImageList", event_id);
		return imageList;
	}
	
	//이벤트 내용  수정하기
	@Override
	public int modifyEvent(Map newEventMap) throws DataAccessException {
		//이벤트 내용 수정
		int result = sqlSession.update("adEvent.updateEventInfo", newEventMap);
		System.out.println("event table 내용은 수정 했음.");
		//event_image_del 을 'y'로 다 변경
		
		return result;
	}
	
	@Override
	public void insertFile(Map<String, Object> temp) throws DataAccessException {
		sqlSession.update("adEvent.insertFile", temp);
		
	}
	@Override
	public void updateFile(Map<String, Object> temp) throws DataAccessException {
		sqlSession.update("adEvent.updateFile", temp);
		
	}
	@Override
	public void deleteDel(Map newEventMap) throws DataAccessException {
		System.out.println("deleteDel 왔음");
	 sqlSession.update("adEvent.updateDel", newEventMap);
		System.out.println("event_image_del을 'y'로 다 변경");

	}
	@Override
	public void deleteEventDel(int event_id) throws DataAccessException {
		sqlSession.delete("adEvent.deleteEventDel", event_id);
		
	}
	@Override
	public List<String> selectdel(int event_id) throws DataAccessException {
		 List<String> nameList = sqlSession.selectList("adEvent.selectdel", event_id);
		return nameList;
	}

}
