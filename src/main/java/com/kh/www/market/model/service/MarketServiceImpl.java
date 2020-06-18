package com.kh.www.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.market.model.dao.MarketDAO;
import com.kh.www.market.model.vo.Market;

@Service("marketService")
public class MarketServiceImpl implements MarketService {

	@Autowired
	private MarketDAO marketDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return marketDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Market> selectList(PageInfo pi) {
		return marketDAO.selectList(sqlSession, pi);
	}

	@Override
	public int writingMarket(Market m) {
		return marketDAO.writingMarket(sqlSession, m);
	}

	@Override
	public int insertBoard(Market m) {
		return marketDAO.insertBoard(sqlSession, m);
	}

	@Override
	public int insertFile(String renameFileName) {
		return marketDAO.insertFile(sqlSession, renameFileName);
	}

	@Override
	public Market selectMarketList(int boardNo) {
		
		Market ma = null;
		int result = marketDAO.upCount(sqlSession, boardNo);
		
		if(result > 0) {
			ma = marketDAO.selectMarketList(sqlSession, boardNo);
		}
		return ma;
	}

	@Override
	public int deleteMarket(int boardNo) {
		return marketDAO.deleteMarket(sqlSession, boardNo);
	}

	@Override
	public Market selectUpdateMarket(int boardNo) {
		return marketDAO.selectUpdateMarket(sqlSession, boardNo);
	}

	@Override
	public int updateMarket(Market ma) {
		return marketDAO.updateMarket(sqlSession, ma);
	}

	@Override
	public int updatePrice(Market ma) {
		return marketDAO.updatePrice(sqlSession, ma);
	}

}
