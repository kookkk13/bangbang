package com.kh.bangbang.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.member.model.dao.MemberDao;
import com.kh.bangbang.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImp implements MemberService{
	
	@Autowired
    private MemberDao memberDao;
	   
	@Override
	public Member loginCheck(Member member) {
		return memberDao.loginCheck(member);
	}
	
	@Override
	public int memberDel(String id) {
		return memberDao.memberDel(id);
	}
	
	@Override
	public int memberInsert(Member member) {
		return memberDao.memberInsert(member);
	}

	@Override
	public int updatePwd(Member member) {
		return memberDao.updatePwd(member);
	}
	   
	@Override
	public Member idCheck(Member member) {
	    return memberDao.idCheck(member);
	}
	
	@Override
	public int adminUserDelte(String id) {
	    return memberDao.adminUserDelte(id);
	}
	
	@Override
	public int adminUserDelteUndo(String id) {
	    return memberDao.adminUserDelteUndo(id);
	}

}
