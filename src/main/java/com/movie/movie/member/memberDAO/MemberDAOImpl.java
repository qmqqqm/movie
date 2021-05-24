package com.movie.movie.member.memberDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.member.memberDTO.MemberDTO;



@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

	//@Autowired를 이용하여 bean을 주입하기
		@Autowired
		private SqlSession sqlSession;
		
		
		
		//개인회원정보조회
		@Override
		public MemberDTO getMemberDetail(Map<String, Object> info) throws DataAccessException {
			MemberDTO memberDTO = (MemberDTO)sqlSession.selectOne("member.memberDetail", info);
			return memberDTO;
		}

//		//회원삭제
//		@Override
//		public int deleteMember(String id) throws DataAccessException {
//			int result = sqlSession.update("member.deleteMember", id);
//			System.out.println("DAO의 회원삭제된 record수="+result);
//			//update가 된 record수를 return받는다
//			//여기에서 실행된 update문이 성공되면 1개의 record가 update되므로
//			//1을 리턴받는다
//			//만약 0을 리턴받으면  update fail을 의미한다
//			return result;
//		}
	//	
	//	
//		//회원가입처리(XML에서   Map처리)
//		@Override
//		public int joinMemberMap(Map<String,Object> memberMap) {
//			//sqlSession.insert("mapper의 namespace.실행쿼리문id")
//			//sqlSession.insert("mapper의 namespace.실행쿼리문id",Object 파라미터)
//			int result = sqlSession.insert("member.joinMemberMap",memberMap);
//			//insert가 된 record수를 return받는다
//			//여기에서 실행된 insert문이 성공되면 1개의 record가 insert되므로
//			//1을 리턴받는다
//			//만약 0을 리턴받으면  insert fail을 의미한다
//			System.out.println("joinMemberMap()실행후 result ="+result);//확인용
//			
//			return result;
//		}
		
		
		//회원가입처리(XML에서   DTO처리)
		@Override
		public int joinMember(MemberDTO memberDTO) {
			//sqlSession.insert("mapper의 namespace.실행쿼리문id")
			//sqlSession.insert("mapper의 namespace.실행쿼리문id",Object 파라미터)
			int result = sqlSession.insert("member.joinMember",memberDTO);
			//insert가 된 record수를 return받는다
			//여기에서 실행된 insert문이 성공되면 1개의 record가 insert되므로
			//1을 리턴받는다
			//만약 0을 리턴받으면  insert fail을 의미한다
			System.out.println("joinMember()실행후 result ="+result);//확인용
			
			return result;
		}
		
		
		//회원목록조회
		@Override
		public List<MemberDTO> getMemberList() throws DataAccessException {
			System.out.println("MemberDAOImpl의 getMemberList()진입");
			
			//selectList("mapper의 namespace.실행쿼리문id")
			List<MemberDTO> memberList = sqlSession.selectList("member.getMemberList");
			return memberList;
		}


		//회원삭제
		@Override
		public int deleteMember(String member_userid) throws DataAccessException {
			int result = sqlSession.update("member.deleteMember", member_userid);
			return result;
		}

		//로그인처리
		@Override
		public MemberDTO login(Map<String, Object> memberInfo) throws DataAccessException {
			MemberDTO memberDTO = (MemberDTO)sqlSession.selectOne("member.login", memberInfo);
			return memberDTO;
		}

		//로그아웃
		@Override
		public void logout(HttpSession session) {
			
		}

		@Override
		public int memberListCount() throws DataAccessException {
			int result = sqlSession.selectOne("member.memberListCount");
			return result;
		}

		@Override
		public List<MemberDTO> memberList(int startRow, int size) throws DataAccessException {
			Map<String, Integer> map = new HashMap<String, Integer>();
			int start = startRow+1;
			int end = startRow+size;
			map.put("start",start);
			map.put("end",end);
			
			List<MemberDTO> lostItemList = sqlSession.selectList("member.memberListget", map);
			return lostItemList;
		}

		@Override
		public void chgMember(MemberDTO memberDTO) throws DataAccessException {
			sqlSession.update("member.chgMember",memberDTO);
		}
		
		//마이페이지
		@Override
		public MemberDTO myPage(int member_id) throws DataAccessException {
			MemberDTO memberDTO = (MemberDTO)sqlSession.selectOne("member.myPage", member_id);
			return memberDTO;
		}

		//마이페이지 : 회원탈퇴
		@Override
		public void myPageDelete(int member_id) throws DataAccessException {
			sqlSession.selectOne("member.myPageDelete", member_id);
					
		}

		//마이페이지 : 회원수정
		@Override
		public void myPageModify(MemberDTO memberDto) throws DataAccessException {
			sqlSession.selectOne("member.myPageModify", memberDto);
					
		}

		//회원수조회
//		@Override
//		public int getMemberCount() throws DataAccessException {
//			int count = (Integer)sqlSession.selectOne("member.memberCount");
//			return count;
//		}







	}