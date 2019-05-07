package com.kh.bangbang.user.model.vo;

public class User {
	private static final long serialVersionUID = 22L;
	public User() {}
	
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_pwd;
	private String state;
	
	
	public User(String user_id, String user_name, String user_email, String user_phone, String user_pwd,String state) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_pwd = user_pwd;
		this.state = state;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getUser_pwd() {
		return user_pwd;
	}


	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}



	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public String getUser_email() {
		return user_email;
	}


	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}


	public String getUser_phone() {
		return user_phone;
	}


	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	
	
	
}
