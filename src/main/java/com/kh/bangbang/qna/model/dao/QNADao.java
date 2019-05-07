package com.kh.bangbang.qna.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.bangbang.notice.model.vo.Notice;
import com.kh.bangbang.qna.model.vo.QNA;

@Repository("qnaDao")
public class QNADao {
	
	@Autowired
	private SqlSessionTemplate session; //DB 연결
	
	public List<QNA> selectQNAList(HashMap<String, Object> map){
		return session.selectList("QNAMapper.selectList", map);
	}

	public int insertQNA(QNA qna) {
		return session.insert("QNAMapper.insertQNA", qna);
	}

	public int updateQNA(QNA qna) {
		return session.update("QNAMapper.updateQNA", qna);
	}

	public int deleteQNA(int qna_no) {
		return session.delete("QNAMapper.deleteQNA", qna_no);
	}

	public QNA selectQNA(int qna_no) {
		return session.selectOne("QNAMapper.selectQNA", qna_no);
	}

	public int listCount(String id) {
		return session.selectOne("QNAMapper.listCount", id);
	}

	public int listCountAdmin() {
		return session.selectOne("QNAMapper.listCountAdmin");
	}

	public List<QNA> selectQNAAdminList(HashMap<String, Object> map) {
		return session.selectList("QNAMapper.selectAdminList", map);
	}

	public int updateAdminQNA(QNA qna) {
		return session.update("QNAMapper.updateAdminQNA", qna);
	}

	public int listCountSearch(String keyField, String keyWord) {
		
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "") {
			Map<String, String> map = new HashMap<String, String>();
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			return session.selectOne("QNAMapper.listCountSearch", map);
			} else {
				return session.selectOne("QNAMapper.listCountAdmin");
			}
	}

	public List<QNA> selectQNASearch(String keyField, String keyWord, HashMap<String, Object> map) {
		if(keyField != null && keyWord != null && keyField != "" && keyWord != "") {
			map.put("keyField", keyField);
			map.put("keyWord", keyWord);
			return session.selectList("QNAMapper.selectQNASearch", map);
		} else {
			return session.selectList("QNAMapper.selectAdminList");
		}
	}

}
