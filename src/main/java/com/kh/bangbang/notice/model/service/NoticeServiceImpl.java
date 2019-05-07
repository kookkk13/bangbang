package com.kh.bangbang.notice.model.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.notice.model.dao.NoticeDao;
import com.kh.bangbang.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDao noticeDao; 
	
	@Override
	public List<Notice> selectNoticeList(HashMap<String, Object> map) {
		return noticeDao.selectNoticeList(map);
	}
	
	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public Notice selectNotice(int notice_no) {
		return noticeDao.selectNotice(notice_no);
	}

	@Override
	public int listCount() {
		return noticeDao.listCount();
	}

	@Override
	public List<Notice> selectNoticeSearch(String keyField, String keyWord, HashMap<String, Object> map) {
		return noticeDao.selectNoticeSearch(keyField, keyWord, map);
	}

	@Override
	public int listCountS(String keyField, String keyWord) {
		return noticeDao.listCountS(keyField, keyWord);
	}

}
