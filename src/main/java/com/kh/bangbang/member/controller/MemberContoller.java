package com.kh.bangbang.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.MessagingException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.bangbang.company.model.service.CompanyService;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.member.model.service.MemberService;
import com.kh.bangbang.member.model.service.SendMail;
import com.kh.bangbang.member.model.vo.Member;
import com.kh.bangbang.user.model.service.UserService;
import com.kh.bangbang.user.model.vo.User;

@Controller
public class MemberContoller {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberContoller.class);
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("loginpage.do")
	public String moveMemberLogin() {
		return "member/login";
	}
	
	@RequestMapping("passfindpage.do")
	public String passFindPage() {
		return "member/memberPassFind";
	}
	
	//로그인 처리
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginCheck(Member member, HttpSession session, SessionStatus status, Model model) {
		
		if(member.getId().equals("admin") && member.getPwd().equals("admin")) {
			session.setAttribute("loginMember", member);
//			status.setComplete();
			return "home";
		}
		
		Member loginMember = memberService.loginCheck(member);
		
		if(loginMember != null) {
			if(!loginMember.getState().equals("탈퇴") && !loginMember.getState().equals("제재")) {
				if(loginMember.getType().equals("개인")) {
					session.setAttribute("loginMember", loginMember);	
					loginMember.setCount(userService.selectProCount(loginMember.getId()));
				}else {
					session.setAttribute("loginMember", loginMember);	
				}
//				status.setComplete();
				return "home";
			}else if(loginMember.getState().equals("제재")) {
		        model.addAttribute("msg", "제재 조치되어 로그인이 제한됩니다.");
		        status.setComplete();
			}else {
		        model.addAttribute("msg", "일치하는 회원정보가 없습니다. 아이디 혹은 비밀번호를 확인해주세요.");
		        status.setComplete();
			}
		}else if (loginMember == null){
	        model.addAttribute("msg", "일치하는 회원정보가 없습니다. 아이디 혹은 비밀번호를 확인해주세요.");
			status.setComplete();
		}
		return "member/login";
	}
	
	@RequestMapping("logout.do")
    public String logoutMethod(HttpServletRequest request) {
       HttpSession session = request.getSession(false);
       
       if(session != null)
          session.invalidate();
       
       return "home";
    }
	
	@RequestMapping("memberDel.do")
    public String memberDelMethod(HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		int result = memberService.memberDel(loginMember.getId());
		
		if(result == 1) {
			session.invalidate();
			return "home";
		}else {   
			return "common/error";
		}
    }
	
	@RequestMapping("findPwdPage.do")
	public String findPwdPage() {
		return "member/findPwd";
	}
	
	@RequestMapping(value="findPwd.do", method=RequestMethod.POST)
	public void selectEmail(Member member, HttpServletResponse response) throws IOException{
		String id = member.getId();

		User user = null;
		Company company = null;
		
		if(member.getType().equals("개인"))
			user = userService.selectUser(id);
		else
			company = companyService.selectCompany(id);
		
		response.setContentType("text/html; charset=utf-8");
		JSONObject job = new JSONObject();
		
		if(user != null) {
			job.put("id", user.getUser_id());
			job.put("email", user.getUser_email());
		}else if(company != null){
			job.put("id", company.getCom_id());
			job.put("email", company.getCom_email());
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(job.toJSONString());
		pw.flush();
		pw.close();
	}
	
	@RequestMapping(value="sendMail.do", method=RequestMethod.POST)
	public void sendMail(Member member, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, MessagingException {
		request.getAttribute("email");
		
		SendMail send = new SendMail(member.getEmail());
		String uuid = send.sendEmail();
		
		member.setPwd(bcryptPasswordEncoder.encode(uuid));
		int result = memberService.updatePwd(member);
		 
		PrintWriter pw = response.getWriter();
		
		if(uuid != "" && result > 0) 
			pw.append("ok");
		else 
			pw.append("fail");
		
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("updatePwdPage.do")
	public String updatePwdPage() {
		return "member/updatePwd";
	}
	
	@RequestMapping(value="updatePwd.do", method=RequestMethod.POST)
	public String updatePwd(Member member, HttpSession session, Model model) {
		member.setPwd(bcryptPasswordEncoder.encode(member.getPwd()));
		int result = memberService.updatePwd(member);
		
		if(result == 1) {
			session.invalidate();
			model.addAttribute("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인 해 주세요.");
			return "member/login";
		}else {
			return "common/error";	
		}
	}
	
	@RequestMapping("memberJoinMainPage.do")
	public String memberJoinMainPage() {
		return "member/memberJoinMain";
	}
	
	//가입시 아이디 체크
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public void idCheck(Member member, HttpServletResponse response) throws IOException{
		PrintWriter out = response.getWriter();
		Member idcheck = memberService.idCheck(member);
		
		if(idcheck == null) 
			out.append("ok");
		else 
			out.append("fail");
			
		out.flush();
		out.close();
	}
	
	//관리자 로그인 제한
	@RequestMapping("adminUserDelte.do")
    public String adminMemberDelte(Model model, String id) {	
		if(memberService.adminUserDelte(id) == 1) {
			List<User> userList = userService.selectUserList();
			model.addAttribute("userList", userList);
			return "admin/user/adminUserList";
		}else {
			return "common/error";
		}	
    }
	
	@RequestMapping("adminUserDelteUndo.do")
    public String adminMemberDelteUndo(Model model, String id) {	
		if(memberService.adminUserDelteUndo(id) == 1) {
			List<User> userList = userService.selectUserList();
			model.addAttribute("userList", userList);
			return "admin/user/adminUserList";
		}else {
			return "common/error";
		}	
    }
	
	@RequestMapping("adminComDelete.do")
    public String adminComDelte(Model model, String id) {	
		if(memberService.adminUserDelte(id) == 1) {
			List<Company> companyList = companyService.selectAllCompany();
			model.addAttribute("companyList", companyList);
			return "admin/adminCompanyList";
		}else {
			return "common/error";
		}	
    }
	
	@RequestMapping("adminComDeleteUndo.do")
    public String adminComDelteUndo(Model model, String id) {	
		if(memberService.adminUserDelteUndo(id) == 1) {
			List<Company> companyList = companyService.selectAllCompany();
			model.addAttribute("companyList", companyList);
			return "admin/adminCompanyList";
		}else {
			return "common/error";
		}	
    }
	
}
