package com.movie.movie.board.boardDAO;

import java.util.List;

import com.movie.movie.board.boardDTO.BoardDTO;

public interface BoardDAO {
	//게시글 작성
	public void create(BoardDTO dto) throws Exception;
	
	//게시글 상세보기
	public BoardDTO read(int bno) throws Exception;
	
	//게시글 수정
	public void update(BoardDTO dto) throws Exception;
	
	//게시글 삭제
	public void delete(int bno) throws Exception;
	
	//게시글 전체 목록
	public List<BoardDTO> listAll() throws Exception;
	
	//조회수 증가
	public void increaseViewcnt(int bno) throws Exception;

}
