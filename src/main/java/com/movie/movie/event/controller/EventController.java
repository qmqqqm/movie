package com.movie.movie.event.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.event.dto.EventDTO;

public interface EventController {
	//이벤트 리스트 가져오기
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//이엔트 삭제하기
	public ModelAndView eventDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//이벤트 정보 더 가져오기
	public  Map<String, Object>  moreEventInform(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	Map<String, Object> eventInform(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
