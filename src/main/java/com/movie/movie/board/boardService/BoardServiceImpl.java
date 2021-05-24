package com.movie.movie.board.boardService;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.movie.movie.board.boardDAO.BoardDAO;
import com.movie.movie.board.boardDTO.BoardDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Inject
	BoardDAO boardDAO;
	
	//게시글 쓰기
	@Override
	public void create(BoardDTO dto) throws Exception{
		String title = dto.getTitle();
		String content = dto.getContent();
		String writer = dto.getWriter();
		
		//*태크문자 처리 
		//replace(A,B) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		writer = writer.replace("<", "&lt;");
		writer = writer.replace("<", "&gt;");
		//공백문자 처리
		title = title.replace(" ", "&nbsp;&nbsp;");
		writer = writer.replace(" ", "&nbsp;&nbsp;");
		//줄바꿈 문자 처리
		content = content.replace("\n", "<br>");
		dto.setTitle(title);
		dto.setContent(content);
		dto.setWriter(writer);
		boardDAO.create(dto);
	}
	//게시글 상세보기
	@Override
	public BoardDTO read(int bno) throws Exception{
		return boardDAO.read(bno);
	}
	//게시글 수정
	@Override
	public void update(BoardDTO dto) throws Exception{
		boardDAO.update(dto);
	}
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception{
		boardDAO.delete(bno);
	}
	//게시글 전체 목록
	@Override
	public List<BoardDTO> listAll() throws Exception{
		return boardDAO.listAll();
	}
	
		
	}

