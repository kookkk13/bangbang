package com.kh.bangbang.user.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.user.model.dao.UserDao;
import com.kh.bangbang.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public User loginCheck(String memberId) {	
		UserDao userDao = new UserDao();
		return userDao.loginCheck(memberId);
	}
	
	@Override
	public User selectUser(String id) {
		return userDao.selectUser(id);
	}
	
	@Override
	public int userInsert(User user) {
		return userDao.userInsert(user);
	}
	
	@Override
	public int userUpdate(User user) {
		return userDao.userUpdate(user);
	}
	
	@Override
	public int userListCount() {
		return userDao.userListCount();
	}
	
	@Override
	public List<User> selectUserList(){
		return userDao.selectUserList();
	}
	
	@Override
	public List<User> selectSearch(Map option){
		return userDao.selectSearch(option);
	}

	@Override
	public int selectProCount(String id) {
		return userDao.selectProCount(id);
	}

}
