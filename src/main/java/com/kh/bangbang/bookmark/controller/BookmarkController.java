package com.kh.bangbang.bookmark.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.bangbang.bookmark.model.service.BookmarkService;
import com.kh.bangbang.bookmark.model.vo.Bookmark;
import com.kh.bangbang.member.model.vo.Member;

@Controller
public class BookmarkController {

	private static final Logger logger = LoggerFactory.getLogger(BookmarkController.class);
	
	@Autowired
	private BookmarkService bookmarkService;
	
	@RequestMapping(value="addBookmark.do", method=RequestMethod.POST)
	public void addBookmark(Bookmark bookmark,HttpSession session, HttpServletResponse response) throws IOException {
		Member loginMember = (Member)session.getAttribute("loginMember");
		bookmark.setUser_id(loginMember.getId());
		PrintWriter out = response.getWriter();
		if(bookmarkService.checkBookmark(bookmark)==0) {	
			if(bookmarkService.addBookmark(bookmark)==1) {
				out.append("ok");
				out.flush();
			}else {
				out.append("fail");
				out.flush();
			}
		}else {
			out.append("redo");
			out.flush();
		}
		out.close();	
	}
	
	@RequestMapping(value="delBookmark.do", method=RequestMethod.POST)
	public void delBookmark(Bookmark bookmark, HttpSession session, HttpServletResponse response) throws IOException {
		Member loginMember = (Member)session.getAttribute("loginMember");
		bookmark.setUser_id(loginMember.getId());
		PrintWriter out = response.getWriter();
		if(bookmarkService.checkBookmark(bookmark)==1) {
			if(bookmarkService.delBookmark(bookmark)==1) {
				out.append("ok");
				out.flush();
			} else {
				out.append("redo");
				out.flush();
			}
		} else {
			out.append("redo");
			out.flush();
		}
		out.close();
	}
}
