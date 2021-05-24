package com.movie.movie.ticket.controller;

import javax.annotation.PreDestroy;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.movie.ticket.dao.UserDAO;
import com.movie.movie.ticket.dto.UserDTO;
import com.movie.movie.ticket.service.UserService;


@Controller("userController")
public class UserController {
	@Autowired
	private UserDTO userDTO;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/loginForm.do")
	public String loginForm() {
		return "loginForm";
	}
	@RequestMapping(value = "/login.do")
	public String login(Model model,@RequestParam("txtUserId") String member_userid,@RequestParam("txtPassword") String member_pwd,  HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		userDTO.setMember_userid(member_userid);
		userDTO.setMember_pwd(member_pwd);
		System.out.println(userDTO);
		UserDTO user=userService.login(userDTO);
		System.out.println(user);
		int ckeckAdmin=user.getMember_admin();
		if(ckeckAdmin==99){
			HttpSession session=request.getSession();	
			session.setAttribute("admin",user);
			response.sendRedirect("./adminTicketForm.do");
		}else {	
		HttpSession session=request.getSession();	
		session.setAttribute("user",user);
		}
		return "main";
	}
	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, 
			HttpServletResponse response)throws Exception {
		HttpSession sesson =request.getSession();
		sesson.invalidate();
		return "main";
	}
	@RequestMapping(value = "/join.do")
	public String join() {
		return "join";
	}
	@RequestMapping(value = "/mynb.do")
	public String mynb() {
		return "mynb";
	}
	@RequestMapping(value = "/clubService.do")
	public String clubService() {
		return "clubService";
	}
	
	
	

}
