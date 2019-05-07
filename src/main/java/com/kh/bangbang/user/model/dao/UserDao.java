package com.kh.bangbang.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	@Autowired
	private BCryptPasswordEncoder bpEncoder;

	public User loginCheck(String memberId) {
		return mybatisSession.selectOne("userMapper.selectLogin", memberId);
	}

	public User selectUser(String user_id) {
		return mybatisSession.selectOne("userMapper.selectUser", user_id);
	}

	public int userInsert(User user) {
		
		return mybatisSession.insert("userMapper.userInsert", user);
	}

	public int userUpdate(User user) {
		return mybatisSession.update("userMapper.userUpdate", user);
	}

	public int userListCount() {
		return mybatisSession.selectOne("userMapper.userListCount");
	}

	public List<User> selectUserList() {
		return mybatisSession.selectList("userMapper.selectUserList");
	}

	public List<User> selectSearch(Map option) {	
		return mybatisSession.selectList("userMapper.selectSearch", option);
	}

	public int selectProCount(String id) {
		return mybatisSession.selectOne("userMapper.selectProCount", id);
	}
}
