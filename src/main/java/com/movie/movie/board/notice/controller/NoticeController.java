package com.movie.movie.board.notice.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.board.notice.dto.NoticeDTO;

public interface NoticeController {

	/* 공지사항 게시판 */
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/* 공지사항 글 작성 */
	public String getNoticeWriter(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/* 공지사항 글 작성 처리 */
	public ModelAndView getNoticeWriterSuc(@ModelAttribute("info")  NoticeDTO noticeDTO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/* 공지사항 상세 보기 */
	public ModelAndView getNoticeDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, @RequestParam Map<String, Object> info) throws Exception;
}
