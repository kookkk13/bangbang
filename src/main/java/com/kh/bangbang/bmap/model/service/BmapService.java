package com.kh.bangbang.bmap.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bangbang.bmap.model.vo.Bmap;

public interface BmapService {

	List<Bmap> selectMapList();

	List<Bmap> selectMapAreaList(String pro_no);

	List<Bmap> selectSearchList(Map option);

}
