package com.kh.bangbang.bookmark.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.bookmark.model.dao.BookmarkDao;
import com.kh.bangbang.bookmark.model.vo.Bookmark; 
@Service("bookmarkService")
public class BookmarkServiceImpl implements BookmarkService{ 
	@Autowired
    private BookmarkDao bookmarkDao;
	


	@Override
	public int addBookmark(Bookmark bookmark) {
		
		return bookmarkDao.addBookmark(bookmark);
	}
	
	@Override
	public int checkBookmark(Bookmark bookmark) {
		
		return bookmarkDao.checkBookmark(bookmark);
	}

	@Override
	public int delBookmark(Bookmark bookmark) {
		return bookmarkDao.delBookmark(bookmark);
	}
	

}
