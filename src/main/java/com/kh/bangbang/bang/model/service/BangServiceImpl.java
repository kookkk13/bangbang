package com.kh.bangbang.bang.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.bang.model.dao.BangDao;
import com.kh.bangbang.bang.model.vo.Bang;
import com.kh.bangbang.bang.model.vo.BangUploadFile;
import com.kh.bangbang.bang.model.vo.LiveOption;
import com.kh.bangbang.bang.model.vo.ResOption;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.user.model.vo.User;

@Service("bangService")
public class BangServiceImpl implements BangService{
	
	@Autowired
	private BangDao bangDao;

	@Override
	public List<Bang> selectBangList() {
		// 매물 목록 조회
		return bangDao.selectBangList();
	}
	@Override
	public Bang selectInfoBang(int pro_no) {
		// 매물 상세보기
		return bangDao.selectInfoBang(pro_no);
	}
	@Override
	public List<LiveOption> selectInfoLiveBang(int pro_no) {
		// 매물 상세보기 생활옵션
		return bangDao.selectInfoLiveBang(pro_no);
	}
	@Override
	public List<ResOption> selectInfoResBang(int pro_no) {
		// 매물 상세보기 거주옵션
		return bangDao.selectInfoResBang(pro_no);
	}
	@Override
	public List<BangUploadFile> selectBangFile(int pro_no) {
		// 매물보기 사진
		return bangDao.selectBangFile(pro_no);
	}
	@Override
	public String selectWriter(String pro_id) {
		// 매물 상세보기 작성자
		return bangDao.selectWriter(pro_id);
	}
	@Override
	public User selectWriterUser(String pro_id) {
		// 작성자가 일반회원인경우
		return bangDao.selectWriterUser(pro_id);
	}
	@Override
	public Company selectWriterCompany(String pro_id) {
		// 작성자가 업체인경우
		return bangDao.selectWriterCompany(pro_id);
	}
	@Override
	public int insertProperty(Bang bang) {
		// 매물 등록
		return bangDao.insertProperty(bang);
	}
	@Override
	public int insertRes(String[] resOp) {
		// 매물등록 후 resoption 추가
		int result = 1;
		
		for( int i = 0; i< resOp.length; i++ ) {
			result &= bangDao.insertRes(resOp[i]);
		}
		return result;
	}
	@Override
	public int insertLive(String[] liveOp) {
		// resoption 추가 후 liveoption 추가
		
		int result = 1;
		
		for(int i = 0; i< liveOp.length; i++) {
			result &= bangDao.insertLive(liveOp[i]);
		}
		return result;
	}
	@Override
	public int insertBangFile(BangUploadFile bfileList) {
		// 매물 사진등록
		int result = 1;
	     result &= bangDao.insertBangFile(bfileList);
		return result;
	}
	@Override
	public int selectPro_no() {
		// 썸네일 등록용 최종 매물번호 확인
		return bangDao.selectPro_no();
	}
	@Override
	public int deleteBang(int pro_no) {
		// 매물 삭제
		return bangDao.deleteBang(pro_no);
	}
	@Override
	public int deleteBangFile(int pic_no) {
		// 매물 사진 삭제	
		int result = 1;
		result &= bangDao.deleteBangFile(pic_no);
		return result;
	}
	@Override
	public int updateProperty(Bang bang) {
		// 매물수정 ( 매물정보 업데이트 ) 
		return bangDao.updateProperty(bang);
	}
	@Override
	public int deleteResOption(int pro_no) {
		// 매물 수정 주거옵션 삭제
		return bangDao.deleteResOption(pro_no);
	}
	@Override
	public int deleteLiveOption(int pro_no) {
		// 매물 수정 생활옵션 삭제
		return bangDao.deleteLiveOption(pro_no);
	}
	@Override
	public int insertBangFile1(BangUploadFile bfile) {
		// 매물 수정 사진 업로드
		int result = 1;
	     result &= bangDao.insertBangFile1(bfile);
		return result;
	}
	@Override
	public int insertLive1(LiveOption live) {
		// 매물 생활옵션 수정
		int result = 1;
		result &= bangDao.insertLive1(live);
		return result;
	}
	@Override
	public int insertRes1(ResOption res) {
		// 매물 주거옵션 수정
		int result = 1;
		result &= bangDao.insertRes1(res);
		return result;
	}
	@Override
	public List<Bang> selectBookmarkList(String id) {
		// zzim 리스트 출력
		return bangDao.selectBookmarkList(id);
	}
	@Override
	public List<Bang> selectAdminBangAll(HashMap<String, Object> map) {
		// 관리자매물 전체보기
		return bangDao.selectAdminBangAll(map);
	}
	@Override
	public int countList() {
		// 관리자매물 전체 갯수
		return bangDao.countList();
	}
	@Override
	public List<Bang> selectAdminSearchBang(HashMap<String, Object> map) {
		//관리자 매물 검색 리스트
		return bangDao.selectAdminSearchBang(map);
	}
	@Override
	public int countSList(HashMap<String, String> search) {
		// 관리자 매물 검색 갯수
		return bangDao.countSList(search);
	}
	@Override
	public List<Bang> userSearchBang(HashMap<String, Object> map) {
		// 유저 매물 검색
		return bangDao.selectUserSearchBang(map);
	}
	@Override
	public List<BangUploadFile> selectImge() {
		// 썸내일용 이미지
		return bangDao.selectImage();
	}
	@Override
	public List<Bang> selectUserBangList(HashMap<String, Object> map) {
		// 작성 매물 관리
		return bangDao.selectUserBangList(map);
	}
	@Override
	public int countUserBang(String id) {
		// 작성 매물 갯수
		return bangDao.countUserBang(id);
	}
	@Override
	public int contractBang(int pro_no) {
		// 방 계약여부
		return bangDao.contractBang(pro_no);
	}
	@Override
	public int selectSchedulerCheck(HashMap<String, Object> map) {
		// 스케쥴 존재 여부
		return bangDao.selectSchedulerCheck(map);
	}


	
}
