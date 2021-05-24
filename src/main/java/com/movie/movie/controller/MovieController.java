package com.movie.movie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movie.movie.member.memberDTO.MemberDTO;
import com.movie.movie.dto.MovieDto;
import com.movie.movie.dto.PagingDto;
import com.movie.movie.dto.ReviewDto;

public interface MovieController {

	//영화목록
	public ModelAndView movieList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws Exception;
	
	//영화수정폼
	public ModelAndView movieModifyForm(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, @RequestParam(value = "movie_id",required=true) int movie_id) throws Exception;
		
	//영화상세보기
	public ModelAndView movieDetail(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, 
			@RequestParam(value = "movie_id",required=true) int movie_id
					) throws Exception;
	
	//영화수정
	public ModelAndView movieModify(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("info") MovieDto movieDto, 
			@RequestParam("MainFile") MultipartFile MainFile,
			@RequestParam("SubFile") MultipartFile[] SubFile,
			@RequestParam("sub_movieImage_fileName") String[] sub_movieImage_fileName,
			ModelAndView mv)
		throws Exception;
	
	//영화삭제
	public ModelAndView movieDelete(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, @RequestParam(value = "movie_id",required=true) String movie_id) throws Exception;
	
	//영화작성폼
	public String movieWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//영화작성
	public ModelAndView movieWrite(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, 
			@RequestParam("MainFile") MultipartFile MainFile,
			@RequestParam("SubFile") MultipartFile[] SubFile,
			@ModelAttribute("movieInfo") MovieDto movieDto
			) throws Exception;
	
	//영화 주요정보 입력폼
	public ModelAndView mainInfoWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//리뷰입력폼
	public ModelAndView reviewWriteForm(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "movie_id",required=true) String movie_id, ModelAndView mv) throws Exception;
	
	//리뷰작성
	public ModelAndView reviewWrite(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("reviewInfo") ReviewDto reviewDto,
			ModelAndView mv) throws Exception;
	
	//리뷰리스트
	public ModelAndView reviewList(HttpServletRequest request, HttpServletResponse response, 
			ModelAndView mv, 
			PagingDto pagingDto,
			@RequestParam(value = "movie_id",required=true) int movie_id,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage
					) throws Exception;
	//리뷰
	public ModelAndView reviewModifyForm(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(value="review_id", required=false)int review_id
	) throws Exception;
	
	//리뷰수정
	public ModelAndView reviewModify(HttpServletRequest request, HttpServletResponse response, 
			@ModelAttribute("reviewInfo") ReviewDto reviewDto
		) throws Exception;
	
	//리뷰삭제
	public ModelAndView reviewDelete(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(value="review_id", required=false)int review_id,
			@RequestParam(value="movie_id", required=false)int movie_id
	) throws Exception;
	
	
	
}
