package com.movie.movie.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.ticket.dao.AdminTicketDAO;
import com.movie.movie.ticket.dto.TicketBoardDTO;
import com.movie.movie.ticket.dto.TicketDTO;
@Service
public class AdminTicketService {
	@Autowired
	private AdminTicketDAO adminTicketDAO;

	public List<TicketDTO> adminTicketForm() {
		List<TicketDTO>	reserve=adminTicketDAO.adminTicketForm();
		return reserve;
		
	}

	public void adminTicketReplWrite(TicketBoardDTO ticketBoardDTO) {
		adminTicketDAO.adminTicketReplWrite(ticketBoardDTO);
		
	}

	public void ticketcancle(String ticket_id) {
		adminTicketDAO.ticketcancle(ticket_id);
		
	}

	public String adminpayForm() throws Exception {
		String total=	adminTicketDAO.adminpayForm();
		return total;
	}

	public List<TicketDTO> adminpayFormlist() throws Exception {
		List<TicketDTO>	paylist=adminTicketDAO.adminpayFormlist();
		return paylist;
	}

	public String admindatepay(TicketDTO ticketDTO) {
		String total=	adminTicketDAO.admindatepay(ticketDTO);
		return total;
	}

	public List<TicketDTO> admindatepaylist(TicketDTO ticketDTO) {
		List<TicketDTO>	paylist=adminTicketDAO.admindatepaylist(ticketDTO);
		return paylist;
	}
}


