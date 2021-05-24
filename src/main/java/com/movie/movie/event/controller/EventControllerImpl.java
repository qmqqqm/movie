package com.movie.movie.event.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.event.dto.EventDTO;
import com.movie.movie.event.service.EventService;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;

@Controller("eventController")
public class EventControllerImpl implements EventController{

	@Autowired
	EventService eventService;
	
	//사용자 - 이벤트 첫 view 리스트 보여주기 
	@Override
	@RequestMapping("/events.do")
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.파라미터 가져오기
		// 2. 비즈니스 수행
		//2-1. 카테고리 리스트 가져오기
		List<String> categoryList = eventService.categoryList();
		
		System.out.println(categoryList);
		
		//3.model
		ModelAndView mv = new ModelAndView();
		mv.addObject("categoryList", categoryList);

		mv.setViewName("/event/events");
		//4.view
		return mv;
	}

	//이벤트 정보 더 가져오기
	 @Override
	 @RequestMapping("/eventInform.do")
	 public  @ResponseBody Map<String, Object>  eventInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 
	  //1.파라미터받기
	  String category = request.getParameter("category");
	  
	  //2-2. 이벤트 정보 list에 담아오기 - 카테고리 별로 담아오기
	  RowDTO rowDTO = new RowDTO(1,6);
	  List<EventDTO> events = eventService.moreEventList(category,rowDTO);
 
	  
	  Map<String, Object>  eventInform = new HashMap<String, Object>();
	  eventInform.put("events", events);
	  
	  return eventInform; 
	 }
		
	//이벤트 상세보기
	@Override
	@RequestMapping("/eventDetail.do")
	public ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 1.파라미터 타입
		System.out.println("eventdetail.do 진행됨");
		int event_id = Integer.parseInt(request.getParameter("event_id"));
		System.out.println(event_id);
		
		//2.비즈니스 수행
		//2-1.event 정보 가져오기
		Map eventMap = eventService.eventInform(event_id);
		System.out.println(eventMap.toString());
		
		//3.model
		ModelAndView mv = new ModelAndView();
		mv.addObject("eventMap", eventMap);

		mv.setViewName("/event/eventDetail");
		//4.view
		return mv;
	}
	//이벤트 정보 더 가져오기
	 @Override
	 @RequestMapping("/moreEventInform.do")
	 public  @ResponseBody Map<String, Object>  moreEventInform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 
	  //1.파라미터받기
	  int startCnt = Integer.parseInt(request.getParameter("startCnt"));
	  int viewCnt = Integer.parseInt(request.getParameter("viewCnt"));
	  String category = request.getParameter("category");
	  
	  System.out.println(startCnt);
	  System.out.println(viewCnt);
	  System.out.println(category);
	  
	  RowDTO rowDTO = new RowDTO(startCnt+1,startCnt+viewCnt);

	  List<EventDTO> eventList = eventService.moreEventList(category,rowDTO);
	 
	  Map<String, Object>  eventInform = new HashMap<String, Object>();
	  eventInform.put("eventInform", eventList);
	  
	  return eventInform; 
	  }

}
