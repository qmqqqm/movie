package com.movie.movie.theater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.movie.movie.theater.dao.AdTheaterDAO;
import com.movie.movie.theater.dto.BeforeTimeDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;


@Service("adTheaterService")
public class AdTheaterServiceImpl implements AdTheaterService{
	@Autowired
	private AdTheaterDAO adtheaterDAO;
	
	//영화관 목록 보여주기
		@Override
		public List<TheaterDTO> showTheaterList() throws DataAccessException {
			List<TheaterDTO> theaterList = adtheaterDAO.selectTheater();
			System.out.println(" theaterList ="+ theaterList );
			return theaterList;
		}
	

	//영화관 목록 보여주기
	@Override
	public List<TheaterDTO> showTheaterList(RowDTO rowDTO) throws DataAccessException {
		List<TheaterDTO> theaterList = adtheaterDAO.selectTheater(rowDTO);
		System.out.println(" theaterList ="+ theaterList );
		return theaterList;
	}

	//영화관 지역명 리스트 가져오기
	@Override
	public List<String> getLocation() throws DataAccessException {
		List<String> locationList = adtheaterDAO.selectLocation();
		return locationList;
	}
	
	//영화관 생성
	@Override
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = adtheaterDAO.createTheater(theaterDTO);
		return result;
	}
	
	//영화관 삭제하기
	@Override
	public int deleteTheater(int theater_id) throws DataAccessException {
		int result = adtheaterDAO.deleteTheater(theater_id);
		return result;
	}

	//영화관 수정폼
	@Override
	public TheaterDTO TheaterInform(int theater_id) throws DataAccessException {
		TheaterDTO theaterDTO = adtheaterDAO.theaterInform(theater_id);
		return theaterDTO;
	}
	//영화관 수정하기
	@Override
	public int modifyTheater(TheaterDTO theaterDTO) {
		int result = adtheaterDAO.modifyTheater(theaterDTO);
		return result;
	}

	//극장 이미지들 정보 업로드
	@Override
	public void addTheaterImage(List<TheaterImageDTO> theaterImageList) throws Exception {
		adtheaterDAO.addTheaterImage(theaterImageList);
	}

	//극장 이미지 정보 받아오기
	@Override
	public List<TheaterImageDTO> chooseTheImg() throws Exception {
		List<TheaterImageDTO> theaterImageList = adtheaterDAO.chooseTheImg();
		return theaterImageList;
	}
	
	//상영시간표 제작을 위한 영화정보 가져오기 
		@Override
		public List<MovieDTO> movieList() throws Exception {
			List<MovieDTO> movieList = adtheaterDAO.movieList();
			return movieList;
		}

		@Override
		public List<SangygDTO> sangygInform(int theater_id) throws Exception {
			List<SangygDTO> sangygInform =  adtheaterDAO.sangygInform(theater_id);
			return sangygInform;
		}

		@Override
		public void createTimeT(BeforeTimeDTO beforeDTO) throws Exception {
			adtheaterDAO.createTimeT(beforeDTO);
			
		}

		@Override
		public List<TimesDTO> timesList(int theater_id) throws Exception {
			List<TimesDTO> timesList = adtheaterDAO.timesList(theater_id);
			System.out.println(timesList);
			for(TimesDTO temp : timesList) {
				String title = adtheaterDAO.getMovieName(temp.getMovie_id());
				System.out.println(title);
				temp.setMovie_title(title);
				
				
			}
			System.out.println("service="+ timesList);
			return timesList;
		}

		//상영관 삭제
		@Override
		public void deleteTimes(int times_id) throws Exception {
			adtheaterDAO.deleteTimes(times_id);
			
		}
		
	

}
