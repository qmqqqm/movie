package com.movie.movie.member.memberDAO;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.dao.DataAccessException;

import com.movie.movie.lostitem.dto.LostItemDTO;
import com.movie.movie.member.memberDTO.MemberDTO;


public interface MemberDAO {
	//개인회원정보조회
		public MemberDTO getMemberDetail(Map<String,Object> info) throws DataAccessException;
		
		//회원삭제
		public int deleteMember(String member_userid) throws DataAccessException;
		
//		//회원가입처리(xml에서 Map이용시)
//		public int joinMemberMap(Map<String,Object> memberMap) throws DataAccessException;
		
		//회원가입처리(xml에서 DTO이용시)
		public int joinMember(MemberDTO memberDTO) throws DataAccessException;

		//회원목록조회
		public List<MemberDTO>  getMemberList() throws DataAccessException;

		//로그인처리
		public MemberDTO login(Map<String, Object> memberInfo) throws DataAccessException;

		//로그아웃
		public void logout(HttpSession session);

		public int memberListCount() throws DataAccessException;

		public List<MemberDTO> memberList(int start, int end) throws DataAccessException;

		public void chgMember(MemberDTO memberDTO)throws DataAccessException;
		
		//마이페이지
		public MemberDTO myPage(int member_id) throws DataAccessException;

		//마이페이지:회원탈퇴
		public void myPageDelete(int member_id) throws DataAccessException;

		//마이페이지:회원수정
		public void myPageModify(MemberDTO memberDto) throws DataAccessException;
		
		//회원수 조회
		//public int getMemberCount() throws DataAccessException;
	}
