package com.kh.bangbang.notice.model.vo;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice implements java.io.Serializable{
	private static final long serialVersionUID = 4444L;
	
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_count;
	private String notice_del;
	private Date del_date;
	
	public Notice() {}

	public Notice(int notice_no, String notice_title, String notice_content, Date notice_date, int notice_count,
			String notice_del, Date del_date) {
		super();
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_count = notice_count;
		this.notice_del = notice_del;
		this.del_date = del_date;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public String getNotice_del() {
		return notice_del;
	}

	public void setNotice_del(String notice_del) {
		this.notice_del = notice_del;
	}

	public Date getDel_date() {
		return del_date;
	}

	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_date=" + notice_date + ", notice_count=" + notice_count + ", notice_del="
				+ notice_del + ", del_date=" + del_date + "]";
	}
}
