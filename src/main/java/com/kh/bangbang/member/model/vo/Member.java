package com.kh.bangbang.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private static final long serialVersionUID = 2L;
	
	private String id;
	private String pwd;
	private String type;
	private String state;
	private String email;
	private int count;
	
	public Member() {}

	public Member(String id, String pwd, String type, String state, String email, int count) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.type = type;
		this.state = state;
		this.email = email;
		this.count = count;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", type=" + type + ", state=" + state + ", email=" + email
				+ ", count=" + count + "]";
	}
	
	
}
