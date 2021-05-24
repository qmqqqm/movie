package com.movie.movie.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.ticket.dto.TicketDTO;
@Repository
public class TicketDAO {
	@Autowired
	SqlSession sqlSession;
	public ArrayList ticketForm() {
		ArrayList movieList=(ArrayList) sqlSession.selectList("ticket.ticketForm");
		System.out.println(movieList);
		return movieList;
	}
	public Object location() {
		ArrayList location=(ArrayList)sqlSession.selectList("ticket.location");
		return location;
	}
	public Object theater() {
		ArrayList theater=(ArrayList)sqlSession.selectList("ticket.theater");
		return theater;
	}
	public Object nal() {
		ArrayList nal=(ArrayList)sqlSession.selectList("ticket.nal");
		return nal;
	}
	public List theaterchoice(String theater_location) throws Exception {
		List<TicketDTO> theaterchoice = sqlSession.selectList("ticket.theaterchoice", theater_location);
		return theaterchoice;
	}
	public List<TicketDTO> userSelect(TicketDTO ticketDTO) {
		List<TicketDTO> theaterchoice = sqlSession.selectList("ticket.userSelect",ticketDTO);
		System.out.println("userSelectdao"+theaterchoice);
		System.out.println(ticketDTO);
		return theaterchoice;
	}
	public List<TicketDTO> selectTime(int movie_id, int theater_id, String times_time) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movie_id", movie_id);
		map.put("theater_id", theater_id);
		map.put("times_time", times_time);
		System.out.println("map ==" +map);
		List<TicketDTO> time = sqlSession.selectList("ticket.selectTime", map);
		System.out.println("selectTime = "+time);
		return time;
	}

}
