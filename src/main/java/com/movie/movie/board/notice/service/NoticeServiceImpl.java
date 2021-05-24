package com.movie.movie.board.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.board.notice.dao.NoticeDAO;
import com.movie.movie.board.notice.dto.NoticeDTO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	

	/* 공지사항 게시판 리스트 */
	@Override
	public List<NoticeDTO> getNoticeList() throws DataAccessException {
		System.out.println("NoticeServiceImpl의 getNoticeList 진입 성공");
		List<NoticeDTO> noticeList = noticeDAO.getNoticeList();
		return noticeList;
	}

	
	/* 공지사항 글 작성 처리 */
	@Override
	public int noticeWriterSuc(NoticeDTO noticeDTO) throws DataAccessException {
		System.out.println("NoticeServiceImpl의 noticeWriterSuc 진입 성공");
		int result = noticeDAO.noticeWriterSuc(noticeDTO);
		return result;
	}

	/* 공지사항 글 상세보기 */
	@Override
	public NoticeDTO getNoticeDetail(Map<String, Object> info) throws DataAccessException {
		System.out.println("NoticeServiceImpl의 getNoticeDetail 진입 성공");
		NoticeDTO noticeDTO = noticeDAO.getNoticeDetail(info);
		return noticeDTO;
	}

}
