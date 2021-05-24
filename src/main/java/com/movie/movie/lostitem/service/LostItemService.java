package com.movie.movie.lostitem.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.movie.movie.lostitem.dto.LostItemDTO;
import com.movie.movie.lostitem.dto.LostItemListDTO;

@Service("lostItemService")
public interface LostItemService {

	public void lostItemPro(LostItemDTO lostItemDTO) throws Exception;
	
	public LostItemListDTO lostList(int pageNo) throws Exception;
	
	public LostItemDTO lostListDetail(int lost_id) throws Exception;
	
	public void lostListwrite(Map map) throws Exception;
	
	public List<LostItemDTO> isAnser(int member_id) throws Exception;
	
	public void lostAnserFin(int lost_id) throws Exception;
}
