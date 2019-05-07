package com.kh.bangbang.bmap.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.bmap.model.vo.Bmap;

@Repository("bmapDao")
public class BmapDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public List<Bmap> selectMapList() {
		// 매물 전체리스트 불러오기
		return session.selectList("bmapMapper.bmapList");
		
	}

	public List<Bmap> selectMapAreaList(String pro_no) {
		// 지도 영역 내 매물 리스트 불러오기
		return session.selectList("bmapMapper.bmapAreaList", pro_no);
	}

	public List<Bmap> selectSearchList(Map option) {
		// 상세 검색 매물 리스트 불러오기
		return session.selectList("bmapMapper.selectSearchList", option);
	}

	
}
