package com.movie.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.dao.MovieDao;
import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;

@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	MovieDao movieDao;
	
	//영화리스트
	@Override
	public List<MovieDto> movieList() throws Exception {
		List<MovieDto> movieList = movieDao.movieList();
		return movieList;
	}

	//영화상세보기
	@Override
	public Map<String,Object> movieDetail(int movie_id) throws Exception {
		Map<String,Object> map = movieDao.movieDetail(movie_id);
		return map;
	}
	
	@Override
	public int selectMovie_id(String movie_title) throws Exception {
		int movie_id= movieDao.selectMovie_id(movie_title);
		return movie_id;
	}

	//영화수정
	@Override
	public void movieModify(MovieDto movieDto) throws Exception {
		movieDao.movieModify(movieDto);
	}
	
	//서브이미지 수정
	@Override
	public void movieImageModify(List<Object> subName, int movie_id) throws Exception {
		movieDao.movieImageModify(subName,movie_id);
	}

	//서브이미지 삭제
	@Override
	public void movieImageDelete(String string, int movie_id) throws Exception {
		movieDao.movieImageDelete(string,movie_id);
		
	}
	
	
	//영화삭제
	@Override
	public void movieDelete(String movie_no) throws Exception {
		movieDao.movieDelete(movie_no);
	}



	//영화작성
	@Override
	public void movieWrite(MovieDto movieDto) throws Exception {
		movieDao.movieWrite(movieDto);
		
	}

	//리뷰카운트
	@Override
	public int reviewCount(int movie_id) throws Exception {
		int reviewCount = movieDao.reviewCount(movie_id);
		return reviewCount;
	}
	//리뷰가져오기
	@Override
	public List<ReviewDto> review(PagingDto pagingDto) throws Exception {
		List<ReviewDto> review = movieDao.reviewDetail(pagingDto);
		return review;
	}

	//영화이미지작성
	@Override
	public void movieImageWrite(List<Object> subName,int movie_id, Map<String, Object> mainMap) throws Exception{
		movieDao.movieImageWrite(subName,movie_id,mainMap);
		
	}

	//리뷰작성
	@Override
	public void reviewWrite(ReviewDto reviewDto) throws Exception {
		movieDao.reviewWrite(reviewDto);
	}

	//리뷰수정폼
	@Override
	public ReviewDto reviewModifyForm(int review_id) throws Exception {
		ReviewDto reviewDto= movieDao.reviewWrite(review_id);
		return reviewDto;
	}

	//리뷰수정하기
	@Override
	public void reviewModify(ReviewDto reviewDto) throws Exception {
		movieDao.reviewModify(reviewDto);
	}

	//리뷰삭제하기
	@Override
	public void reviewDelete(int review_id) throws Exception {
		 movieDao.reviewDelete(review_id);
	}
	
	
	
	
	
	
	

	
	
}
