package com.kh.bangbang.company.model.service;

import java.util.List;
import java.util.Map;

import com.kh.bangbang.company.model.vo.Company;

public interface CompanyService {

	Company selectCompany(String memberId);
	int insertCompany(Company company);
	int updateCompany(Company company);
	List<Company> selectAllCompany();
	List<Company> selectSearch(Map<String, String> option);
	
}
