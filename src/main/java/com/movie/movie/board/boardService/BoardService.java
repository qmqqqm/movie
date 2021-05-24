package com.movie.movie.board.boardService;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.movie.movie.board.boardDTO.BoardDTO;

public interface BoardService {

	//게시글 작성
	public void create(BoardDTO dto) throws Exception;
	//게시글 상세조회
	public BoardDTO read(int bno) throws Exception;
	//게시글 수정
	public void update(BoardDTO dto) throws Exception;
	//게시글 삭제
	public void delete(int bno) throws Exception;
	//게시글 리스트
	public List<BoardDTO> listAll() throws Exception;
	
}
