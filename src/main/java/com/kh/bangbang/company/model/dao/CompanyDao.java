package com.kh.bangbang.company.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.company.model.vo.Company;

@Repository("companyDao")
public class CompanyDao {
	
	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	public Company selectCompany(String memberId) {
		return mybatisSession.selectOne("companyMapper.selectCompany", memberId);
	}

	public int insertCompany(Company company) {
		return mybatisSession.insert("companyMapper.insertCompany", company);
	}

	public int updateCompany(Company company) {
		return mybatisSession.update("companyMapper.updateCompany", company);
	}

	public List<Company> selectAllCompany() {
		return mybatisSession.selectList("companyMapper.selectAllCompany");
	}

	public List<Company> selectSearch(Map<String, String> option) {
		return mybatisSession.selectList("companyMapper.selectSearch", option);
	}


}
