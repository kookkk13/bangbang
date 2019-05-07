package com.kh.bangbang.bookmark.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Bookmark {
	private static final long serialVersionUID = 222L;
	
	private int bookmark_no;
	private int pro_no;
	private String com_id;
	private String user_id;
	
	public Bookmark() {}
	
	public Bookmark( int pro_no, String com_id, String user_id) {
		super();
		
		this.pro_no = pro_no;
		this.com_id = com_id;
		this.user_id = user_id;
	}

	public Bookmark(int bookmark_no, int pro_no, String com_id, String user_id) {
		super();
		this.bookmark_no = bookmark_no;
		this.pro_no = pro_no;
		this.com_id = com_id;
		this.user_id = user_id;
	}
	

	public int getBookmark_no() {
		return bookmark_no;
	}

	public void setBookmark_no(int bookmark_no) {
		this.bookmark_no = bookmark_no;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "Bookmark [bookmark_no=" + bookmark_no + ", pro_no=" + pro_no + ", com_id=" + com_id + ", user_id="
				+ user_id + "]";
	}
	
}
