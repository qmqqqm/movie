package com.movie.movie.ticket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.ticket.dto.TicketDTO;
@Repository
public class TicketPaymentDAO {
	@Autowired
	private SqlSession sqlSession;
	public void ticketComplete(TicketDTO ticketDTO) {
		sqlSession.insert("ticket.ticketComplete",ticketDTO);
		
	}

}
