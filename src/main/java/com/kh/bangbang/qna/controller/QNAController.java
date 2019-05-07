package com.kh.bangbang.qna.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.bangbang.notice.model.vo.Notice;
import com.kh.bangbang.qna.model.service.QNAService;
import com.kh.bangbang.qna.model.vo.QNA;

@Controller
public class QNAController {
	
	@Autowired
	private QNAService qnaService;
	
	@RequestMapping("qnalist.do")
	public String QNAListMethod(Model model, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		String id = request.getParameter("id");
		
		int limit = 10;
		int listCount = qnaService.listCount(id);
		
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
		map.put("id", id);
		
		List<QNA> qnaList = qnaService.selectQNAList(map);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "qna/qnaList";
	}
	
	@RequestMapping("qnawrite.do")
	public String QNAWriteMethod() {
		return "qna/qnaWrite";
	}
	
	@RequestMapping(value="qnainsert.do", method=RequestMethod.POST)
	public String insertQNAMethod(QNA qna, Model model, HttpServletRequest request) {
		int result = qnaService.insertQNA(qna);
		model.addAttribute("qna", qna);
		model.addAttribute("id", qna.getUser_id());
		return "redirect:/qnalist.do";
	}
	
	@RequestMapping("qnaupdateview.do")
	public String updateQNAViewMethod(Model model, int qna_no) {
		QNA qna = qnaService.selectQNA(qna_no);
		model.addAttribute("qna", qna);
		return "qna/qnaModify";
	}
	
	@RequestMapping("qnaanswerview.do")
	public String updateQNAAnswerViewMethod(Model model, int qna_no) {
		QNA qna = qnaService.selectQNA(qna_no);
		model.addAttribute("qna", qna);
		return "admin/qnaAnswer";
	}
	
	@RequestMapping("qnaupdate.do")
	public String updateQNAMethod(QNA qna, Model model) {
		int result = qnaService.updateQNA(qna);
		if(result > 0) {
			model.addAttribute("id", qna.getUser_id());
			return "redirect:/qnalist.do";
		}else {
			return "common/error";
		}
	}
	
	@RequestMapping("qnaadminupdate.do")
	public String updateQNAAdminMethod(QNA qna, Model model) {
		int result = qnaService.updateAdminQNA(qna);
		if(result > 0) {
			return "redirect:/adminQNAlist.do";
		}else {
			return "common/error";
		}
	}
	
	@RequestMapping("qnadelete.do")
	public String deleteQNAMethod(int qna_no, HttpServletRequest request, RedirectAttributes rb) {
		int result = qnaService.deleteQNA(qna_no);
		if(result > 0) {
			rb.addAttribute("id", request.getParameter("id"));
			return "redirect:/qnalist.do";
		}else {
			return "common/error";
		}
	}
	
	@RequestMapping("qnaadmindelete.do")
	public String deleteQNAAdminMethod(int qna_no, HttpServletRequest request) {
		int result = qnaService.deleteQNA(qna_no);
		if(result > 0) {
			return "redirect:/adminQNAlist.do";
		}else {
			return "common/error";
		}
	}
	
	@RequestMapping("adminQNAlist.do")
	public String AdminQNAListMethod(Model model, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int limit = 10;
		int listCount = qnaService.listCountAdmin();
		
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
		
		List<QNA> qnaList = qnaService.selectQNAAdminList(map);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminQNAList";
	}
	
	@RequestMapping("adminQNASearch.do")
	public String searchAdminListMethod(Model model, String keyField, String keyWord, HttpServletRequest request) {
		int currentPage = 1;
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		int limit = 10;
		int listCount = qnaService.listCountSearch(keyField, keyWord);
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
		
		List<QNA> list = qnaService.selectQNASearch(keyField, keyWord, map);
		model.addAttribute("qnaList", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("keyField", keyField);
		model.addAttribute("limit", limit);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("listCount", listCount);
		
		return "admin/adminQNAList";
	}
	
}
