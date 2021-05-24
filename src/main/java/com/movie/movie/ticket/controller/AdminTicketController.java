package com.movie.movie.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.ticket.dto.TicketBoardDTO;
import com.movie.movie.ticket.dto.TicketDTO;
import com.movie.movie.ticket.service.AdminTicketService;
@Controller
public class AdminTicketController {
	@Autowired
	private TicketBoardDTO ticketBoardDTO;
	@Autowired
	private TicketDTO ticketDTO;
	@Autowired
	private AdminTicketService adminTicketService;
	@RequestMapping("adminTicketForm.do")	
	public ModelAndView adminTicketForm(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println();
		List<TicketDTO>	reserve=adminTicketService.adminTicketForm();
		ModelAndView mv=new ModelAndView();
		mv.addObject("reserve",reserve);
		mv.setViewName("adminTicketForm");
			return mv;
		}
	@RequestMapping("adminTicketReplForm.do")
	public ModelAndView adminTicketReplForm(HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		String ticketBoard_id=request.getParameter("ticketBoard_id");
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketBoard_id",ticketBoard_id);
		mv.setViewName("adminTicketReplForm");
		return mv;
	}
	@RequestMapping("adminTicketReplWrite.do")
	public ModelAndView ticketBoardWrite(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
				Double ticketBo_id=Double.parseDouble(request.getParameter("ticketBoard_id"));
				System.out.println(ticketBo_id);
				String ticketBoard_title=request.getParameter("title");
				String member_Id=request.getParameter("userid");
				String ticketBoard_group=request.getParameter("kind");
				String ticketBoard_content=request.getParameter("content");
				Double ticketBoard_id=ticketBo_id-0.1;
				ticketBoardDTO.setTicketBoard_id(ticketBoard_id);
				ticketBoardDTO.setMember_Id(member_Id);
				ticketBoardDTO.setTicketBoard_title(ticketBoard_title);
				ticketBoardDTO.setTicketBoard_group(ticketBoard_group);
				ticketBoardDTO.setTicketBoard_content(ticketBoard_content);
				adminTicketService.adminTicketReplWrite(ticketBoardDTO);
				ModelAndView mv=new ModelAndView("redirect:./ticketBoardList.do");
				return mv;
			}
	@RequestMapping("ticketcancle.do")
	public ModelAndView ticketcancle(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String ticket_id=request.getParameter("ticket_id");
		adminTicketService.ticketcancle(ticket_id);
		ModelAndView mv=new ModelAndView("redirect:adminTicketForm.do");
		
			return mv;
	}
	@RequestMapping("adminpayForm.do")
	public ModelAndView adminpayForm(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String total=adminTicketService.adminpayForm();
		List<TicketDTO>	paylist=adminTicketService.adminpayFormlist();
		ModelAndView mv=new ModelAndView();	
		mv.addObject("total",total);
		mv.addObject("paylist",paylist);
		mv.setViewName("adminpayForm");
			return mv;
	}
	@RequestMapping("admindatepay.do")
	public ModelAndView admindatepay(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String startDate=request.getParameter("startDate");
		String endDate=request.getParameter("endDate");
		ticketDTO.setStartDate(startDate);
		ticketDTO.setEndDate(endDate);
		
		String datetotal=adminTicketService.admindatepay(ticketDTO);
		System.out.println("datetotal"+datetotal);
		List<TicketDTO>	paylist=adminTicketService.admindatepaylist(ticketDTO);
		ModelAndView mv=new ModelAndView();	
		mv.addObject("datetotal",datetotal);
		mv.addObject("paylist",paylist);
		mv.setViewName("adminpayForm");
			return mv;
	}

}
