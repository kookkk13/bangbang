package com.kh.bangbang.bang.model.vo;

import org.springframework.stereotype.Component;

@Component //파일업로드
public class BangUploadFile implements java.io.Serializable{
	
	private static final long serialVersionUID = 3333L;

	private int pic_no; //사진번호
	private int pro_no; //매물번호
	private String original_file; //원본파일명
	private String rename_file; //원본파일명
	
	public BangUploadFile() {}
	
	public BangUploadFile(String original_file, String rename_file) {
		super();
		this.original_file = original_file;
		this.rename_file = rename_file;
	}

	public BangUploadFile(int pic_no, int pro_no, String original_file, String rename_file) {
		super();
		this.pic_no = pic_no;
		this.pro_no = pro_no;
		this.original_file = original_file;
		this.rename_file = rename_file;
	}

	public int getPic_no() {
		return pic_no;
	}

	public void setPic_no(int pic_no) {
		this.pic_no = pic_no;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getOriginal_file() {
		return original_file;
	}

	public void setOriginal_file(String original_file) {
		this.original_file = original_file;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "BangUploadFile [pic_no=" + pic_no + ", pro_no=" + pro_no + ", original_file=" + original_file
				+ ", rename_file=" + rename_file + "]";
	}
	
	
	
	
}
