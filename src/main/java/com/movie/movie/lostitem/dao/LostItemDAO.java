package com.movie.movie.lostitem.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.movie.movie.lostitem.dto.LostItemDTO;

public interface LostItemDAO {

	public void lostItemPro(LostItemDTO lostItemDTO) throws DataAccessException;
	
	public int lostListCount() throws DataAccessException;
	
	public List<LostItemDTO> lostList(int startRow, int size) throws DataAccessException;
	
	public LostItemDTO lostListDetail(int lost_id) throws DataAccessException;
	
	public void lostListwrite(Map map) throws DataAccessException;
	
	public List<LostItemDTO> isAnser(int member_id) throws DataAccessException;
	
	public void lostAnserFin(int lost_id) throws DataAccessException;
}
