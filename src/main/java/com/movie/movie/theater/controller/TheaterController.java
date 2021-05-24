package com.movie.movie.theater.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterController {
	//윤이 - 극장 컨트롤러
	//��ȭ��
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//��ȭ ������
	public  Map<String, Object> theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//��ȭ �󿵽ð�ǥ 
	public  Map<String, Object> theaterTimes(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//준기- 극장(즐겨찾기 팝업)
	//팝업창여는 컨트롤러
	public  ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//팝업창에서 사용하는 아작스(극장정보 받아옴)
	public Map<String, Object> ajxPopUp(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//팝업창에서 즐겨찾기정보를 넘겨서 db에 저장할때 사용하는 아작스
	public void ajxPopUpreg(HttpServletRequest request, HttpServletResponse response) throws Exception;

	
	
}
