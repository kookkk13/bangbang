package com.kh.bangbang.notice.model.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate session; //DB 연결
	
	public List<Notice> selectNoticeList(HashMap<String, Object> map) {
		return session.selectList("noticeMapper.selectList", map);
	}

	public int insertNotice(Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}

	public int deleteNotice(int notice_no) {
		return session.delete("noticeMapper.deleteNotice", notice_no);
	}

	public int updateNotice(Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}

	public Notice selectNotice(int notice_no) {
		return session.selectOne("noticeMapper.selectNotice", notice_no);
	}

	public int listCount() {
		return session.selectOne("noticeMapper.listCount");
	}

	public List<Notice> selectNoticeSearch(String keyField, String keyWord, HashMap<String, Object> map) {
		
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "") {
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			return session.selectList("noticeMapper.selectSearch", map);
		} else {
			return session.selectList("noticeMapper.selectList");
		}
		
		
	}

	public int listCountS(String keyField, String keyWord) {
		
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "") {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyField", keyField);
		map.put("keyWord", keyWord);
		return session.selectOne("noticeMapper.listCountS", map);
		} else {
			return session.selectOne("noticeMapper.listCount");
		}
	}

	
}
