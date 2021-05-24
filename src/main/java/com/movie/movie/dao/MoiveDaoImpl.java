package com.movie.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;

@Repository("movieDao")
public class MoiveDaoImpl implements MovieDao {

	@Autowired
	private SqlSession sqlSession;
	
	//영화리스트
	@Override
	public List<MovieDto> movieList() throws DataAccessException {
		
		List<MovieDto> movieList = sqlSession.selectList("movie.movieList");
		return movieList;
	}

	//영화상세
	@Override
	public Map<String,Object> movieDetail(int movie_id) throws DataAccessException {
		Map<String,Object> map = new HashMap<String,Object>();
		//영화상세보기
		MovieDto movieDetail = sqlSession.selectOne("movie.movieDetail",movie_id);
		map.put("movieDetail", movieDetail);
		
		//영화스틸컷
		List<MovieDto> movieDetailImg = sqlSession.selectList("movie.movieDetailImg",movie_id);
		map.put("movieDetailImg", movieDetailImg);
		//영화정보
		//MovieInfoDto movieInfo = sqlSession.selectOne("movie.movieInfo",movie_id);
		//map.put("movieInfo", movieInfo);
		//영화리뷰
		
		return map;
	}
	
	//리뷰 페이징
	//카운트
	@Override
	public int reviewCount(int movie_id) throws DataAccessException {
		int reviewCount = sqlSession.selectOne("movie.countReview",movie_id);
		return reviewCount;
	}
	
	//리뷰가져오기
	@Override
	public List<ReviewDto> reviewDetail(PagingDto pagingDto) throws DataAccessException {
		List<ReviewDto> review = sqlSession.selectList("movie.selectReview",pagingDto);
		return review;
	}
	
	//영화아아디
	@Override
	public int selectMovie_id(String movie_title) throws DataAccessException {
		
		int movie_id= sqlSession.selectOne("movie.selectMovieId",movie_title);
		return movie_id;
	}


	//영화수정
	@Override
	public void movieModify(MovieDto movieDto) throws DataAccessException {
		sqlSession.update("movie.movieModify",movieDto);
	}
	
	//서브이미지 수정
	@Override
	public void movieImageModify(List<Object> subName,int movie_id) throws DataAccessException{
		Map<String,Object> subMap = new HashMap<String,Object>();
		
		subMap.put("movie_id", movie_id);
		for(int i=0; i<subName.size(); i++) {
			subMap.put("subName", subName.get(i));
			sqlSession.insert("movie.movieSubImageWrite",subMap);
			
		}
		
	}
	
	@Override
	public void movieImageDelete(String movieImage_fileName, int movie_id) throws DataAccessException {
		Map<String,Object> subMap = new HashMap<String,Object>();
		subMap.put("movieImage_fileName",movieImage_fileName);
		subMap.put("movie_id",movie_id);
		sqlSession.delete("movie.movieSubImageDelete",subMap);
	}

	//영화삭제
	@Override
	public void movieDelete(String movie_id) throws DataAccessException {
		sqlSession.update("movie.movieDelete",movie_id);
		
	}

	//영화작성
	@Override
	public void movieWrite(MovieDto movieDto) throws DataAccessException {
		sqlSession.insert("movie.movieWrite",movieDto);
	}

	@Override
	public void movieImageWrite(List<Object> subName,int movie_id, Map<String, Object> mainMap) throws DataAccessException {
		sqlSession.insert("movie.movieMainImageWrite",mainMap);
		
		
		Map<String,Object> subMap = new HashMap<String,Object>();
		
		subMap.put("movie_id", movie_id);
		for(int i=0; i<subName.size(); i++) {
			subMap.put("subName", subName.get(i));
			sqlSession.insert("movie.movieSubImageWrite",subMap);
			
		}
		
	}

	//리뷰작성
	@Override
	public void reviewWrite(ReviewDto reviewDto) throws DataAccessException {
		sqlSession.insert("movie.reviewWrite", reviewDto);
	}

	//리뷰수정폼
	@Override
	public ReviewDto reviewWrite(int review_id) throws DataAccessException {
		ReviewDto reviewDto = sqlSession.selectOne("movie.review", review_id);
		return reviewDto;
	}

	//리뷰수정하기
	@Override
	public void reviewModify(ReviewDto reviewDto) throws DataAccessException {
		sqlSession.update("movie.reviewModify", reviewDto);
	}

	//리뷰삭제하기
	@Override
	public void reviewDelete(int review_id) throws DataAccessException {
		sqlSession.update("movie.reviewDelete", review_id);
	}
	
	
	
	
	
	
	

	
	
}
