package com.kh.bangbang.scheduler.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.scheduler.model.vo.Scheduler;

@Repository("schedulerDao")
public class SchedulerDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession; //DB 연결

	public Date selectSchedule(HashMap<String, Object> map) {
		return mybatisSession.selectOne("schedulerMapper.selectSchedule", map);
	}
	
	public int insertSchedule(Scheduler scheduler) {
		return mybatisSession.insert("schedulerMapper.insertSchedule",scheduler);
	}

	public List<Scheduler> selectScheduler(String companyId) {
		return mybatisSession.selectList("schedulerMapper.selectScheduler", companyId);
	}

	public int insertScheduler(Map<String, String> map) {
		return mybatisSession.insert("schedulerMapper.insertScheduler", map);
	}

	public int deleteScheduler(int book_no) {
		return mybatisSession.delete("schedulerMapper.deleteScheduler", book_no);
	}

	public int selectCount(Map<String, String> map) {
		return mybatisSession.selectOne("schedulerMapper.selectCount", map);
	}

	public List<Scheduler> selectMyScheduler(String userId) {
		return mybatisSession.selectList("schedulerMapper.selectMyScheduler", userId);
	}

}
