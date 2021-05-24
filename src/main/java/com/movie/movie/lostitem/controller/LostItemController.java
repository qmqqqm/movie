package com.movie.movie.lostitem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.lostitem.dto.LostItemDTO;

public interface LostItemController {

	//분실물 폼보여주기
	public ModelAndView lostItem(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물 게시판 입력처리
	public ModelAndView lostItemPro(@ModelAttribute LostItemDTO lostItemDTO ,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물 게시판 리스트 -- 운영자
	public ModelAndView lostList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물게시판 상세보기 -- 운영자
	public ModelAndView lostListDetail(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물게시판 답글작성처리 -- 운영자
	public ModelAndView lostListwrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물게시판 답글보기
	public ModelAndView lostListAnser(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//분실물게시판 처리완료
	public ModelAndView lostAnserFin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
