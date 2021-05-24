package com.movie.movie.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.ticket.dao.TicketPaymentDAO;
import com.movie.movie.ticket.dto.TicketDTO;
@Service
public class TicketPaymentService {
	@Autowired
	private TicketPaymentDAO ticketPaymentDAO;
	public void ticketComplete(TicketDTO ticketDTO) {
		ticketPaymentDAO.ticketComplete(ticketDTO);
		
	}

}
