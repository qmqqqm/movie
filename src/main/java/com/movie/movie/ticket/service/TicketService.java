package com.movie.movie.ticket.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.ticket.dao.TicketDAO;
import com.movie.movie.ticket.dto.TicketDTO;
@Service
public class TicketService {
	@Autowired
	TicketDAO ticketDAO;
	public Map ticketForm() {
		Map  movieList = new HashMap();		
		movieList.put("movies", ticketDAO.ticketForm());
		movieList.put("location",ticketDAO.location());
		movieList.put("theater",ticketDAO.theater());
		movieList.put("nal",ticketDAO.nal());
		return movieList;
	}
	public List theaterchoice(String theater_location)
			throws Exception {
		List<TicketDTO> theaterchoice = ticketDAO.theaterchoice(theater_location);
		return theaterchoice;
	}
	public Map<String, Object> userSelect(TicketDTO ticketDTO) {
		List<TicketDTO> theaterchoice = ticketDAO.userSelect(ticketDTO);
		Map choice=new HashMap();
		choice.put("theaterchoice", theaterchoice);
		return choice;
	}
	public List<TicketDTO> selectTime(int movie_id, int theater_id, String times_time) throws Exception {
		List<TicketDTO> time  = ticketDAO.selectTime(movie_id, theater_id, times_time);
		return time;
	}

}
