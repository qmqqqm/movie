package com.movie.movie.ticket.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.ticket.dto.TicketDTO;

@Repository
public class TicketPeopleDAO {
	@Autowired
	private SqlSession sqlSession;
	public int ticketpeople(TicketDTO ticketDTO) {
		int stats=sqlSession.selectOne("ticket.ticketpeople",ticketDTO);
		return stats;
	}
	public List<String> selectseat(TicketDTO ticketDTO) {
		List<String> selectseat=sqlSession.selectList("ticket.selectseat",ticketDTO);
		return selectseat;
	}
	
}
