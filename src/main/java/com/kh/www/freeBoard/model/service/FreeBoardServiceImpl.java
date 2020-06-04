package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.dao.FreeBoardDAO;
import com.kh.www.freeBoard.model.vo.FreeBoard;

@Service("freeService")
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardDAO fDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBoard(FreeBoard fb) {
		return fDAO.insertBoard(sqlSession, fb);
	}

	@Override
	public int getListCount() {

		return fDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<FreeBoard> selectList(PageInfo pi) {
		return fDAO.selectList(sqlSession, pi);
	}

}