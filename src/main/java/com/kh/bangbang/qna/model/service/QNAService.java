package com.kh.bangbang.qna.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.bangbang.notice.model.vo.Notice;
import com.kh.bangbang.qna.model.vo.QNA;

public interface QNAService {
	List<QNA> selectQNAList(HashMap<String, Object> map);
	List<QNA> selectQNAAdminList(HashMap<String, Object> map);
	QNA selectQNA(int qna_no);
	int insertQNA(QNA qna);
	int updateQNA(QNA qna);
	int updateAdminQNA(QNA qna);
	int deleteQNA(int qna_no);
	int listCount(String id);
	int listCountAdmin();
	int listCountSearch(String keyField, String keyWord);
	List<QNA> selectQNASearch(String keyField, String keyWord, HashMap<String, Object> map);
}
