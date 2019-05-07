package com.kh.bangbang.bmap.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Bmap implements Serializable {
	private static final long serialVersionUID = 51L;
	
	private int pro_no; //매물번호
	private String id;	//작성자
	private String pro_address; //기본주소
	private String pro_detail;	//상세주소
	private int deposit;	// 보증금
	private int rent;	//월세
	private int manage_pay;	//관리비
	private int loan; //융자
	private Date move_date; //입주가능
	private int room_count; //방갯수
	private int bath_count; //욕실갯수
	private int supply_area; //공급면적
	private int real_area; //전용면적
	private int floor; //해당층
	private String room_type; //방거실형태
	private String direction; //방향
	private String door_type; //현관유형
	private Date build_date; //준공년월
	private String build_type; //건물형태
	private String con_type; //계약형태
	private String pro_content; //매물상세정보
	private String contract_yn; //계약여부
	private String pro_del; //삭제여부
	private Date del_date; //삭제일
	private String rename_file; // 이미지 rename 파일
	private String pic_prono; // 이미지 prono 번호
	
	public Bmap() {}
	
	public Bmap(int pro_no, String pro_address) {
		this.pro_no = pro_no;
		this.pro_address = pro_address;
	}

	public Bmap(int pro_no, String id, String pro_address, String pro_detail, int deposit, int rent, int manage_pay,
			int loan, Date move_date, int room_count, int bath_count, int supply_area, int real_area, int floor,
			String room_type, String direction, String door_type, Date build_date, String build_type, String con_type,
			String pro_content, String contract_yn, String pro_del, Date del_date, String rename_file,
			String pic_prono) {
		super();
		this.pro_no = pro_no;
		this.id = id;
		this.pro_address = pro_address;
		this.pro_detail = pro_detail;
		this.deposit = deposit;
		this.rent = rent;
		this.manage_pay = manage_pay;
		this.loan = loan;
		this.move_date = move_date;
		this.room_count = room_count;
		this.bath_count = bath_count;
		this.supply_area = supply_area;
		this.real_area = real_area;
		this.floor = floor;
		this.room_type = room_type;
		this.direction = direction;
		this.door_type = door_type;
		this.build_date = build_date;
		this.build_type = build_type;
		this.con_type = con_type;
		this.pro_content = pro_content;
		this.contract_yn = contract_yn;
		this.pro_del = pro_del;
		this.del_date = del_date;
		this.rename_file = rename_file;
		this.pic_prono = pic_prono;
	}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPro_address() {
		return pro_address;
	}

	public void setPro_address(String pro_address) {
		this.pro_address = pro_address;
	}

	public String getPro_detail() {
		return pro_detail;
	}

	public void setPro_detail(String pro_detail) {
		this.pro_detail = pro_detail;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public int getManage_pay() {
		return manage_pay;
	}

	public void setManage_pay(int manage_pay) {
		this.manage_pay = manage_pay;
	}

	public int getLoan() {
		return loan;
	}

	public void setLoan(int loan) {
		this.loan = loan;
	}

	public Date getMove_date() {
		return move_date;
	}

	public void setMove_date(Date move_date) {
		this.move_date = move_date;
	}

	public int getRoom_count() {
		return room_count;
	}

	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}

	public int getBath_count() {
		return bath_count;
	}

	public void setBath_count(int bath_count) {
		this.bath_count = bath_count;
	}

	public int getSupply_area() {
		return supply_area;
	}

	public void setSupply_area(int supply_area) {
		this.supply_area = supply_area;
	}

	public int getReal_area() {
		return real_area;
	}

	public void setReal_area(int real_area) {
		this.real_area = real_area;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public String getDoor_type() {
		return door_type;
	}

	public void setDoor_type(String door_type) {
		this.door_type = door_type;
	}

	public Date getBuild_date() {
		return build_date;
	}

	public void setBuild_date(Date build_date) {
		this.build_date = build_date;
	}

	public String getBuild_type() {
		return build_type;
	}

	public void setBuild_type(String build_type) {
		this.build_type = build_type;
	}

	public String getCon_type() {
		return con_type;
	}

	public void setCon_type(String con_type) {
		this.con_type = con_type;
	}

	public String getPro_content() {
		return pro_content;
	}

	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}

	public String getContract_yn() {
		return contract_yn;
	}

	public void setContract_yn(String contract_yn) {
		this.contract_yn = contract_yn;
	}

	public String getPro_del() {
		return pro_del;
	}

	public void setPro_del(String pro_del) {
		this.pro_del = pro_del;
	}

	public Date getDel_date() {
		return del_date;
	}

	public void setDel_date(Date del_date) {
		this.del_date = del_date;
	}

	public String getRename_file() {
		return rename_file;
	}

	public void setRename_file(String rename_file) {
		this.rename_file = rename_file;
	}

	public String getPic_prono() {
		return pic_prono;
	}

	public void setPic_prono(String pic_prono) {
		this.pic_prono = pic_prono;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Bmap [pro_no=" + pro_no + ", id=" + id + ", pro_address=" + pro_address + ", pro_detail=" + pro_detail
				+ ", deposit=" + deposit + ", rent=" + rent + ", manage_pay=" + manage_pay + ", loan=" + loan
				+ ", move_date=" + move_date + ", room_count=" + room_count + ", bath_count=" + bath_count
				+ ", supply_area=" + supply_area + ", real_area=" + real_area + ", floor=" + floor + ", room_type="
				+ room_type + ", direction=" + direction + ", door_type=" + door_type + ", build_date=" + build_date
				+ ", build_type=" + build_type + ", con_type=" + con_type + ", pro_content=" + pro_content
				+ ", contract_yn=" + contract_yn + ", pro_del=" + pro_del + ", del_date=" + del_date + ", rename_file="
				+ rename_file + ", pic_prono=" + pic_prono + "]";
	}
	
	
}
