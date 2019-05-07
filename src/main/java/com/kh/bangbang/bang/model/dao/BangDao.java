package com.kh.bangbang.bang.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.bang.model.vo.Bang;
import com.kh.bangbang.bang.model.vo.BangUploadFile;
import com.kh.bangbang.bang.model.vo.LiveOption;
import com.kh.bangbang.bang.model.vo.ResOption;
import com.kh.bangbang.company.model.vo.Company;
import com.kh.bangbang.user.model.vo.User;

@Repository("bangDao")
public class BangDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Bang> selectBangList() {
		//매물 전체리스트
		return session.selectList("bangMapper.selectBangList");
	}

	public Bang selectInfoBang(int pro_no) {
		// 매물 상세보기
		return session.selectOne("bangMapper.selectInfoBang", pro_no);
	}

	public List<LiveOption> selectInfoLiveBang(int pro_no) {
		// 매물 상세보기 주거옵션
		return session.selectList("bangMapper.selectInfoLiveBang", pro_no);
	}

	public List<ResOption> selectInfoResBang(int pro_no) {
		// 매물 상세보기 거주옵션
		return session.selectList("bangMapper.selectInfoResBang", pro_no);
	}

	public String selectWriter(String id) {
		// 매물 상세보기 작성자
		return session.selectOne("bangMapper.selectWriter", id);
	}

	public User selectWriterUser(String id) {
		// 작성자가 일반회원일때
		return session.selectOne("bangMapper.selectWriterUser", id);
	}

	public Company selectWriterCompany(String id) {
		// 작성자가 업체일때
		return session.selectOne("bangMapper.selectWriterCompany", id);
	}

	public int insertProperty(Bang bang) {
		// 매물 등록
		return session.insert("bangMapper.insertProperty", bang);
	}

	public int insertRes(String resOp) {
		// 매물등록 후 resoption 추가
		return session.insert("bangMapper.insertRes", resOp);
	}

	public int insertLive(String liveOp) {
		// resoption 추가 후 liveoption 추가
		return session.insert("bangMapper.insertLive", liveOp);
	}

	public int insertBangFile(BangUploadFile bfile) {
		// 매물 이미지 추가
		return session.insert("bangMapper.insertBangFile", bfile);
	}

	public List<BangUploadFile> selectBangFile(int pro_no) {
		// 매물 상세보기 사진
		return session.selectList("bangMapper.selectBangFile", pro_no);
	}

	public int selectPro_no() {
		// 썸네일 등록용 최종 매물 번호 확인
		return session.selectOne("bangMapper.selectPro_no");
	}

	public int deleteBang(int pro_no) {
		// 매물 삭제
		return session.update("bangMapper.updateBang", pro_no);
	}

	public int deleteBangFile(int pic_no) {
		// 매물 사진 삭제
		return session.delete("bangMapper.deleteBangFile", pic_no);
	}

	public int updateProperty(Bang bang) {
		// 매물 수정 매물정보 업데이트
		return session.update("bangMapper.updateProperty", bang);
	}

	public int deleteResOption(int pro_no) {
		// 매물 수정 주거옵션 삭제
		return session.delete("bangMapper.deleteResOption", pro_no);
	}

	public int deleteLiveOption(int pro_no) {
		// 매물 수정 생활옵션 삭제
		return session.delete("bangMapper.deleteLiveOption", pro_no);
	}

	public int insertBangFile1(BangUploadFile bfile) {
		// 매물 이미지 수정
		return session.insert("bangMapper.insertBangFile1", bfile);
	}

	public int insertRes1(ResOption resOption) {
		// 매물 수정 주거옵션
		return session.insert("bangMapper.insertRes1", resOption);
	}

	public int insertLive1(LiveOption liveOption) {
		// 매물 수정 생활옵션
		return session.insert("bangMapper.insertLive1", liveOption);
	}

	public List<Bang> selectBookmarkList(String id) {
		// 찜리스트 출력
		return session.selectList("bangMapper.selectBookmarkList", id);
	}

	public int countList() {
		// 관리자매물 전체 리스트 갯수
		return session.selectOne("bangMapper.countList");
	}

	public List<Bang> selectAdminBangAll(HashMap<String, Object> map) {
		// 관리자 매물 전체 리스트
		return session.selectList("bangMapper.selectAdminAllBang",map);
	}

	public List<Bang> selectAdminSearchBang(HashMap<String, Object> map) {
		// 관리자 매물 검색 리스트 
		return session.selectList("bangMapper.selectAdminSearchBang", map);
	}

	public int countSList(HashMap<String, String> search) {
		// 관리자 매물 검색 갯수
		return session.selectOne("bangMapper.countSlist", search);
	}

	public List<Bang> selectUserSearchBang(HashMap<String, Object> map) {
		// 사용자 매물 검색
		return session.selectList("bangMapper.selectUserSearchBang",map);
	}

	public List<BangUploadFile> selectImage() {
		// 썸네일용 이미지
		return session.selectList("bangMapper.selectImage");
	}

	public List<Bang> selectUserBangList(HashMap<String, Object> map) {
		// 작성매물 관리
		return session.selectList("bangMapper.selectUserBangList", map);
	}

	public int countUserBang(String id) {
		// 작성 매물 갯수
		return session.selectOne("bangMapper.countUserBang",id);
	}

	public int contractBang(int pro_no) {
		// 계약완료
		return session.update("bangMapper.updateContract", pro_no);
	}

	public int selectSchedulerCheck(HashMap<String, Object> map) {
		// 스케줄러 확인
		return session.selectOne("bangMapper.selectSchedulerCheck", map);
	}

}
