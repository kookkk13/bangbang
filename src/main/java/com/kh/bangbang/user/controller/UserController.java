package com.kh.bangbang.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.bangbang.member.model.service.MemberService;
import com.kh.bangbang.member.model.vo.Member;
import com.kh.bangbang.user.model.service.UserService;
import com.kh.bangbang.user.model.vo.User;

import net.sf.json.JSONArray;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MemberService memberService;
	
	//유저 마이페이지
	@RequestMapping("userMyPage.do")
	public String moveUserMyPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		User user = userService.selectUser(id);
		model.addAttribute("user", user);
		return "user/userMyPage";
	}
	
	//유저 업데이트 페이지
	@RequestMapping("userUpdatePage.do")
	public String userUpdateMyPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		User user = userService.selectUser(id);
		model.addAttribute("user", user);
		return "user/userUpdatePage";
	}
	
	//유저 가입 페이지
	@RequestMapping("userJoin.do")
	public String userJoin() {
		return "user/userJoin";
	}
	
	//유저 가입 처리
	@RequestMapping(value="userInsert.do", method=RequestMethod.POST)
	public String userInsert(User user, HttpServletRequest request) {
		
		//입력받은 변수에서 member에서 필요한 변수 추출
		Member member = new Member();
		member.setId(user.getUser_id());
		member.setPwd(bcryptPasswordEncoder.encode(user.getUser_pwd()));
		member.setType("개인");
		
		//member와 user1에 모두 입력 성공시 가입완료 페이지 
		if(memberService.memberInsert(member) ==1) {
			if(userService.userInsert(user)==1) {
				return "member/memberJoinEnd";
			}
		}
		return "common/error";	
	}
	
	//user업데이트 처리
	@RequestMapping(value="userUpdate.do", method=RequestMethod.POST)
	public String userUpdate(User user, HttpServletRequest request) {
		//업데이트 실패시 에러 페이지
		if(userService.userUpdate(user) !=1) {
			return "common/error";
		}
		
		return "user/userMyPage";
	}
	
	//관리자 페이지 리스트 처리
	@RequestMapping("adminUserList.do")
	public String adminUserList(Model model, HttpServletRequest request) {
		List<User> userList = userService.selectUserList();
		model.addAttribute("userList", userList);
		return "admin/user/adminUserList";
	}
	
	//관리자 페이지 유저 개인정보 수정
	@RequestMapping("adminUserUpdateView.do")
	public String userUpdateMyPage(Model model, String user_id) {		
		User user = userService.selectUser(user_id);
		model.addAttribute("user", user);
		return "/admin/user/adminUserUpdatePage";
	}
	
	@RequestMapping(value="adminUserUpdate.do", method=RequestMethod.POST)
	public String adminUserUpdate(User user, HttpServletRequest request) {
		//업데이트 실패시 에러 페이지
		if(userService.userUpdate(user) !=1) {
			return "common/error";
		}
		
		return "redirect:/adminUserList.do";
	}
	
	
	@RequestMapping(value="selectUserSearch.do", method=RequestMethod.POST/*, produces="application/json;charset=UTF-8"*/)
	public void selectSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String selectVal = request.getParameter("selectVal");
		String textVal = request.getParameter("textVal");
		String checkVal = request.getParameter("checkVal");
		
		String[] checkValArr = checkVal.split(",");
		
		Map option = new HashMap();
		option.put("selectVal", selectVal);
		option.put("textVal", textVal);
		
		for(int i = 0; i < checkValArr.length; i++) {
			option.put("checkVal" + i, checkValArr[i]);
		}
		option.put("count", checkValArr.length);
		
		List<User> userList = userService.selectSearch(option);
			
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(User user : userList) {
			JSONObject job = new JSONObject();
			job.put("user_id", user.getUser_id());
			job.put("user_name",user.getUser_name());
			job.put("user_email", user.getUser_email());
			job.put("user_phone", user.getUser_phone());
			job.put("state", user.getState());
			
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
		
	
	
	

}
