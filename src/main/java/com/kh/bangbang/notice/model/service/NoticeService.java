package com.kh.bangbang.notice.model.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bangbang.notice.model.vo.Notice;
public interface NoticeService {
	List<Notice> selectNoticeList(HashMap<String, Object> map);
	Notice selectNotice(int notice_no);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int notice_no);
	int listCount();
	int listCountS(String keyField, String keyWord);
	List<Notice> selectNoticeSearch(String keyField, String keyWord, HashMap<String, Object> map);
}
