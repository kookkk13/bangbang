package com.kh.bangbang.bmap.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.bmap.model.dao.BmapDao;
import com.kh.bangbang.bmap.model.vo.Bmap;


@Service("bmapService")
public class BmapServiceImpl implements BmapService {
	
	@Autowired
	private BmapDao BmapDao;
	
	@Override
	public List<Bmap> selectMapList() {		
		return BmapDao.selectMapList();
	}

	@Override
	public List<Bmap> selectMapAreaList(String pro_no) {
		return BmapDao.selectMapAreaList(pro_no);
	}

	@Override
	public List<Bmap> selectSearchList(Map option) {
		return BmapDao.selectSearchList(option);
	}
	
}
