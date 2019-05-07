package com.kh.bangbang.scheduler.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.bangbang.common.model.vo.BaseResponse;
import com.kh.bangbang.scheduler.model.vo.Scheduler;

public interface SchedulerService {
	
	//스케줄 선택(map에 세션에서 id 랑 매물번호 보내기 변수 이름 user_id, pro_no)
	Date selectSchedule(HashMap<String, Object> map);
	
	//스케줄 입력(컨트롤러에서 객체에 값 입력해서 전송)
	int insertSchedule(Scheduler scheduler);

	List<Scheduler> selectScheduler(String companyId);

	int insertScheduler(Map<String, String> map);

	BaseResponse deleteScheduler(int book_no);
	
	int deleteScheduler2(int book_no);

	int selectCount(Map<String, String> map);

	List<Scheduler> selectMyScheduler(String userId);


}
