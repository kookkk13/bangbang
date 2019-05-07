package com.kh.bangbang.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public Member loginCheck(Member member) {
		Member loginMember= mybatisSession.selectOne("memberMapper.selectLogin",member);
		
//		if(!member.getPwd().equals(loginMember.getPwd()))
//			loginMember = null;
		if (loginMember != null) {
			if(!bcryptPasswordEncoder.matches(member.getPwd(), loginMember.getPwd())) {
				loginMember = null;
			}
		}
		
		return loginMember;
	}

	public int memberDel(String id) {
		return mybatisSession.update("memberMapper.memberDel", id);
	}

	public int memberInsert(Member member) {
		return mybatisSession.insert("memberMapper.memberInsert", member);
	}

	public int updatePwd(Member member) {
		return mybatisSession.update("memberMapper.updatePwd", member);
	}
	
	public Member idCheck(Member member) {
		return mybatisSession.selectOne("memberMapper.idCheck", member);
	}

	public int adminUserDelte(String id) {
		return mybatisSession.update("memberMapper.adminUserDelte", id);
	}

	public int adminUserDelteUndo(String id) {
		return mybatisSession.update("memberMapper.adminUserDelteUndo", id);
	}
}
