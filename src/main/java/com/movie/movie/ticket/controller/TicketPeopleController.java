package com.movie.movie.ticket.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.ticket.dto.TicketDTO;
import com.movie.movie.ticket.service.TicketPeopleService;

@Controller
public class TicketPeopleController {
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private TicketPeopleService ticketPeopleService;
	@RequestMapping("ticketPeople.do")
	public ModelAndView ticketpeople(HttpServletRequest request, @ModelAttribute("ticketDTO") TicketDTO ticketDTO, 
			HttpServletResponse response,ModelAndView mv) throws Exception {
//	String movie_id=request.getParameter("movie_id");
//	String movie_title=request.getParameter("movie_title");
//	System.out.println(movie_title);
//	String theater=request.getParameter("theater_id");	
//	String theater_name=request.getParameter("theater_name");
//	String sangyg =request.getParameter("sangyg_id");	
//	String sangyg_name=	request.getParameter("sangyg_name");
//	String ticket_date=	request.getParameter("ticket_date");
//	String ticket_time=	request.getParameter("times_time");
//	int sangyg_id=Integer.parseInt(sangyg);	
//	int theater_id=Integer.parseInt(theater);
//	ticketDTO.setSangyg_id(sangyg_id);
//	ticketDTO.setTheater_id(theater_id);
//	ticketDTO.setTicket_date(ticket_date);
//	ticketDTO.setTicket_time(ticket_time);
		int stats=ticketPeopleService.ticketpeople(ticketDTO);
//		List<String> selectseat=ticketPeopleService.selectseat(ticketDTO);
//		System.out.println("##########"+selectseat);
		mv.addObject("ticketDTO",ticketDTO);
//		mv.addObject("movie_id",movie_id);
//		mv.addObject("movie_title",movie_title);
//		mv.addObject("selectseat",selectseat);
//		mv.addObject("theater_id",theater_id);
//		mv.addObject("theater_name",theater_name);
//		
//		mv.addObject("sangyg_id",sangyg_id);
//		mv.addObject("sangyg_name",sangyg_name);
//		
//		mv.addObject("ticket_date", ticket_date);
//		mv.addObject("times_time", ticket_time);
		mv.addObject("stats",stats);
		mv.setViewName("ticketPeople");
		return mv;
		
	}
}
