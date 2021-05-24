package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.movie.movie.theater.dto.BeforeTimeDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;


public interface AdTheaterService {
	
	public List<TheaterDTO> showTheaterList()throws DataAccessException;
	
	//��ȭ�� ����Ʈ ���
	public List<TheaterDTO> showTheaterList(RowDTO rowDTO)throws DataAccessException;
	
	//���οȭ�� �����
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException;

	//���ο� ��ȭ�� �����- ������ ��������
	public List<String> getLocation()throws DataAccessException;

	//삭제
	public int deleteTheater(int theater_id)throws DataAccessException;
	//수정폼
	public TheaterDTO TheaterInform(int theater_id) throws DataAccessException;
	//수정
	public int modifyTheater(TheaterDTO theaterDTO);
	
	//이미지들 정보 입력
	public void addTheaterImage(List<TheaterImageDTO> theaterImageList) throws Exception;
	
	//극장 이미지 정보 받아오기
	public List<TheaterImageDTO> chooseTheImg() throws Exception;
	
	public List<MovieDTO> movieList() throws Exception;

	public List<SangygDTO> sangygInform(int theater_id) throws Exception;

	public void createTimeT(BeforeTimeDTO beforeDTO) throws Exception;

	public List<TimesDTO> timesList(int theater_id)  throws Exception;

	public void deleteTimes(int times_id)  throws Exception;
}
