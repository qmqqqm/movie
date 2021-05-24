package com.movie.movie.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminController")
public class AdminController {
	
	@RequestMapping("/adminchk.do")
	ModelAndView adminchk() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminchk");
		return mv;
	}

}
