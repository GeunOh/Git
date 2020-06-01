package com.kh.www.club.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.club.model.dao.ClubDAO;
import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.PageInfo;

@Service("cService")
public class ClubServiceImpl implements ClubService {
	
	@Autowired
	private ClubDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return cDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Club> selectList(PageInfo pi) {
		return cDAO.selectList(sqlSession, pi);
	}

}
