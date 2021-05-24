package com.movie.movie.theater.dao;

import java.util.List;
import java.util.Map;

import com.movie.movie.theater.dto.BookMarkDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

public interface TheaterDAO {

	//윤이-극장
	public List<TheaterDTO> showTheater() throws Exception;

	public List<String> getLocation() throws Exception;

	public TotalSangygDTO getTotal(int theater_id) throws Exception;

	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception;

	public List<MovieDTO> getMovie(List id_list) throws Exception;

	public List<SangygDTO> getSangyg(List sangygList, int theater_id) throws Exception;
	
	//준기- 극장 즐겨찾기 관련
	//위치를 통해 극장번호 받아오기
	public List<String> theNumber(String theater_location)throws Exception;

	public void ajxPopUpreg(Map map) throws Exception;
	
	public void ajxPopUpregUP(Map map) throws Exception;
	
	public BookMarkDTO selectBookMark(int member_id) throws Exception;
	
	//준기  - 극장이미지번호 불러오기
	public int selImgNo(int theater_id)throws Exception;
	
	//준기  - 극장이미지 불러오기
	public TheaterImageDTO selImg(int image_id)throws Exception;
}

