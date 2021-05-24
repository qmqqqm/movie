package com.movie.movie.theater.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.theater.dao.TheaterDAO;
import com.movie.movie.theater.dto.BookMarkDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;
import com.movie.movie.theater.dto.TotalSangygDTO;

@Service("theaterService")
public class TheaterServiceImpl implements TheaterService{

	@Autowired
	TheaterDAO theaterDAO;
	//윤이 극장
	@Override
	public List<TheaterDTO> showTheater() throws Exception {
		List<TheaterDTO> theaters = theaterDAO.showTheater();
		System.out.println(theaters);
		return theaters;
	}

	@Override
	public List<String> getLocation() throws Exception {
		List<String> location = theaterDAO.getLocation();
		return location;
	}
	
	//��ȭ�� ��
	@Override
	public TotalSangygDTO totalSangyg(int theater_id) throws Exception {
		TotalSangygDTO total = theaterDAO.getTotal(theater_id); 
		return total;
	}

	@Override
	public List<TimesDTO> getTimes(int theater_id, String day) throws Exception {
		List<TimesDTO> times = theaterDAO.getTimes(theater_id,day);
		return  times;
	}

	@Override
	public List<MovieDTO> movieInform(List id_list) throws Exception {
		System.out.println("movieInform service");
		List<MovieDTO> movieList = theaterDAO.getMovie(id_list);
		return movieList;
	}

	@Override
	public List<SangygDTO> sangygInform(List sangygList, int theater_id) throws Exception {
		System.out.println("sangygInform service����");
		List<SangygDTO> sangygInform = theaterDAO.getSangyg(sangygList, theater_id);
		return sangygInform;
	
	}
	
	//준기 극장

	//위치를 통해 극장번호 받아오기
	@Override
	public List<String> theNumber(String theater_location) throws Exception {
		List<String> theList = theaterDAO.theNumber(theater_location);
		return theList;
	}

	@Override
	public void ajxPopUpreg(Map map) throws Exception {
		theaterDAO.ajxPopUpreg(map);
	}

	@Override
	public BookMarkDTO selectBookMark(int member_id) throws Exception {
		BookMarkDTO selectBookMark = theaterDAO.selectBookMark(member_id);
		return selectBookMark;
	}

	@Override
	public void ajxPopUpregUP(Map map) throws Exception {
		theaterDAO.ajxPopUpregUP(map);
	}

	@Override
	public int selImgNo(int theater_id) throws Exception {
		int imgNo = theaterDAO.selImgNo(theater_id);
		
		return imgNo;
	}

	@Override
	public TheaterImageDTO selImg(int image_id) throws Exception {
		TheaterImageDTO theaterImageDTO =theaterDAO.selImg(image_id);
		return theaterImageDTO;
	}

}
