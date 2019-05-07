package com.kh.bangbang.company.model.vo;

public class Company implements java.io.Serializable{
	private static final long serialVersionUID = 123456789L;
	
	private String com_id;
	private String com_pwd;
	private String com_name;
	private String com_ceo;
	private String com_no;
	private String brokers_no;
	private String brokers_address;
	private String com_phone;
	private String com_content;
	private String com_email;
	private String state;
	
	public Company() {}

	public Company(String com_id, String com_pwd, String com_name, String com_ceo, String com_no, String brokers_no,
			String brokers_address, String com_phone, String com_content, String com_email, String state) {
		super();
		this.com_id = com_id;
		this.com_pwd = com_pwd;
		this.com_name = com_name;
		this.com_ceo = com_ceo;
		this.com_no = com_no;
		this.brokers_no = brokers_no;
		this.brokers_address = brokers_address;
		this.com_phone = com_phone;
		this.com_content = com_content;
		this.com_email = com_email;
		this.state = state;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getCom_pwd() {
		return com_pwd;
	}

	public void setCom_pwd(String com_pwd) {
		this.com_pwd = com_pwd;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getCom_ceo() {
		return com_ceo;
	}

	public void setCom_ceo(String com_ceo) {
		this.com_ceo = com_ceo;
	}

	public String getCom_no() {
		return com_no;
	}

	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}

	public String getBrokers_no() {
		return brokers_no;
	}

	public void setBrokers_no(String brokers_no) {
		this.brokers_no = brokers_no;
	}

	public String getBrokers_address() {
		return brokers_address;
	}

	public void setBrokers_address(String brokers_address) {
		this.brokers_address = brokers_address;
	}

	public String getCom_phone() {
		return com_phone;
	}

	public void setCom_phone(String com_phone) {
		this.com_phone = com_phone;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public String getCom_email() {
		return com_email;
	}

	public void setCom_email(String com_email) {
		this.com_email = com_email;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Company [com_id=" + com_id + ", com_pwd=" + com_pwd + ", com_name=" + com_name + ", com_ceo=" + com_ceo
				+ ", com_no=" + com_no + ", brokers_no=" + brokers_no + ", brokers_address=" + brokers_address
				+ ", com_phone=" + com_phone + ", com_content=" + com_content + ", com_email=" + com_email
				+ ", state=" + state + "]";
	}

	
}
