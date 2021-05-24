package com.movie.movie.board.boardDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.movie.board.boardDTO.BoardDTO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Inject
	SqlSession sqlSession;
	
	//게시글 작성
	@Override
	public void create(BoardDTO dto) throws Exception{
		sqlSession.insert("board.insert", dto);
	}
	//게시글 상세보기
	@Override
	public BoardDTO read(int bno) throws Exception{
		return sqlSession.selectOne("board.view", bno);
	}
	//게시글 수정
	@Override
	public void update(BoardDTO dto) throws Exception{
		sqlSession.update("board.updateArticle", dto);
	}
	
	//게시글 삭제
	@Override
	public void delete(int bno) throws Exception{
		sqlSession.delete("board.deleteArticle", bno);
	}
	//게시글 전체 목록
	@Override
	public List<BoardDTO> listAll() throws Exception {
		return sqlSession.selectList("board.listAll");
	}
	
	//조회수 증가
	@Override
	public void increaseViewcnt(int bno) throws Exception{
		sqlSession.update("board.increaseViewcnt", bno);
	}

}
