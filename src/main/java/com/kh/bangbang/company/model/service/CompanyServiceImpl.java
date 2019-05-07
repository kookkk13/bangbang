package com.kh.bangbang.company.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.bangbang.company.model.dao.CompanyDao;
import com.kh.bangbang.company.model.vo.Company;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyDao companyDao;
	
	@Override
	public Company selectCompany(String memberId) {
		return companyDao.selectCompany(memberId);
	}

	@Override
	public int insertCompany(Company company) {
		return companyDao.insertCompany(company);
	}

	@Override
	public int updateCompany(Company company) {
		return companyDao.updateCompany(company);
	}

	@Override
	public List<Company> selectAllCompany() {
		return companyDao.selectAllCompany();
	}

	@Override
	public List<Company> selectSearch(Map<String, String> option) {
		return companyDao.selectSearch(option);
	}



}
