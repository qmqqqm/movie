package com.movie.movie.ticket.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.ticket.dao.TicketBoardDAO;
import com.movie.movie.ticket.dto.TicketBoardDTO;
@Service
public class TicketBoardService {
	@Autowired
	private TicketBoardDAO ticketBoardDAO;
	public List<TicketBoardDTO> ticketBoardList() {
		List<TicketBoardDTO> ticketList=ticketBoardDAO.ticketBoardList();
		return ticketList;
		
	}
	public TicketBoardDTO ticketBoardDetail(String ticketBoard_id) {
		TicketBoardDTO ticketDetail=ticketBoardDAO.ticketBoardDetail(ticketBoard_id);
		return ticketDetail;
	}
	public void ticketBoardWrite(TicketBoardDTO ticketBoardDTO) {
		ticketBoardDAO.ticketBoardWrite(ticketBoardDTO);
		
	}
	public void ticketBoardMod(TicketBoardDTO ticketBoardDTO) {
		ticketBoardDAO.ticketBoardMod(ticketBoardDTO);
		
	}
	public void ticketBoardDelete(int ticketBoard_id) {
		ticketBoardDAO.ticketBoardDelete(ticketBoard_id);
		
	}
	public List<TicketBoardDTO> ticketboardfindtit(String searchtext) {
		List<TicketBoardDTO> ticketList=ticketBoardDAO.ticketboardfindtit(searchtext);
		return ticketList;
		
	}
	public List<TicketBoardDTO> ticketboardfindcon(String searchtext) {
		List<TicketBoardDTO> ticketList=ticketBoardDAO.ticketboardfindcon(searchtext);
		return ticketList;
		
	}

}
