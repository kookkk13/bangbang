package com.kh.bangbang.bookmark.model.service;

import com.kh.bangbang.bookmark.model.vo.Bookmark;

public interface BookmarkService {

	int addBookmark(Bookmark bookmark);

	int checkBookmark(Bookmark bookmark);

	int delBookmark(Bookmark bookmark);

}
