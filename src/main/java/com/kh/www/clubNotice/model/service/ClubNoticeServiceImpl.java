package com.kh.www.clubNotice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.www.Notice.model.vo.Notice;
import com.kh.www.clubNotice.model.dao.CNoticeDAO;
import com.kh.www.clubNotice.model.vo.ClubNotice;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;
import com.sun.xml.internal.bind.v2.runtime.NameList;

@Service("cnService")
public class ClubNoticeServiceImpl implements ClubNoticeService {
	
	@Autowired
	private CNoticeDAO cnDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override //동호회 공지사항 전체 리스트 갯수 가져오기
	public int getCNoticeListCount(String aptName) {
		return cnDAO.getCNoticeListCount(sqlSession, aptName);
	}
	
	@Override //동호회 공지사항 리스트 페이지 가져오기
	public ArrayList<ClubNotice> selectList(PageInfo pi, String aptName) {
		return cnDAO.selectList(sqlSession, pi, aptName);
	}
	
	@Override //동호회 공지사항 작성
	public int insertNotice(ClubNotice cn) {
		return cnDAO.insertNotice(sqlSession, cn);
	}

	@Override //동호회-이름목록 받아오기
	public ArrayList<String[]> selectcNamelist(String aptName) {
		return cnDAO.selectcNamelist(sqlSession, aptName);
	}
	
	@Override //동호회-공지사항 상세조회
	public ClubNotice selectclubNotice(int cnNo) {
		ClubNotice cn = null;
		
		//조회수 증가 체크하기
		int result = cnDAO.addReadCount(sqlSession, cnNo);
		
		if(result > 0) { //공지사항 상세조회
			cn = cnDAO.selectNotice(sqlSession, cnNo);
		}
		return cn;
	}
	
	@Override //동호회-공지사항 수정하기 폼으로 이동 - 수정할 글 상세조회
	public ClubNotice selectUpdateClubNotice(int cnNo) {
		return cnDAO.selectNotice(sqlSession, cnNo);
	}
	
	//동호회-공지사항 업데이트 - 파일만 업데이트(파일테이블)
	@Override
	public int updateClubNotice_File(ClubNotice cn) {
		return cnDAO.updateClubNotice_File(sqlSession, cn);
	}
	//동호회-공지사항 업데이트 - 글만 업데이트(노티스테이블)
	@Override
	public int updateClubNotice_Content(ClubNotice cn) {
		return cnDAO.updateClubNotice_Content(sqlSession, cn);
	}
	
	//공지사항 업데이트 - 클럽명만 업데이트(클럽노티스 테이블)
	@Override
	public int updateClubNotice_Name(ClubNotice cn) {
		return cnDAO.updateClubNotice_Name(sqlSession, cn);
	}
	
	//동호회 공지사항 삭제
	@Override
	public int deleteClubNotice(int cnNo) {
		return cnDAO.deleteClubNotice(sqlSession, cnNo);
	}
	
	@Override //동호회 공지사항 검색키워드에 따른 전체 수 가져오기
	public int getSearchResultListCount(ClubNotice cn) {
		return  cnDAO.getSearchResultListCount(sqlSession, cn);
	}
	
	@Override //동호회 공지사항 검색한 리스트 가져오기
	public ArrayList<ClubNotice> selectSearchResultList(ClubNotice cn, PageInfo pi) {
		return cnDAO.selectSearchResultList(sqlSession, cn, pi);
	}
	
	@Override //동호회 공지사항 정렬 리스트 가져오기
	public ArrayList<ClubNotice> selectSortCondition(HashMap map) {
		return cnDAO.selectSortCondition(sqlSession, map);
	}
	@Override //댓글등록
	public int insertNoticeComment(Comment nc) {
		return cnDAO.insertNoticeComment(sqlSession, nc);
	}
	
//	@Override //댓글리스트 가져오기
//	public ArrayList<Comment> noticeCommentList(int cnNo) {
//		return cnDAO.NoticeCommentList(sqlSession, cnNo);
//	}
//	
//	@Override //댓글 수정
//	public int commentUpdate(Comment comment) {
//		return cnDAO.commentUpdate(sqlSession, comment);
//	}
//	
//	@Override //댓글 삭제
//	public int commentUpdate(int rNo) {
//		return cnDAO.commentUpdate(sqlSession, rNo);
//	}
	
	@Override
	public ArrayList<Comment> selectComment(int cnNo) {
		return cnDAO.selectComment(sqlSession, cnNo);
	}
	
	@Override
	public ArrayList<Comment2> selectComment2() {
		return cnDAO.selectComment2(sqlSession);
	}
	
	@Override
	public int commentUpdate(Comment c) {
		return cnDAO.updateComment(sqlSession, c);
	}
	
	@Override
	public int deleteComment(int rNo) {
		return cnDAO.deleteComment(sqlSession, rNo);
	}
	
	@Override
	public int insertComment2(Comment2 c) {
		return cnDAO.insertComment2(sqlSession, c);
	}
	
	@Override
	public ArrayList<Comment2> selectComment2(int rNo) {
		return cnDAO.selectComment2(sqlSession, rNo);
	}
}

