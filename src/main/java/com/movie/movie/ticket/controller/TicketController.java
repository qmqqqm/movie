package com.movie.movie.ticket.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.movie.ticket.dto.TicketDTO;
import com.movie.movie.ticket.dto.UserDTO;
import com.movie.movie.ticket.service.TicketService;


@Controller
public class TicketController {
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private TicketService ticketService;
	@RequestMapping("ticketForm.do")
	public ModelAndView ticketForm(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception {
			Map  movieList=ticketService.ticketForm();
			mv.addObject("movieList",movieList);
			mv.setViewName("ticketForm");
			
		return mv;
	}
	/* 극장선택 아작스 */
	@RequestMapping("theaterchoice.do")	
	public @ResponseBody Map<String, Object> theaterchoice(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String theater_location = request.getParameter("name");
		
		List<TicketDTO> theaterchoice = ticketService.theaterchoice(theater_location);
		
		Map<String, Object> choice = new HashMap<String, Object>();
		choice.put("theaterchoice", theaterchoice);
		System.out.println("theaterchoice theaterchoice() = "+theaterchoice);
		return choice;
	}

	/* 사용자 선택한값 처리 아작스 */
	@RequestMapping("userSelect.do")
	public @ResponseBody Map<String, Object> userSelect(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String movieid =request.getParameter("selectmovieid");
		if(movieid!=null){
			int movie_id=Integer.parseInt(movieid);
			ticketDTO.setMovie_id(movie_id);
			}		
		String theaterid = request.getParameter("selecttheaterid");
		if(theaterid!=null){
			int theater_id=Integer.parseInt(theaterid);			
			ticketDTO.setTheater_id(theater_id);
			}	
		String times_time = request.getParameter("selectdayname");	
		System.out.println("times_time = "+times_time);
		
		
		ticketDTO.setTimes_time(times_time);
		
		System.out.println("theater = "+ticketDTO);
		Map<String, Object> choice = ticketService.userSelect(ticketDTO);
		return choice;
	}

	@RequestMapping("selectTime.do")
	public @ResponseBody Map<String, Object> selectTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int movie_id = Integer.parseInt(request.getParameter("movie_id"));
		int theater_id = Integer.parseInt(request.getParameter("theater_id"));
		String times_time = request.getParameter("times_time");
		List<TicketDTO> time= ticketService.selectTime(movie_id, theater_id, times_time);
		Map<String, Object> choice = new HashMap<String, Object>();
		choice.put("time", time);
		System.out.println("selectTime time() = "+time);
		return choice;
	}
	
	@RequestMapping(value="/goData.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String goData(HttpServletRequest request, HttpServletResponse response, @ModelAttribute("ticketDTO") TicketDTO ticketDTO, 
			 ModelAndView mv,RedirectAttributes redirect) throws Exception {
		redirect.addFlashAttribute("ticketDTO", ticketDTO);
		//mv.setViewName();
		
		return "redirect:ticketPeople.do";
	}
	
}
