package com.movie.movie.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.theater.dto.BeforeTimeDTO;
import com.movie.movie.theater.dto.MovieDTO;
import com.movie.movie.theater.dto.RowDTO;
import com.movie.movie.theater.dto.SangygDTO;
import com.movie.movie.theater.dto.TheaterDTO;
import com.movie.movie.theater.dto.TheaterImageDTO;
import com.movie.movie.theater.dto.TimesDTO;

@Repository("adtheaterDAO")
public class AdTheaterDAOImpl implements AdTheaterDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	//��ȭ�� ��� �����ֱ�
		@Override
		public List<TheaterDTO> selectTheater() throws DataAccessException {
			List<TheaterDTO> theaterList = sqlSession.selectList("adTheater.TheaterList");
			return theaterList;
		}
	
	//��ȭ�� ��� �����ֱ�
	@Override
	public List<TheaterDTO> selectTheater(RowDTO rowDTO) throws DataAccessException {
		List<TheaterDTO> theaterList = sqlSession.selectList("adTheater.selectTheaterList",rowDTO);
		return theaterList;
	}

	//��ȭ�� ���� ��������
	@Override
	public List<String> selectLocation() throws DataAccessException {
		List<String> locationList = sqlSession.selectList("adTheater.selectlocationList");
		return locationList;
	}
	
	//��ȭ�� ����
	@Override
	public int createTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = sqlSession.insert("adTheater.createTheater",theaterDTO);
		//insert�� �� record���� return�޴´�
		//���⿡�� ����� insert���� �����Ǹ� 1���� record�� insert�ǹǷ�
		//1�� ���Ϲ޴´�
		//���� 0�� ���Ϲ�����  insert fail�� �ǹ��Ѵ�
		System.out.println("createTheater()������ result ="+result);//Ȯ�ο�
		
		return result;
	}

	//��ȭ�� ����
	@Override
	public int deleteTheater(int theater_id) throws DataAccessException {
		System.out.println("dao����");
		int result = sqlSession.update("adTheater.deleteTheater", theater_id);
		System.out.println("dao result" + result);
		return result;
	}
	//수정폼
	@Override
	public TheaterDTO theaterInform(int theater_id) throws DataAccessException {
		System.out.println("theater dao 진입");
		TheaterDTO theaterDTO = sqlSession.selectOne("adTheater.theaterInform", theater_id);
		return theaterDTO;
	}
	//수정
	@Override
	public int modifyTheater(TheaterDTO theaterDTO) throws DataAccessException {
		int result = sqlSession.update("adTheater.modifyTheater", theaterDTO);
		return result;
	}

	//극장 이미지들 정보 업로드
	@Override
	public void addTheaterImage(List<TheaterImageDTO> theaterImageList) throws DataAccessException {
		for(TheaterImageDTO theaterImageDTO : theaterImageList) {
		sqlSession.insert("adTheater.theaterImage", theaterImageDTO);
		}
	}

	//극장이미지정보 가져오기
	@Override
	public List<TheaterImageDTO> chooseTheImg() throws DataAccessException {
		List<TheaterImageDTO> TheaterImageList = sqlSession.selectList("adTheater.chooseTheImg");
		return TheaterImageList;
	}
	
	//상영시간표 - 영화 정보
		@Override
		public List<MovieDTO> movieList() throws DataAccessException {
			List<MovieDTO> movieList = sqlSession.selectList("adTheater.movieList");
			return movieList;
		}

		@Override
		public List<SangygDTO> selectsangyg(String theater_location) throws DataAccessException {
			
			List<SangygDTO> sangygList = sqlSession.selectList("adTheater.sangygList", theater_location);
			return sangygList;
		}

		@Override
		public List<SangygDTO> sangygInform(int theater_id) throws DataAccessException {
			List<SangygDTO> sangygList = sqlSession.selectList("adTheater.sangygInform",theater_id);
			return sangygList;
		}

		@Override
		public void createTimeT(BeforeTimeDTO beforeDTO) throws DataAccessException {
			sqlSession.insert("adTheater.createTimeT", beforeDTO);
			
			
		}

		@Override
		public List<TimesDTO> timesList(int theater_id) throws DataAccessException {
			 List<TimesDTO> timesList = sqlSession.selectList("adTheater.timesList", theater_id);
			return  timesList;
		}
		
		//상영시간표테이블의 movie_id -> movie_title
		@Override
		public String getMovieName(int movie_id) throws DataAccessException {
			String movie_title = sqlSession.selectOne("adTheater.getMovieTitle", movie_id);
			return movie_title;
		}
		//상영시간 삭제
		@Override
		public void deleteTimes(int times_id) throws DataAccessException {
			sqlSession.delete("adTheater.deleteTimes", times_id);
			
		}
	
	

}
