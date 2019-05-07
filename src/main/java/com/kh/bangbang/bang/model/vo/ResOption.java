package com.kh.bangbang.bang.model.vo;

import org.springframework.stereotype.Component;

@Component	//주거옵션 RES_PRO_OPTION
public class ResOption implements java.io.Serializable{

	private static final long serialVersionUID = 3331L;
	
	private int pro_no; //매물번호
	private int res_no; //옵션번호
	private String res_pro_con; //옵션내용
	
	public ResOption() {}
	
	public ResOption(int pro_no, int res_no, String res_pro_con) {
		super();
		this.pro_no = pro_no;
		this.res_no = res_no;
		this.res_pro_con = res_pro_con;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getRes_pro_con() {
		return res_pro_con;
	}

	public void setRes_pro_con(String res_pro_con) {
		this.res_pro_con = res_pro_con;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ResOption [pro_no=" + pro_no + ", res_no=" + res_no + ", res_pro_con=" + res_pro_con + "]";
	}
	
	
	

}
