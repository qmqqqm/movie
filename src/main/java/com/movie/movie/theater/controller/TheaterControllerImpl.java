package com.movie.movie.theater.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.theater.dto.BookMarkDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;
import com.movie.movie.theater.service.TheaterService;

@Controller("theaterController")
public class TheaterControllerImpl implements TheaterController{

	@Autowired
	TheaterService theaterService;
	//�쑄�씠 - 洹뱀옣
	@Override
	@RequestMapping("/theater.do")
	public ModelAndView showTheater(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1.占식띰옙占쏙옙占�
		//2.占쏙옙占쏙옙絿占쏙옙占쏙옙占�
		List<String> location = theaterService.getLocation();
		
		List<TheaterDTO> theaters =  theaterService.showTheater();
		System.out.println(theaters);
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("MDTO");
		ModelAndView mv = new ModelAndView();
		System.out.println("준기~~로그인=="+memberDTO);
		if(memberDTO!=null) {
			int member_id = memberDTO.getMember_id();
			BookMarkDTO selectBookMark = theaterService.selectBookMark(member_id);
			mv.addObject("memberDTO", memberDTO);
			System.out.println("selectBookMark"+selectBookMark);
			mv.addObject("selectBookMark", selectBookMark);
		}
		
		//3.model
		mv.addObject("theaters", theaters);
		mv.addObject("location", location);
		
		mv.setViewName("/theater/theaters");
		
		return mv;
	}
	
	  @Override
	  @RequestMapping("/theaterInform.do")
	  public @ResponseBody Map<String, Object> theaterInform(HttpServletRequest request, HttpServletResponse response) throws Exception {

	  int theater_id = Integer.parseInt(request.getParameter("id"));
	  System.out.println("theater_id"+theater_id);

	  TotalSangygDTO total = theaterService.totalSangyg(theater_id);
	  int image_id = theaterService.selImgNo(theater_id);
	  TheaterImageDTO theaterImageDTO = theaterService.selImg(image_id);
	  
	  //3.
	  Map<String, Object> theaterinform = new HashMap<String,Object>();
	  theaterinform.put("totSangygDTO", total);
	  theaterinform.put("theaterImageDTO",theaterImageDTO);
	  return theaterinform; 
	  }

	//占쏢영시곤옙표 
	@Override
	@RequestMapping("/theaterTimes.do")
	public  @ResponseBody Map<String, Object> theaterTimes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.占식띰옙占쏙옙占� 占쌨깍옙

		int theater_id = Integer.parseInt(request.getParameter("id"));
		String day = request.getParameter("day");
		
		if(Integer.parseInt(day) < 10) {
			day = "0" + day;
		}
		System.out.println("theater_id  = "  + theater_id + "day = " + day);
		
		
		
		List<TimesDTO> times = theaterService.getTimes(theater_id, day);
		
		
	
		List<Integer> imsi = new ArrayList<Integer>();
		for(int i = 0; i < times.size(); i++) {
			imsi.add(times.get(i).getMovie_id());
		}
		
		HashSet<Integer> imsiSet = new HashSet<Integer>(imsi);
		List<Integer> movieList = new ArrayList<Integer>(imsiSet);
		System.out.println(movieList+"movieList");
		
		List<MovieDTO> movieInform = theaterService.movieInform(movieList);

	
		for(int i = 0; i < times.size(); i++) {
			imsi.add(times.get(i).getSangyg_id());
		}
		imsiSet = new HashSet<Integer>(imsi);
		List<Integer> sangygList = new ArrayList<Integer>(imsiSet);
		System.out.println(sangygList);
		
		List<SangygDTO> sangygInform = theaterService.sangygInform(sangygList,theater_id);
		
		//3.model
		Map<String, Object> theaterTimes = new HashMap<String,Object>();
		theaterTimes.put("times",times);
		theaterTimes.put("movieInform", movieInform);
		theaterTimes.put("sangygInform", sangygInform);
		
		return theaterTimes;
	}
	
		@RequestMapping("/theaterpopup.do")
		@Override
		public ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
			ModelAndView mv = new ModelAndView();
			List<String> locationList = theaterService.getLocation();
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("MDTO");
			int member_id = memberDTO.getMember_id();
			BookMarkDTO selectBookMark = theaterService.selectBookMark(member_id);
			mv.addObject("selectBookMark", selectBookMark);
			mv.addObject("memberDTO", memberDTO);
			mv.addObject("locationList", locationList);
			mv.setViewName("/theater/popup");
			return mv;
		}
		//�뙘�뾽李쎌뿉�꽌 �궗�슜�븯�뒗 �븘�옉�뒪(洹뱀옣�젙蹂� 諛쏆븘�샂)
		@RequestMapping("/theaterpopuploc.do")
		@Override
		public @ResponseBody Map<String, Object> ajxPopUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String theater_location = request.getParameter("location");
			System.out.println(theater_location);
			List<String> theList = theaterService.theNumber(theater_location);
			System.out.println(theList);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("theList",theList);
			return map;
		}

		@RequestMapping("/theaterajxPopUpreg.do")
		@Override
		public void ajxPopUpreg(HttpServletRequest request, HttpServletResponse response) throws Exception {
			HttpSession session = request.getSession();
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("MDTO");
			int member_id = memberDTO.getMember_id();
			String bookmark_fir = request.getParameter("bookmark_fir");
			String bookmark_se = request.getParameter("bookmark_se");
			String bookmark_th = request.getParameter("bookmark_th");
			String bookmark_fo = request.getParameter("bookmark_fo");
			String bookmark_fiv = request.getParameter("bookmark_fiv");
			
			
			Map map = new HashMap<String, Object>();
			map.put("member_id", member_id);
			map.put("bookmark_fir", bookmark_fir);
			map.put("bookmark_se", bookmark_se);
			map.put("bookmark_th", bookmark_th);
			map.put("bookmark_fo", bookmark_fo);
			map.put("bookmark_fiv", bookmark_fiv);
			
			System.out.println(map);
			if(theaterService.selectBookMark(member_id)!=null) {
				theaterService.ajxPopUpregUP(map);
			}else {
			theaterService.ajxPopUpreg(map);
			}
		}
		
		
	

	 
}
