package com.kh.bangbang.scheduler.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.bangbang.common.model.vo.BaseResponse;
import com.kh.bangbang.company.model.service.CompanyService;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.scheduler.model.service.SchedulerService;
import com.kh.bangbang.scheduler.model.vo.Scheduler;
import com.kh.bangbang.scheduler.model.vo.SchedulerDeleteRequest;
import com.kh.bangbang.user.model.service.UserService;
import com.kh.bangbang.user.model.vo.User;

@Controller
public class SchedulerController {
	
	@Autowired
	private SchedulerService schedulerService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private UserService userService;
	
	//업체 관리 스케줄러
	@RequestMapping("companyAdminSchedulerPage.do")
	public String companyAdminSchedulerPage() {
		return "company/companyAdminScheduler";
	}
	
	//중개사 매물 스케줄러
	@RequestMapping("companySchedulerPage.do")
	public String companySchedulerPage(Model model, HttpServletRequest request) {
		String companyId = request.getParameter("id");
		String pro_no = request.getParameter("no");
		Company company = companyService.selectCompany(companyId);
		
		model.addAttribute("company", company);
		model.addAttribute("pro_no", pro_no);
		return "company/companyScheduler";
	}
	
	//개인 매물 관리 스케줄러
	@RequestMapping("userAdminSchedulerPage.do")
	public String userAdminSchedulerPage() {
		return "user/userAdminScheduler";
	}
	
	//개인 매물 스케줄러
	@RequestMapping("userSchedulerPage.do")
	public String userSchedulerPage(Model model, HttpServletRequest request) {
		String userId = request.getParameter("id");
		String pro_no = request.getParameter("no");
		User user = userService.selectUser(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("pro_no", pro_no);
		return "user/userScheduler";
	}
	
	@RequestMapping("selectScheduler.do")
	public void selectScheduler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String companyId = request.getParameter("id");
		
		List<Scheduler> schedulerList = schedulerService.selectScheduler(companyId);
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Scheduler scheduler : schedulerList) {
			JSONObject job = new JSONObject();
			job.put("book_no", scheduler.getBook_no());
			job.put("pro_no", scheduler.getPro_no());
			job.put("book_date", scheduler.getBook_date());
			job.put("com_id", scheduler.getCom_id());
			job.put("user_id", scheduler.getUser_id());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		response.setContentType("application/json");
		
		PrintWriter pw = response.getWriter();
		pw.print(sendJson.toJSONString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("selectMyScheduler.do")
	public void selectMyScheduler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String userId = request.getParameter("id");
		
		List<Scheduler> schedulerList = schedulerService.selectMyScheduler(userId);
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Scheduler scheduler : schedulerList) {
			JSONObject job = new JSONObject();
			job.put("book_no", scheduler.getBook_no());
			job.put("pro_no", scheduler.getPro_no());
			job.put("book_date", scheduler.getBook_date());
			job.put("com_id", scheduler.getCom_id());
			job.put("com_name", scheduler.getCom_name());
			job.put("com_phone", scheduler.getCom_phone());
			job.put("deposit", scheduler.getDeposit());
			job.put("rent", scheduler.getRent());
			job.put("build_type", scheduler.getBuild_type());
			job.put("con_type", scheduler.getCon_type());
			
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
	
	@RequestMapping(value="insertScheduler.do", method=RequestMethod.POST)
	public void reservation(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		String book_date = year + "-" + month + "-" + day + " " + time + ":00";
		
		String pro_no = request.getParameter("pro_no");
		String user_id = request.getParameter("userid");
		String com_id = request.getParameter("id");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("book_date", book_date);
		map.put("user_id", user_id);
		map.put("pro_no", pro_no);
		map.put("com_id", com_id);
		
		int result = 0;
		int count = schedulerService.selectCount(map);
		
		if(count <= 0)
			result = schedulerService.insertScheduler(map);
	
		PrintWriter pw = response.getWriter();

		if(result > 0)
			pw.print("ok");
		else if(count > 0)
			pw.print("no");
		else 
			pw.print("fail");	
		
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="deleteScheduler2.do", method=RequestMethod.POST)
	public void deleteScheduler(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int book_no = Integer.parseInt(request.getParameter("book_no"));
		
		int result = schedulerService.deleteScheduler2(book_no);
		
		PrintWriter pw = response.getWriter();

		if(result > 0) 
			pw.print("ok");
		else 
			pw.print("fail");	
		
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="deleteScheduler.do", method=RequestMethod.POST)
	public @ResponseBody BaseResponse deleteScheduler(HttpServletRequest request, HttpServletResponse response
			, @RequestBody SchedulerDeleteRequest reqDto) throws IOException, SQLException {
		
		
		return schedulerService.deleteScheduler(Integer.valueOf(reqDto.getBookNo()));
//		return schedulerService.deleteScheduler(Integer.valueOf(reqDto.getBookNo()));
	}

	@RequestMapping(value="selectInfo.do", method=RequestMethod.POST)
	public void selectInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_id = request.getParameter("strid");
		
		User user = userService.selectUser(user_id);
		
		response.setContentType("text/html; charset=utf-8");
		JSONObject job = new JSONObject();
		
		if(user != null) {
			job.put("name", user.getUser_name());
			job.put("email", user.getUser_email());
			job.put("phone", user.getUser_phone());
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(job.toJSONString());
		pw.flush();
		pw.close();
	}
	
	
	
}
