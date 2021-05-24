package com.movie.movie.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.board.notice.dto.NoticeDTO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	/* 공지사항 게시판 글 목록 조회 */
	@Override
	public List<NoticeDTO> getNoticeList() throws DataAccessException {
		System.out.println("NoticeDAOImpl의 getNoticeList 진입 성공");
		List<NoticeDTO> noticeList = sqlSession.selectList("notice.getNoticeList");
		return noticeList;
	}
	
	/* 공지사항 글 작성 처리 */
	@Override
	public int noticeWriterSuc(NoticeDTO noticeDTO) throws DataAccessException {
		int result = sqlSession.insert("notice.noticeWriterSuc", noticeDTO);
		return result;
	}

	/* 공지사항 글 상세보기 */
	@Override
	public NoticeDTO getNoticeDetail(Map<String, Object> info) throws DataAccessException {
		System.out.println("NoticeDAOImpl의 getNoticeDetail 진입 성공");
		NoticeDTO noticeDTO = sqlSession.selectOne("notice.getNoticeDetail", info);
		return noticeDTO;
	}

}
