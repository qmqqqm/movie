package com.movie.movie.lostitem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.lostitem.dto.LostItemDTO;
import com.movie.movie.lostitem.dto.LostItemListDTO;
import com.movie.movie.lostitem.service.LostItemService;
import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.service.TheaterService;

@Controller("lostItemController")
public class LostItemControllerImpl implements LostItemController {
	
	@Autowired
	TheaterService theaterService;
	
	@Autowired
	LostItemService lostItemService;
	
	@RequestMapping("/lostItem.do")
	@Override
	public ModelAndView lostItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<String> location = theaterService.getLocation();
		List<TheaterDTO> theaters =  theaterService.showTheater();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("MDTO");
		if(memberDTO != null) {
			int member_id = memberDTO.getMember_id();
			List<LostItemDTO> LostItemDTOList = lostItemService.isAnser(member_id);
			mv.addObject("LostItemDTOList", LostItemDTOList);
		}
		
		
		mv.addObject("memberDTO",memberDTO);
		mv.addObject("location", location);
		mv.addObject("theaters", theaters);
		mv.setViewName("/lostItem.do");
		return mv;
	}

	@RequestMapping("/lostItemPro.do")
	@Override
	public ModelAndView lostItemPro(@ModelAttribute LostItemDTO lostItemDTO ,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("MDTO");
		lostItemDTO.setMember_id(memberDTO.getMember_id());
		lostItemDTO.setMember_email(memberDTO.getMember_email());
		lostItemService.lostItemPro(lostItemDTO);
		ModelAndView mv = new ModelAndView("redirect:/lostItem.do");
		return mv;
	}

	@RequestMapping("/lostItemList.do")
	@Override
	public ModelAndView lostList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageNoVal = request.getParameter("pageNo");
		
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		LostItemListDTO lostItemListDTO = lostItemService.lostList(pageNo);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("lostItemListDTO", lostItemListDTO);
		mv.setViewName("/lostList.do");
		return mv;
	}

	@RequestMapping("/lostListDetail.do")
	@Override
	public ModelAndView lostListDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lost_id = Integer.parseInt(request.getParameter("no"));
		String pageNo = request.getParameter("pageNo");
		LostItemDTO lostItemDTO = lostItemService.lostListDetail(lost_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("lostItemDTO", lostItemDTO);
		mv.addObject("pageNo", pageNo);
		mv.setViewName("/lostListDetail.do");
		return mv;
	}

	@RequestMapping(value = "/lostListDetailPro.do",method = RequestMethod.POST)
	@Override
	public ModelAndView lostListwrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lost_id = Integer.parseInt(request.getParameter("lost_id"));
		int pageNo = Integer.parseInt(request.getParameter("pageNo"));
		String lost_anser = request.getParameter("lost_anser");
		Map map = new HashMap<String, Object>();
		map.put("lost_id",lost_id);
		map.put("lost_anser",lost_anser);
		lostItemService.lostListwrite(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/lostItemList.do?pageNo="+pageNo);
		return mv;
	}

	@RequestMapping("/lostListAnser.do")
	@Override
	public ModelAndView lostListAnser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lost_id = Integer.parseInt(request.getParameter("lost_id"));
		LostItemDTO lostItemDTO = lostItemService.lostListDetail(lost_id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("lostItemDTO", lostItemDTO);
		
		mv.setViewName("/anserchk.do");
		
		return mv;
	}

	@RequestMapping(value = "/lostAnserFin.do", method = RequestMethod.POST)
	@Override
	public ModelAndView lostAnserFin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int lost_id = Integer.parseInt(request.getParameter("lost_id"));
		lostItemService.lostAnserFin(lost_id);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/lostItem.do");
		return mv;
	}

}
