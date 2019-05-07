package com.kh.bangbang.qna.model.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QNA implements java.io.Serializable{
	
	private static final long serialVersionUID = 4445L;
	
	private int qna_no;
	private int upper_qna_no;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private int qna_level;
	private String user_id;
	private String qna_del;
	private Date del_date;
	private String qna_answer;
	
	public QNA() {}

	public QNA(int qna_no, int upper_qna_no, String qna_title, String qna_content, Date qna_date, int qna_level,
			String user_id, String qna_del, Date del_date, String qna_answer) {
		super();
		this.qna_no = qna_no;
		this.upper_qna_no = upper_qna_no;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_level = qna_level;
		this.user_id = user_id;
		this.qna_del = qna_del;
		this.del_date = del_date;
		this.qna_answer = qna_answer;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public int getUpper_qna_no() {
		return upper_qna_no;
	}

	public void setUpper_qna_no(int upper_qna_no) {
		this.upper_qna_no = upper_qna_no;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public int getQna_level() {
		return qna_level;
	}

	public void setQna_level(int qna_level) {
		this.qna_level = qna_level;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getQna_del() {
		return qna_del;
	}

	public void setQna_del(String qna_del) {
		this.qna_del = qna_del;
	}

	public Date getDel_date() {
		return del_date;
	}

	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "QNA [qna_no=" + qna_no + ", upper_qna_no=" + upper_qna_no + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_date=" + qna_date + ", qna_level=" + qna_level + ", user_id="
				+ user_id + ", qna_del=" + qna_del + ", del_date=" + del_date + ", qna_answer=" + qna_answer + "]";
	}

	
}
