package com.movie.movie.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;

public interface MovieDao {

	//무비목록
	public List<MovieDto>  movieList() throws DataAccessException;

	//영화상세
	public Map<String,Object>  movieDetail(int movie_id) throws DataAccessException;

	//영화수정
	public void movieModify(MovieDto movieDto) throws DataAccessException;

	//영화삭제
	public void movieDelete(String movie_id) throws DataAccessException;

	//영화작성
	public void movieWrite(MovieDto movieDto) throws DataAccessException;
	
	//영화아이디 가져오기
	public int selectMovie_id(String movie_title) throws DataAccessException;

	//영화이미지작성
	public void movieImageWrite(List<Object> subName,int movie_id, Map<String, Object> mainMap) throws DataAccessException;
	
	//리뷰페이징
	public int reviewCount(int movie_id) throws DataAccessException;
	public List<ReviewDto> reviewDetail(PagingDto pagingDto) throws DataAccessException;

	//리뷰작성
	public void reviewWrite(ReviewDto reviewDto) throws DataAccessException;

	//리뷰수정폼
	public ReviewDto reviewWrite(int review_id)  throws DataAccessException;

	//리뷰수정하기
	public void reviewModify(ReviewDto reviewDto) throws DataAccessException;

	//리뷰삭제하기
	public void reviewDelete(int review_id) throws DataAccessException;
	
	//서브이미지 수정
	public void movieImageModify(List<Object> subName,int movie_id) throws DataAccessException;

	//서브이미지 삭제
	public void movieImageDelete(String string, int movie_id) throws DataAccessException;

}
