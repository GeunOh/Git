package com.kh.www.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.club.model.dao.ClubDAO;
import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.Comment;
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

	@Override
	public int insertClub(Club c) {
		return cDAO.insertClub(sqlSession, c);
	}

	@Override
	public int insertBoard(String writer) {
		return cDAO.insertBoard(sqlSession, writer);
	}

	@Override
	public int insertFile(String renameFileName) {
		return cDAO.insertFile(sqlSession, renameFileName);
	}

	@Override
	public int deleteClub(Integer boardNo) {
		return cDAO.deleteClub(sqlSession, boardNo);
	}

	@Override
	public Club selectClub(String clubName) {
		return cDAO.selectClub(sqlSession, clubName);
	}

	@Override
	public int insertClubMember(HashMap m) {
		return cDAO.insertClubMember(sqlSession, m);
	}

	@Override
	public int insertComment(Comment c) {
		return cDAO.insertComment(sqlSession, c);
	}

	@Override
	public ArrayList<Comment> selectComment(int boardNo) {
		return cDAO.selectComment(sqlSession, boardNo);
	}

	@Override
	public int updateClub(Club c) {
		return cDAO.updateClub(sqlSession, c);
	}

	@Override
	public int checkClubMember(HashMap m) {
		return cDAO.checkClubMember(sqlSession, m);
	}

	@Override
	public int deleteClubMember(HashMap m) {
		return cDAO.deleteClubMember(sqlSession, m);
	}




}
