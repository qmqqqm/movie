package com.movie.movie.member.memberService;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.member.memberDAO.MemberDAO;
import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.member.memberDTO.MemberListDTO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
		
	private int size = 5;  //한 페이지에 출력할 게시물수
	
	//회원목록조회
	@Override
	public List<MemberDTO> getMemberList() throws DataAccessException {
		System.out.println("MemberServiceImpl의 getMemberList()진입");
		List<MemberDTO> memberList = memberDAO.getMemberList();
		return memberList;
	}

	//회원가입처리(MemberDTO이용)
	@Override
	public int joinMember(MemberDTO memberDTO) throws DataAccessException {
		int result = memberDAO.joinMember(memberDTO);
		return result;
	}


	@Override
	public int deleteMember(String member_userid) throws DataAccessException {
		int result = memberDAO.deleteMember(member_userid);
		return result;
	}

	//개인회원정보 조회
	@Override
	public MemberDTO getMemberDetail(Map<String, Object> info) throws DataAccessException {
		MemberDTO memberDTO = memberDAO.getMemberDetail(info);
		return memberDTO;
	}

	//로그인처리
	@Override
	public MemberDTO login(Map<String, Object> memberInfo) {
		MemberDTO memberDTO = memberDAO.login(memberInfo);
		return memberDTO;
	}

	//로그아웃
	@Override
	public void logout(HttpSession session) {
		
		session.invalidate();
	}

	@Override
	public MemberListDTO memberList(int pageNo) throws Exception {
		
		//총페이지수 구하기
				int total = memberDAO.memberListCount();
				//원하는 만큼의 데이터구하기
				List<MemberDTO> content = memberDAO.memberList((pageNo-1)*size,size);
				
				
				return new MemberListDTO(total, pageNo, size, content);
	}

	@Override
	public void chgMember(MemberDTO memberDTO) throws Exception {
		memberDAO.chgMember(memberDTO);
	}
	
	//마이페이지 
		@Override
		public MemberDTO myPage(int member_id) throws DataAccessException {
			MemberDTO memberDTO = memberDAO.myPage(member_id);
			return memberDTO;
		}
		
		//마이페이지 : 회원삭제
		@Override
		public void myPageDelete(int member_id) throws DataAccessException {
			memberDAO.myPageDelete(member_id);
		}

		//마이페이지 : 회원수정
		@Override
		public void myPageModify(MemberDTO memberDto) throws DataAccessException {
			memberDAO.myPageModify(memberDto);
		}

	//회원수조회
//	@Override
//	public int getMemberCount() throws DataAccessException {
//		int count = memberDAO.getMemberCount();
//		return count;
//	}




}
