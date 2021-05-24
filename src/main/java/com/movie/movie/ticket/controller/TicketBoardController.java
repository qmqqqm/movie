package com.movie.movie.ticket.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.ticket.dto.TicketBoardDTO;
import com.movie.movie.ticket.dto.UserDTO;
import com.movie.movie.ticket.service.TicketBoardService;


@Controller("ticketBoardController")
public class TicketBoardController {
	@Autowired
	private TicketBoardService ticketBoardService;
	@Autowired
	private TicketBoardDTO ticketBoardDTO;
	
	@RequestMapping("ticketBoardList.do")
	public ModelAndView ticketBoardList(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		List<TicketBoardDTO> ticketList=ticketBoardService.ticketBoardList();
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketList",ticketList);
		mv.setViewName("ticketBoardList");
		System.out.println(ticketList);
		return mv;
	}
	@RequestMapping("ticketBoardDetail.do")
	public ModelAndView ticketBoardDetail (@RequestParam("ticketBoard_id") String ticketBoard_id,HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		TicketBoardDTO ticketDetail=ticketBoardService.ticketBoardDetail(ticketBoard_id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketDetail",ticketDetail);
		mv.setViewName("ticketBoardDetail");
		return mv;
	}
	@RequestMapping("ticketBoardWriteForm.do")
	public String ticketBoardWriteForm() {
		return "ticketBoardWriteForm";
	}
	@RequestMapping("ticketBoardWrite.do")
	public ModelAndView ticketBoardWrite(HttpServletRequest request, 
	HttpServletResponse response) throws Exception {
		String ticketBoard_title=request.getParameter("title");
		String member_Id=request.getParameter("userid");
		String ticketBoard_group=request.getParameter("kind");
		String ticketBoard_content=request.getParameter("content");
		ticketBoardDTO.setMember_Id(member_Id);
		ticketBoardDTO.setTicketBoard_title(ticketBoard_title);
		ticketBoardDTO.setTicketBoard_group(ticketBoard_group);
		ticketBoardDTO.setTicketBoard_content(ticketBoard_content);
		ticketBoardService.ticketBoardWrite(ticketBoardDTO);
		ModelAndView mv=new ModelAndView("redirect:ticketBoardList.do");
		return mv;
	}
	
	@RequestMapping("ticketBoardModForm.do")
	public ModelAndView ticketBoardModForm(@RequestParam("ticketBoard_id") String ticketBoard_id,HttpServletRequest request, 
	HttpServletResponse response) throws Exception {
		TicketBoardDTO ticketDetail=ticketBoardService.ticketBoardDetail(ticketBoard_id);
		ModelAndView mv=new ModelAndView();
		mv.addObject("ticketDetail",ticketDetail);
		mv.setViewName("ticketBoardModForm");
		return mv;
	}
	@RequestMapping("ticketBoardMod.do")
	public ModelAndView ticketBoardMod(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
				String ticketBoard_title=request.getParameter("ticketBoard_title");				
				String ticketBoard_content=request.getParameter("ticketBoard_content");
				Double ticketBoard_id=Double.parseDouble(request.getParameter("ticketBoard_id"));
				ticketBoardDTO.setTicketBoard_title(ticketBoard_title);	
				ticketBoardDTO.setTicketBoard_id(ticketBoard_id);
				ticketBoardDTO.setTicketBoard_content(ticketBoard_content);
				System.out.println(ticketBoardDTO);
				ticketBoardService.ticketBoardMod(ticketBoardDTO);
				ModelAndView mv=new ModelAndView("redirect:ticketBoardList.do");
				return mv;
			}
	@RequestMapping("ticketBoardDelete.do")	
	public ModelAndView ticketBoardDelete(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {				
				int ticketBoard_id=Integer.parseInt(request.getParameter("ticketBoard_id"));			
				
				ticketBoardService.ticketBoardDelete(ticketBoard_id);
				ModelAndView mv=new ModelAndView("redirect:ticketBoardList.do");
				return mv;
	}
	@RequestMapping("ticketboardfind.do")
	public ModelAndView ticketboardfind(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		String searchfield=request.getParameter("selsearchfield");
		String searchtext=request.getParameter("searchtext");
		if(searchfield.equals("0")) {
			List<TicketBoardDTO> ticketList=ticketBoardService.ticketboardfindtit(searchtext);
			ModelAndView mv=new ModelAndView();
			mv.addObject("ticketList",ticketList);
			mv.setViewName("ticketBoardList");
			
			return mv;
		}else {
			List<TicketBoardDTO> ticketList=ticketBoardService.ticketboardfindcon(searchtext);
			ModelAndView mv=new ModelAndView();
			mv.addObject("ticketList",ticketList);
			mv.setViewName("ticketBoardList");
			
			return mv;
			}	
		
		
	}
	
	
}
