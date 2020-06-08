package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.Comment;
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

	@Override
	public FreeBoard selectFreeBoard(int boardNo) {
		
		FreeBoard fb = null;
		int result = fDAO.addReadCount(sqlSession, boardNo);
		
		if(result > 0) {
			fb = fDAO.selectFreeBoard(sqlSession, boardNo); 
		}
		return fb;
	}

	@Override
	public int deleteFree(int boardNo) {
		return fDAO.deleteFree(sqlSession, boardNo);
	}

	@Override
	public ArrayList<Comment> selectRList(int boardNo) {
		return fDAO.selectRList(sqlSession, boardNo);
	}

}
