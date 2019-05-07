package com.kh.bangbang.qna.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.notice.model.vo.Notice;
import com.kh.bangbang.qna.model.dao.QNADao;
import com.kh.bangbang.qna.model.vo.QNA;

@Service("qnaService")
public class QNAServiceImpl implements QNAService{
	@Autowired
	private QNADao qnaDao; 

	@Override
	public List<QNA> selectQNAList(HashMap<String, Object> map) {
		return qnaDao.selectQNAList(map);
	}

	@Override
	public int insertQNA(QNA qna) {
		return qnaDao.insertQNA(qna);
	}

	@Override
	public int updateQNA(QNA qna) {
		return qnaDao.updateQNA(qna);
	}

	@Override
	public int deleteQNA(int qna_no) {
		return qnaDao.deleteQNA(qna_no);
	}

	@Override
	public QNA selectQNA(int qna_no) {
		return qnaDao.selectQNA(qna_no);
	}

	@Override
	public int listCount(String id) {
		return qnaDao.listCount(id);
	}

	@Override
	public int listCountAdmin() {
		return qnaDao.listCountAdmin();
	}

	@Override
	public List<QNA> selectQNAAdminList(HashMap<String, Object> map) {
		return qnaDao.selectQNAAdminList(map);
	}

	@Override
	public int updateAdminQNA(QNA qna) {
		return qnaDao.updateAdminQNA(qna);
	}

	@Override
	public int listCountSearch(String keyField, String keyWord) {
		return qnaDao.listCountSearch(keyField, keyWord);
	}
	
	

	@Override
	public List<QNA> selectQNASearch(String keyField, String keyWord, HashMap<String, Object> map) {
		return qnaDao.selectQNASearch(keyField, keyWord, map);
	}
}
