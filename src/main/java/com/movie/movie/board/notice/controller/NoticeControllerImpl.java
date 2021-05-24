package com.movie.movie.board.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.board.notice.dto.NoticeDTO;
import com.movie.movie.board.notice.service.NoticeService;

@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeDTO noticeDTO;
	
	
	/* 공지 글 목록 */
	@Override
	@RequestMapping("noticeBoard.do")
	public ModelAndView getNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getNoticeList 진입 성공--------");
		List<NoticeDTO> noticeList = noticeService.getNoticeList();
		ModelAndView mv = new ModelAndView("noticeBoard");
		mv.addObject("noticeList", noticeList);
		return mv;
	}
	
	/* 공지 글 작성 */
	@Override
	@RequestMapping("noticeWriter.do")
	public String getNoticeWriter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "noticeWriter";
	}

	/* 공지사항 글 작성 처리 */
	@Override
	@RequestMapping("noticeWriterSuc.do")
	public ModelAndView getNoticeWriterSuc(@ModelAttribute("info")  NoticeDTO noticeDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("getNoticeWriterSuc");
		int result = noticeService.noticeWriterSuc(noticeDTO);
		System.out.println(result);
		ModelAndView mv = new ModelAndView("redirect:/noticeBoard.do");
		
		return mv;
	}

	/* 공지사항 글 상세보기 */ 
	@Override
	@RequestMapping("noticeDetail.do")
	public ModelAndView getNoticeDetail(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
			@RequestParam Map<String, Object> info) throws Exception {
		System.out.println("1글 번호는 "+info.get("notice_id"));
		int notice_id = Integer.parseInt((String)info.get("notice_id"));
		info.put("notice_id", notice_id);
		
		NoticeDTO noticeDTO = noticeService.getNoticeDetail(info);
		mv.addObject("noticeDTO", noticeDTO);
		mv.setViewName("noticeDetail");
		return mv;
	}

}
