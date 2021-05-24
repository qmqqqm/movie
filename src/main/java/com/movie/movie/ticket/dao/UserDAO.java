package com.movie.movie.ticket.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.ticket.dto.UserDTO;


@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSession sqlSession;
	public UserDTO login(UserDTO userDTO)throws DataAccessException {
		System.out.println(userDTO.getMember_id());
		UserDTO user=sqlSession.selectOne("member.login", userDTO);
		System.out.println("DAO"+user);
		return user;
	}

}
