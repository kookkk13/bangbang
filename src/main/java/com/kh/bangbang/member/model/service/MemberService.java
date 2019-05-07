package com.kh.bangbang.member.model.service;

import com.kh.bangbang.member.model.vo.Member;

public interface MemberService {
	
	Member loginCheck(Member member);
	
	int memberDel(String id);
	
	int memberInsert(Member member);
	
	int updatePwd(Member member);
	
	Member idCheck(Member member);
	
	int adminUserDelte(String id);
	
	int adminUserDelteUndo(String id);
}
