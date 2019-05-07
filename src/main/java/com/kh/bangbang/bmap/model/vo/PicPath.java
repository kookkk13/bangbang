package com.kh.bangbang.bmap.model.vo;

public class PicPath {
	
	private int pic_no;
	private int pro_no;
	private String original_file;
	private String rename_file;
	
	public PicPath() {}
	
	public PicPath(int pic_no, int pro_no, String original_file, String rename_file) {
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

	@Override
	public String toString() {
		return "PicPath [pic_no=" + pic_no + ", pro_no=" + pro_no + ", original_file=" + original_file
				+ ", rename_file=" + rename_file + "]";
	}
	
	
}
