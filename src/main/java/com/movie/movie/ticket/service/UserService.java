package com.movie.movie.ticket.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.ticket.dao.UserDAO;
import com.movie.movie.ticket.dto.UserDTO;

@Service("userService")
public class UserService {
	@Autowired
	private UserDAO userDAO;
	public UserDTO login(UserDTO userDTO)throws DataAccessException {
		System.out.println(userDTO);
		UserDTO user=userDAO.login(userDTO);
		
		return user;
	}
	
}
