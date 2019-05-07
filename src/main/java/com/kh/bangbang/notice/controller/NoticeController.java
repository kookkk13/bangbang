package com.kh.bangbang.notice.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.bangbang.notice.model.service.NoticeService;
import com.kh.bangbang.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping("nlist.do")
	public String noticeListMethod(Model model, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int limit = 10;
		int listCount = noticeService.listCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Notice> noticeList = noticeService.selectNoticeList(map);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("nwrite.do")
	public String noticeWriteMethod() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
	public String insertNoticeMethod(Model model, Notice notice) {
		int result = noticeService.insertNotice(notice);
		model.addAttribute("notice", notice);
		return "redirect:/adminNlist.do";
	}
	
	@RequestMapping("nupdateview.do")
	public String updateViewNoticeMethod(int notice_no, Model model) {
		Notice notice = noticeService.selectNotice(notice_no);
		model.addAttribute("notice", notice);
		return "notice/noticeModify";
	}
	
	@RequestMapping("nupdate.do")
	public String updateNoticeMethod(Notice notice) {
		int result = noticeService.updateNotice(notice);
		if(result > 0) {
			return "redirect:/adminNlist.do";
		}else {
			return "common/error";
		}
		
	}
	
	@RequestMapping("ndelete.do")
	public String deleteNoticeMethod(int notice_no) {
		int result = noticeService.deleteNotice(notice_no);
		return "redirect:/adminNlist.do";
	}
	
	@RequestMapping("adminNlist.do")
	public String noticeAdminListMethod(Model model, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int limit = 10;
		int listCount = noticeService.listCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Notice> noticeList = noticeService.selectNoticeList(map);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminNoticeList";
	}
	
	@RequestMapping("adminNSearch.do")
	public String searchAdminListMethod(Model model, String keyField, String keyWord, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int limit = 10;
		int listCount = noticeService.listCountS(keyField, keyWord);
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Notice> list = noticeService.selectNoticeSearch(keyField, keyWord, map);
		model.addAttribute("noticeList", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("keyField", keyField);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminNoticeList";
	}
	
}
