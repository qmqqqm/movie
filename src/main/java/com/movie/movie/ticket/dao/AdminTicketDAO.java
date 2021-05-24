package com.movie.movie.ticket.dao;

import java.util.List;

import javax.el.ELException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.movie.movie.ticket.dto.TicketBoardDTO;
import com.movie.movie.ticket.dto.TicketDTO;
@Repository
public class AdminTicketDAO {
	@Autowired
	private SqlSession sqlSession;
	public List<TicketDTO> adminTicketForm() {
	List<TicketDTO>	reserve=sqlSession.selectList("adminTicket.reserve");
	return reserve;
		
	}
	public void adminTicketReplWrite(TicketBoardDTO ticketBoardDTO) {
		sqlSession.insert("adminTicket.adminTicketReplWrite",ticketBoardDTO);
		
	}
	public void ticketcancle(String ticket_id) {
		sqlSession.update("adminTicket.ticketcancle",ticket_id);
		
	}
	public String adminpayForm() throws Exception {
	String total =sqlSession.selectOne("adminTicket.adminpayForm");
	
		return total;
	}
	public List<TicketDTO> adminpayFormlist()throws Exception  {
		List<TicketDTO>	paylist=sqlSession.selectList("adminTicket.adminpayFormlist");
		return paylist;
	}
	public String admindatepay(TicketDTO ticketDTO) {
		String total =sqlSession.selectOne("adminTicket.admindatepay",ticketDTO);
		System.out.println(total); 
		return total;
	}
	public List<TicketDTO> admindatepaylist(TicketDTO ticketDTO) {
		List<TicketDTO>	paylist=sqlSession.selectList("adminTicket.admindatepaylist",ticketDTO);
		return paylist;
	}
	

}
