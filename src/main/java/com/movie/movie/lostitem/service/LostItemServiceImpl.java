package com.movie.movie.lostitem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.movie.lostitem.dao.LostItemDAO;
import com.movie.movie.lostitem.dto.LostItemDTO;
import com.movie.movie.lostitem.dto.LostItemListDTO;

@Service("lostItemService")
public class LostItemServiceImpl implements LostItemService {

	@Autowired
	LostItemDAO lostItemDAO;
	
	private int size = 5;  //한 페이지에 출력할 게시물수
	
	@Override
	public void lostItemPro(LostItemDTO lostItemDTO) throws Exception {
		lostItemDAO.lostItemPro(lostItemDTO);
	}

	@Override
	public LostItemListDTO lostList(int pageNo) throws Exception {
		//총페이지수 구하기
		int total = lostItemDAO.lostListCount();
		//원하는 만큼의 데이터구하기
		List<LostItemDTO> content = lostItemDAO.lostList((pageNo-1)*size,size);
		
		
		
		return new LostItemListDTO(total, pageNo, size, content);
	}

	@Override
	public LostItemDTO lostListDetail(int lost_id) throws Exception {
		LostItemDTO lostItemDTO = lostItemDAO.lostListDetail(lost_id);
		return lostItemDTO;
	}

	@Override
	public void lostListwrite(Map map) throws Exception {
		lostItemDAO.lostListwrite(map);
	}

	@Override
	public List<LostItemDTO> isAnser(int member_id) throws Exception {
		List<LostItemDTO> lostItemDTOList = lostItemDAO.isAnser(member_id);
		return lostItemDTOList;
	}

	@Override
	public void lostAnserFin(int lost_id) throws Exception {
		lostItemDAO.lostAnserFin(lost_id);
	}

}
