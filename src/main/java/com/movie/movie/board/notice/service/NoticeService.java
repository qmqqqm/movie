package com.movie.movie.board.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.movie.movie.board.notice.dto.NoticeDTO;

public interface NoticeService {

	//public 리턴타입  함수명(매개변수리스트) throws DataAccessException;
	
	/* 공지사항 게시판 목록 조회 */
	public List<NoticeDTO> getNoticeList() throws DataAccessException;

	/* 공지사항 글 작성 처리 */
	public int noticeWriterSuc(NoticeDTO noticeDTO);

	/* 공지사항 글 상세보기 */
	public NoticeDTO getNoticeDetail(Map<String, Object> info) throws DataAccessException;

}
