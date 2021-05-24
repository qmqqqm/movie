package com.movie.movie.member.memberService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.member.memberDTO.MemberListDTO;


public interface MemberService {
		//개인회원정보조회
		public MemberDTO  getMemberDetail(Map<String,Object> info) throws DataAccessException;
		
		//회원삭제
		public int deleteMember(String id) throws DataAccessException;
		
		//회원가입처리(xml에서 DTO이용시)
		public int joinMember(MemberDTO memberDTO) throws DataAccessException;
		
		//회원목록조회
		public List<MemberDTO>  getMemberList() throws DataAccessException;
		
		//로그인처리
		public MemberDTO login(Map<String, Object> memberInfo);
		
		//로그아웃
		public void logout(HttpSession session);

		public MemberListDTO memberList(int pageNo) throws Exception;

		public void chgMember(MemberDTO memberDTO)throws Exception;
		
		//마이페이지
		public MemberDTO myPage(int member_id) throws DataAccessException;

		//마이페이지 : 회원수정
		public void myPageDelete(int member_id) throws DataAccessException;

		//마이페이지 : 회원탈퇴
		public void myPageModify(MemberDTO memberDto) throws DataAccessException;
		
		//회원수조회
		//public int getMemberCount()  throws DataAccessException;
	}
