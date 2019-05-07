package com.kh.bangbang.bang.model.vo;

import org.springframework.stereotype.Component;

@Component	//생활옵션 LIVE_PRO_OPTION
public class LiveOption implements java.io.Serializable{

	private static final long serialVersionUID = 3332L;
	
	private int pro_no; //매물번호
	private int live_no; //옵션번호
	private String live_pro_con; //옵션내용
	
	
	public LiveOption() {}


	public LiveOption(int pro_no, int live_no, String live_pro_con) {
		this.pro_no = pro_no;
		this.live_no = live_no;
		this.live_pro_con = live_pro_con;
	}


	public int getPro_no() {
		return pro_no;
	}


	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}


	public int getLive_no() {
		return live_no;
	}


	public void setLive_no(int live_no) {
		this.live_no = live_no;
	}


	public String getLive_pro_con() {
		return live_pro_con;
	}


	public void setLive_pro_con(String live_pro_con) {
		this.live_pro_con = live_pro_con;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "LiveOption [pro_no=" + pro_no + ", live_no=" + live_no + ", live_pro_con=" + live_pro_con + "]";
	}
	
	
	

}
