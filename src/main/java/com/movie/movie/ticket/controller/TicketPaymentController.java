package com.movie.movie.ticket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.ticket.dto.TicketDTO;
import com.movie.movie.ticket.dto.UserDTO;
import com.movie.movie.ticket.service.TicketPaymentService;

@Controller
public class TicketPaymentController {
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private TicketPaymentService ticketPaymentService; 
	
	
	@RequestMapping("ticketpayment.do")
	public ModelAndView ticketpayment(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception{
		String movie_id=request.getParameter("movie_id");
		String movie_title=request.getParameter("movie_title");
		String theater_id=request.getParameter("theater_id");	
		String theater_name=request.getParameter("theater_name");
		String sangyg_id =request.getParameter("sangyg_id");	
		String sangyg_name=	request.getParameter("sangyg_name");
		String ticket_date=	request.getParameter("ticket_date");
		String times_time=	request.getParameter("times_time");
		String price=request.getParameter("price");
		String seat=request.getParameter("seat");
		String ticket_quantity=request.getParameter("ticket_quantity");
		mv.addObject("price",price);
		mv.addObject("seat",seat);	
		mv.addObject("movie_id",movie_id);
		mv.addObject("movie_title",movie_title);		
		mv.addObject("theater_id",theater_id);
		mv.addObject("theater_name",theater_name);		
		mv.addObject("sangyg_id",sangyg_id);
		mv.addObject("sangyg_name",sangyg_name);		
		mv.addObject("ticket_date", ticket_date);
		mv.addObject("times_time", times_time);
		mv.addObject("ticket_quantity", ticket_quantity);
		mv.setViewName("ticketpayment");
		return mv;
	}
	@RequestMapping("ticketComplete.do")
	public ModelAndView ticketComplete(HttpServletRequest request, 
			HttpServletResponse response,ModelAndView mv) throws Exception{
		HttpSession session=request.getSession();
		UserDTO member=(UserDTO) session.getAttribute("user");
		String member_userid=member.getMember_userid();	
		int member_id=member.getMember_id();
		int movie_id=Integer.parseInt(request.getParameter("movie_id"));		
		int theater_id=Integer.parseInt(request.getParameter("theater_id"));			
		int sangyg_id =Integer.parseInt(request.getParameter("sangyg_id"));		
		String ticket_date=	request.getParameter("ticket_date");
		String ticket_time=	request.getParameter("times_time");
		int ticket_quantity=Integer.parseInt(request.getParameter("ticket_quantity"));
		int ticket_price=Integer.parseInt(request.getParameter("price"));
		String ticket_seats=request.getParameter("seat");
		ticketDTO.setTicket_price(ticket_price);
		ticketDTO.setTicket_seats(ticket_seats);
		ticketDTO.setMovie_id(movie_id);		
		ticketDTO.setTheater_id(theater_id);		
		ticketDTO.setSangyg_id(sangyg_id);
		ticketDTO.setTicket_quantity(ticket_quantity);
		ticketDTO.setTicket_date(ticket_date);
		ticketDTO.setTicket_time(ticket_time);
		ticketDTO.setMember_userid(member_userid);
		ticketDTO.setMember_id(member_id);
		ticketPaymentService.ticketComplete(ticketDTO);
		mv.setViewName("main");
		return mv;
	}
}
