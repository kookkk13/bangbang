package com.kh.bangbang.user.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bangbang.user.model.vo.User;

public interface UserService {

	User loginCheck(String memberId);

	User selectUser(String id);

	int userInsert(User user);

	int userUpdate(User user);

	int userListCount();

	List<User> selectUserList();

	List<User> selectSearch(Map option);

	int selectProCount(String id);

	

}
