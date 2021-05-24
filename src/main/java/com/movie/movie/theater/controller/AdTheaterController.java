package com.movie.movie.theater.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TheaterDTO;



public interface AdTheaterController {

	//새로운영화관 만들기->form
	public ModelAndView  createTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//새로운 영화관 만들기
	public ModelAndView createTheater(HttpServletRequest request, HttpServletResponse response, TheaterDTO theaterDTO)
			throws Exception;
	
	//영화 삭제하기
	public ModelAndView deleteTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//영화 수정하기-폼
	public ModelAndView modifyTheaterForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//영화수정하기
	public ModelAndView modifyTheater(HttpServletRequest request, HttpServletResponse response, TheaterDTO theaterDTO) throws Exception;

	//영화관 리스트
	public ModelAndView showTheaterList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	//극장이미지 추가페이지 보여주기
	public ModelAndView theaterImage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//극장이미지 추가
	public ModelAndView addTheaterImage(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	//상영시간표 제작 페이지 보여주기 
		public ModelAndView createTimesForm(HttpServletRequest request, HttpServletResponse response) throws Exception;

		public Map<String, Object> sangygInform(HttpServletRequest request, HttpServletResponse response) throws Exception;	

		//상영시간표 리스트
		public ModelAndView timesList(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		//상영시간표 제작
		public ModelAndView createTimes(HttpServletRequest request, HttpServletResponse response, TheaterDTO theaterDTO) throws Exception;

		//상영시간 삭제
		public ModelAndView deleteTimes(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		//극장정보 추가
		public  Map<String, Object> moreTheaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	

}
