package com.kh.bangbang.bookmark.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.bookmark.model.vo.Bookmark;

@Repository("bookmarkDao")
public class BookmarkDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;

	public int addBookmark(Bookmark bookmark) {
		return mybatisSession.insert("bookmarkMapper.addBookmark",bookmark);
	}
	
	public int checkBookmark(Bookmark bookmark) {
		return mybatisSession.selectOne("bookmarkMapper.checkBookmark",bookmark);
	}

	public int delBookmark(Bookmark bookmark) {
		return mybatisSession.delete("bookmarkMapper.delBookmark",bookmark);
	}
	

}
