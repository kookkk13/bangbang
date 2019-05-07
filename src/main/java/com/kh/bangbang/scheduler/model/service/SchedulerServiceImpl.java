package com.kh.bangbang.scheduler.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.common.model.vo.BaseResponse;
import com.kh.bangbang.scheduler.model.dao.SchedulerDao;
import com.kh.bangbang.scheduler.model.vo.Scheduler;

@Service("schedulerService")
public class SchedulerServiceImpl implements SchedulerService{
	
	@Autowired
	private SchedulerDao schedulerDao; 
	
	@Override
	public Date selectSchedule(HashMap<String, Object> map) {
		return schedulerDao.selectSchedule(map);
	}
	
	@Override
	public int insertSchedule(Scheduler scheduler){
		return schedulerDao.insertSchedule(scheduler);
	}

	@Override
	public List<Scheduler> selectScheduler(String companyId) {
		return schedulerDao.selectScheduler(companyId);
	}

	@Override
	public int insertScheduler(Map<String, String> map) {
		return schedulerDao.insertScheduler(map);
	}

	@Override
	public BaseResponse deleteScheduler(int book_no) {
		
		BaseResponse resDto = new BaseResponse();
		
		int cnt = schedulerDao.deleteScheduler(book_no);
		if(cnt > 0 ) {
			resDto.setSuccess(true);
		}
		
		return resDto;
	}
	
	@Override
	public int deleteScheduler2(int book_no) {
		return schedulerDao.deleteScheduler(book_no);
	}

	@Override
	public int selectCount(Map<String, String> map) {
		return schedulerDao.selectCount(map);
	}

	@Override
	public List<Scheduler> selectMyScheduler(String userId) {
		return schedulerDao.selectMyScheduler(userId);
	}
	

	
}
