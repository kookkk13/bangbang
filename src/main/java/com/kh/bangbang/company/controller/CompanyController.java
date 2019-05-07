package com.kh.bangbang.company.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.bangbang.company.model.service.CompanyService;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.member.model.service.MemberService;
import com.kh.bangbang.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class CompanyController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("companyMyPage.do")
	public String companyMyPage(Model model, HttpSession session) {
		String MemberId = ((Member)session.getAttribute("loginMember")).getId();
		
		Company company = companyService.selectCompany(MemberId);
		model.addAttribute("company", company);
		
		return "company/companyMyPage";
	}
	
	@RequestMapping("insertCompanyPage.do")
	public String insertCompanyPage() {
		return "company/insertCompany";
	}
	
	@RequestMapping(value="insertCompany.do", method=RequestMethod.POST)
	public String insertCompany(Company company, HttpServletRequest request) {
		Member member = new Member();
		member.setId(company.getCom_id());
		member.setPwd(bcryptPasswordEncoder.encode(company.getCom_pwd()));
		member.setType("업체");
		
		int result1 = memberService.memberInsert(member);
		int result2 = companyService.insertCompany(company);

		if(result1 + result2 == 2)
			return "member/memberJoinEnd";
		else
			return "common/error";
	}
	
	@RequestMapping("updateCompanyPage.do")
	public String updateCompanyPage(Model model, HttpSession session) {
		String MemberId = ((Member)session.getAttribute("loginMember")).getId();
		
		Company company = companyService.selectCompany(MemberId);
		model.addAttribute("company", company);
		return "company/updateCompany";
	}
	
	@RequestMapping("updateCompany.do")
	public String updateCompany(Company company, Model model) {
		int result = companyService.updateCompany(company);
		System.out.println(company);
		
		if(result > 0)
			return "company/companyMyPage";
		else
			return "common/error";
	}
	
	//관리자 페이지
	
	@RequestMapping("adminComList.do")
	public String selectAllCompany(Model model) {
		List<Company> companyList = companyService.selectAllCompany();
		model.addAttribute("companyList", companyList);
		
		return "admin/adminCompanyList";
	}
	
	@RequestMapping(value="selectCompanySearch.do", method=RequestMethod.POST/*, produces="application/json;charset=UTF-8"*/)
	public void selectSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String selectVal = request.getParameter("selectVal");
		String textVal = request.getParameter("textVal");
		String checkVal = request.getParameter("checkVal");
		
		String[] checkValArr = checkVal.split(",");
		
		Map<String, String> option = new HashMap<String, String>();
		option.put("selectVal", selectVal);
		option.put("textVal", textVal);
		
		for(int i = 0; i < checkValArr.length; i++) {
			option.put("checkVal" + i, checkValArr[i]);
		}
		option.put("count", String.valueOf(checkValArr.length));
		
		List<Company> companyList = companyService.selectSearch(option);
			
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Company company : companyList) {
			JSONObject job = new JSONObject();
			job.put("com_id", company.getCom_id());
			job.put("com_name", company.getCom_name());
			job.put("com_ceo", company.getCom_ceo());
			job.put("com_no", company.getCom_no());
			job.put("brokers_no", company.getBrokers_no());
			job.put("brokers_address", company.getBrokers_address());
			job.put("com_phone", company.getCom_phone());
			job.put("com_content", company.getCom_content());
			job.put("com_email", company.getCom_email());
			job.put("state", company.getState());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter pw = response.getWriter();
		pw.print(sendJson.toJSONString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("updateCompanyAdminPage.do")
	public String updateCompanyAdminPage(Model model, String com_id, HttpServletRequest request) {
		Company company = companyService.selectCompany(com_id);
		model.addAttribute("company", company);
		return "admin/adminUpdateCompany";
	}
	
	@RequestMapping(value="updateCompanyAdmin.do", method=RequestMethod.POST)
	public String updateCompanyAdmin(Company company, Model model, HttpServletResponse response) throws IOException {
		int result = companyService.updateCompany(company);
		
		if(result > 0) {
			List<Company> companyList = companyService.selectAllCompany();
			model.addAttribute("companyList", companyList);
			model.addAttribute("msg", "회원 정보 수정이 완료되었습니다.");
			
			return "admin/adminCompanyList";
		}else {
			return "common/error";
		}
	}
	
}
