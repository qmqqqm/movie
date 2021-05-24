package com.movie.movie.theater.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.BeforeTimeDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;


public interface AdTheaterDAO {
	
	//��ȭ�� ��� �����ֱ�
		public List<TheaterDTO> selectTheater() throws DataAccessException;

	//���ο� ��ȭ�� �����-������ ��������
	public List<String> selectLocation() throws DataAccessException;

	//���ο� ��ȭ�� �����
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//��ȭ�� ��� �����ֱ�
	public List<TheaterDTO> selectTheater(RowDTO rowDTO) throws DataAccessException;

	//삭제
	public int deleteTheater(int theater_id) throws DataAccessException;
	//수정폼
	public TheaterDTO theaterInform(int theater_id)throws DataAccessException;
	//수정
	public int modifyTheater(TheaterDTO theaterDTO)throws DataAccessException;
	
	//극장이미지들 정보 업로드
	public void addTheaterImage(List<TheaterImageDTO> theaterImageList) throws DataAccessException ;
	
	//극장이미지 정보 가져오기
	public List<TheaterImageDTO> chooseTheImg()throws DataAccessException;
	
	//상영시간표 - 영화 정보
		public List<MovieDTO> movieList() throws DataAccessException;

		public List<SangygDTO> selectsangyg(String theater_location) throws DataAccessException;

		public List<SangygDTO> sangygInform(int theater_id) throws DataAccessException;

		public void createTimeT(BeforeTimeDTO beforeDTO) throws DataAccessException;

		//상영시간표테이블 정보 가져오기
		public List<TimesDTO> timesList(int theater_id) throws DataAccessException;

		//상영시간표테이블의 movie_id -> movie_title
		public String getMovieName(int movie_id) throws DataAccessException;

		//상영시간 삭제
		public void deleteTimes(int times_id) throws DataAccessException;

}
