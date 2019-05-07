package com.kh.bangbang.bang.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;

import com.kh.bangbang.bang.model.vo.Bang;
import com.kh.bangbang.bang.model.vo.BangUploadFile;
import com.kh.bangbang.bang.model.vo.LiveOption;
import com.kh.bangbang.bang.model.vo.ResOption;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.user.model.vo.User;

public interface BangService {
	
	//전체리스트 조회
	List<Bang> selectBangList();
	//방상세보기
	Bang selectInfoBang(int pro_no);
	List<LiveOption> selectInfoLiveBang(int pro_no);
	List<ResOption> selectInfoResBang(int pro_no);
	String selectWriter(String pro_id);
	User selectWriterUser(String pro_id);
	Company selectWriterCompany(String pro_id);
	int insertProperty(Bang bang);
	int insertRes(String[] resOp);
	int insertLive(String[] liveOp);
	int insertBangFile(BangUploadFile bfile);
	List<BangUploadFile> selectBangFile(int pro_no);
	int selectPro_no();
	int deleteBang(int pro_no);
	int deleteBangFile(int pic_no);
	int updateProperty(Bang bang);
	int deleteResOption(int pro_no);
	int deleteLiveOption(int pro_no);
	int insertBangFile1(BangUploadFile bfile);
	int insertLive1(LiveOption live);
	int insertRes1(ResOption res);
	List<Bang> selectBookmarkList(String user_id);
	List<Bang> selectAdminBangAll(HashMap<String, Object> map);
	int countList();
	List<Bang> selectAdminSearchBang(HashMap<String, Object> map);
	int countSList(HashMap<String, String> search);
	List<Bang> userSearchBang(HashMap<String, Object> map);
	List<BangUploadFile> selectImge();
	List<Bang> selectUserBangList(HashMap<String, Object> map);
	int countUserBang(String id);
	int contractBang(int pro_no);
	int selectSchedulerCheck(HashMap<String, Object> map);

}
