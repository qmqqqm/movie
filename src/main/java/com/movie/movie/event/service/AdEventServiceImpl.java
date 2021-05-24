package com.movie.movie.event.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.event.dao.AdEventDAO;
import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.dto.EventImageDTO;

@Service("adEventService")
public class AdEventServiceImpl  implements AdEventService {

	@Autowired
	AdEventDAO adEventDAO;
	//이벤트 카테고리 리스트 가져오기
	@Override
	public List<String> categoryList() throws Exception {
		List<String> categoryList = adEventDAO.categoryList();
		return categoryList;
	}

	//이벤트 리스트 
	@Override
	public Map<String, Object> eventList(List<String> categoryList) throws Exception {
		
		//카테고리 별로 정보 저장하기
		Map<String, Object> eventMap = new HashMap<String, Object>();
		
		for(String category : categoryList) {
			List<EventDTO> eventList = adEventDAO.eventList(category);
			//진행상태를 담은 list<String>만들기
			getStatus(eventList);
			
			//진행상태를 들고 진행상태가 진행완료이면 update문 진행
			for(EventDTO event : eventList) {
				if(event.getEvent_status().equals("진행 완료")) {
					//update를 하고 update된 데이터를 dto에 담아서 다시 저장
					event = adEventDAO.updateEvent(event);
					System.out.println("진행됨" + event);
				}
					
			}
			eventMap.put(category, eventList);
			
		}
		
		
		
		return eventMap;
	}
	private void getStatus(List<EventDTO> eventList) throws ParseException {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> statusList = new ArrayList<String>();
		String status = "";
		Date today = transFormat.parse(transFormat.format(new Date()));
		for(int i = 0; i < eventList.size(); i++) {
			Date start = transFormat.parse(eventList.get(i).getEvent_start());
			Date end = transFormat.parse(eventList.get(i).getEvent_end());
			
			/*
			 * if(today.before(start)){ //today 가 start 보다 전이라면 ture를 반환 -> if 문 실행 status =
			 * "진행 전"; } else if(today.after(end)) { //today 가 end 이후라면 true 를 반환 status =
			 * "진행 후"; } else { status="진행 중"; }
			 */
			
			if(today.compareTo(start) < 0) { //compareTo 함수 : 왼쪽이 오른쪽보다 크면 1, 같으면 0, 작으면 -1 을 반환
				status = "진행 전";
			}else if(today.compareTo(start) >= 0 && today.compareTo(end) <= 0) {
				status ="진행 중";
			}else if(today.compareTo(end) > 0) {
				status="진행 완료";
			}
			eventList.get(i).setEvent_status(status);
			
		
	}
		
	
	}

	//이벤트 등록하기
	@Override
	public int insertEvent(Map newEventMap) throws Exception {
		//1.이벤트 등록
		int event_id = adEventDAO.insertEvent(newEventMap);
		
		System.out.println("이벤트 등록 성공");
		
		//2.이벤트 이미지 등록
		ArrayList<EventImageDTO> eventImageList = (ArrayList)newEventMap.get("eventImageList");
		//이미지 별로 비어있는 event_id 컬럼 값에 넣어준다.
		for(EventImageDTO eventImageDTO : eventImageList) {
			eventImageDTO.setEvent_id(event_id);
		}
		
		//상품등록하는  dao의 메서드를 호출
		adEventDAO.insertEventImage(eventImageList);
		
		return event_id;
	}
	
	//이벤트 삭제하기
	@Override
	public void deleteEvent(int event_id) throws Exception {
		adEventDAO.deleteEvent(event_id);
		
	}

	//이벤트 수정폼을 위해 정보 가져오기
	@Override
	public Map eventInform(int event_id) throws Exception {
		Map eventInformMap = new HashMap();
		
		//1-1 이벤트 정보가져오기
		EventDTO eventInform = adEventDAO.eventInform(event_id);
		eventInformMap.put("eventInform", eventInform);
		
		//1-2.이벤트 detailImage 가져오기
		List<EventImageDTO> imageList = adEventDAO.imageList(event_id); 
		System.out.println(imageList);
		eventInformMap.put("imageList", imageList);
		
		return eventInformMap;
	}
	//이벤트 수정하기
	@Override
	public void modifyEvent(Map newEventMap) throws Exception {
		//event table 과  event_image_del 변경
		adEventDAO.modifyEvent(newEventMap);
		adEventDAO.deleteDel(newEventMap);
		
	}

	@Override
	public void insertFile(Map<String, Object> temp) throws Exception {
		adEventDAO.insertFile(temp);
		
	}

	@Override
	public void updateFile(Map<String, Object> temp) throws Exception {
		adEventDAO.updateFile(temp);
		
	}

	@Override
	public void deleteEventDel(int event_id) throws Exception {
		adEventDAO. deleteEventDel(event_id);
		
	}

	@Override
	public List<String> selectdel(int event_id) throws Exception {
		List<String> nameList = adEventDAO.selectdel(event_id);
		return nameList;
	}

}
