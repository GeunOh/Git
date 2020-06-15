package com.kh.www.freeBoard.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.www.common.model.vo.Comment;
import com.kh.www.common.model.vo.PageInfo;
import com.kh.www.freeBoard.model.vo.FreeBoard;

public interface FreeBoardService {

	int insertBoard(FreeBoard fb);

	int getListCount(String aptName);

	ArrayList<FreeBoard> selectList(PageInfo pi, String aptName);

	FreeBoard selectFreeBoard(int boardNo);

	int deleteFree(int boardNo);

	ArrayList<Comment> selectRList(int boardNo);

	int insertReply(Comment c);

	FreeBoard selectUpdateFreeBoard(int boardNo);

	int updateFreeBoard(FreeBoard fb);

	int updateFreeFile(FreeBoard fb);

	int commentModify(Comment comment);
	
}
