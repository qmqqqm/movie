package com.movie.movie.board.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.movie.movie.board.notice.dto.NoticeDTO;

public interface NoticeDAO {

	/* 공지사항 글 목록 보기 */
	public List<NoticeDTO> getNoticeList() throws DataAccessException;

	/* 공지사항 글 작성 처리 */
	public int noticeWriterSuc(NoticeDTO noticeDTO) throws DataAccessException;

	/* 공지사항 글 상세보기 */
	public NoticeDTO getNoticeDetail(Map<String, Object> info) throws DataAccessException;
	
}
