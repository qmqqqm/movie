package com.movie.movie.member.membercontroller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.movie.movie.member.memberDTO.MemberDTO;

public interface MemberController {

	//개인회원정보조회 
		public ModelAndView getMemberDetail(
				HttpServletRequest request, 
				HttpServletResponse response, 
				ModelAndView mv, 
				@RequestParam Map<String, Object> info) throws Exception;
		  
		//회원삭제 
		public ModelAndView deleteMember(
				//@RequestParam(value="memberTel", required=true) String tel,
				//@RequestParam(value="memberGender", required=false) String gender,
				@RequestParam("member_userid") String member_userid,
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception;
		
		//회원가입처리(xml에서 Map이용시) 
		//public ModelAndView joinMemberMap(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		//회원가입폼보여주기(xml에서 Map이용시) 
		//public String joinFormMap(HttpServletRequest request, HttpServletResponse response) throws Exception;
		 
		//회원목록조회
		public  ModelAndView  getMemberList(HttpServletRequest request, HttpServletResponse response) throws Exception;

		//회원가입폼보여주기(xml에서 DTO이용시)
		public String joinForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
		  
		//회원가입처리(xml에서 DTO이용시) 
		public ModelAndView joinMember(
				@ModelAttribute("info") MemberDTO memberDTO,
				HttpServletRequest request, 
				HttpServletResponse response) throws Exception;
		
		//로그인폼 보여주기
		public String loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		//로그인처리
		public ModelAndView login(HttpServletRequest request, 
				HttpServletResponse response,
				@RequestParam Map<String ,Object> memberInfo,
				RedirectAttributes rdAttr) throws Exception;
		//로그아웃
		public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response,ModelAndView mv) throws Exception;
		
		//수정하기 처리
		public ModelAndView chgMember(@ModelAttribute MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response,ModelAndView mv) throws Exception;
		
		//마이페이지
				public ModelAndView myPage(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv
						) throws Exception;
				
				//마이페이지 : 회원정보수정 폼
				public ModelAndView myPageModifyForm(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@RequestParam("member_id")int member_id) throws Exception;
				//마이페이지 : 회원정보수정
				public ModelAndView myPageModify(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@ModelAttribute("memberInfo") MemberDTO memberDto) throws Exception;
						
				//마이페이지 : 회원탈퇴
				public ModelAndView myPageDelete(HttpServletRequest request, 
						HttpServletResponse response,
						ModelAndView mv,
						@RequestParam("member_id")int member_id) throws Exception ;
	}

