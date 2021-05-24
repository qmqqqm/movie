package com.movie.movie.lostitem.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.movie.movie.lostitem.dto.LostItemDTO;

@Repository("lostItemDAO")
public class LostItemDAOImpl implements LostItemDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void lostItemPro(LostItemDTO lostItemDTO) throws DataAccessException {
		sqlSession.insert("lost.lostPro",lostItemDTO);
	}

	@Override
	public int lostListCount() throws DataAccessException {
		int total = sqlSession.selectOne("lost.lostListCount");
		return total;
	}

	@Override
	public List<LostItemDTO> lostList(int startRow, int size) throws DataAccessException {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int start = startRow+1;
		int end = startRow+size;
		map.put("start",start);
		map.put("end",end);
		
		List<LostItemDTO> lostItemList = sqlSession.selectList("lost.lostListget", map);
		return lostItemList;
	}

	@Override
	public LostItemDTO lostListDetail(int lost_id) throws DataAccessException {
		LostItemDTO lostItemDTO = sqlSession.selectOne("lost.lostListDetail", lost_id);
		return lostItemDTO;
	}

	@Override
	public void lostListwrite(Map map) throws DataAccessException {
		sqlSession.update("lost.lostListwrite", map);
	}

	@Override
	public List<LostItemDTO> isAnser(int member_id) throws DataAccessException {
		List<LostItemDTO> lostItemDTOList =sqlSession.selectList("lost.isAnser", member_id);
		return lostItemDTOList;
	}

	@Override
	public void lostAnserFin(int lost_id) throws DataAccessException {
		sqlSession.update("lost.lostAnserFin", lost_id);
	}

}
