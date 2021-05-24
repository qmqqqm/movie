package com.movie.movie.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdEventController {
	//이벤트 목록 보여주기
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//이벤트 작성 폼 보여주기
	public String createEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//이벤트 작성하기
	public ResponseEntity createEvent(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;

	//이벤트 삭제하기
	public ModelAndView deleteEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//이벤트 수정 폼 보여주기
	public ModelAndView modifyEventForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//이벤트 정보 수정하기
	public  ModelAndView modifyEventInfo(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	
}
