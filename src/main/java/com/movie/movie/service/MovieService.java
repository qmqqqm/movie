package com.movie.movie.service;

import java.util.List;
import java.util.Map;

import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;


public interface MovieService {

		public List<MovieDto> movieList() throws Exception;

		public  Map<String,Object> movieDetail(int movie_id) throws Exception;

		public void movieModify(MovieDto movieDto) throws Exception;

		public void movieDelete(String movie_no) throws Exception;

		public void movieWrite(MovieDto movieDto)  throws Exception;

		public int selectMovie_id(String movie_title) throws Exception;

		public void movieImageWrite(List<Object> subName,int movie_id, Map<String, Object> mainMap) throws Exception;
		
		public int reviewCount(int movie_id) throws Exception;
		
		public List<ReviewDto> review(PagingDto pagingDto) throws Exception;

		public void reviewWrite(ReviewDto reviewDto) throws Exception;

		public ReviewDto reviewModifyForm(int review_id) throws Exception;

		public void reviewModify(ReviewDto reviewDto) throws Exception;

		public void reviewDelete(int review_id) throws Exception;

		public void movieImageModify(List<Object> subName, int movie_id) throws Exception;

		public void movieImageDelete(String string, int movie_id) throws Exception;


}
