package com.kh.www.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.www.club.model.vo.Club;
import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.Comment2;
import com.kh.www.common.model.vo.PageInfo;

public interface ClubService {

	int getListCount();

	ArrayList<Club> selectList(PageInfo pi);

	int insertClub(Club c);

	int insertBoard(String writer);

	int insertFile(String renameFileName);

	int deleteClub(Integer boardNo);

	Club selectClub(String clubName);

	int insertClubMember(HashMap m);

	int insertComment(Comment c);

	ArrayList<Comment> selectComment(int boardNo);

	int updateClub(Club c);

	int checkClubMember(HashMap m);

	int deleteClubMember(HashMap m);

	int updateComment(Comment c);

	int deleteComment(int rNo);

	ArrayList<Comment2> selectComment2();

	int insertComment2(Comment2 c);

	ArrayList<Comment2> selectComment2(int rNo);

	int deleteComment3(int rrNo);

	int updateComment2(Comment2 c);
}
