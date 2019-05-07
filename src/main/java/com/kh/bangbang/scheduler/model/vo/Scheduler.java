package com.kh.bangbang.scheduler.model.vo;

public class Scheduler implements java.io.Serializable{
   
   private static final long serialVersionUID = 2223L;
   
   private int book_no;      //예약 번호
   private int pro_no;         //매물 번호
   private String book_date;   //날짜(시간)
   private String com_id;      //업체 아이디
   private String user_id;      //회원 아이디
   private String com_name;   //업체 이름
   private String com_phone;   //업체 연락처
   private int deposit;      //보증금
   private int rent;         //월세
   private String build_type;   //건물 형태
   private String con_type;   //계약 형태
   private String user_name;   //개인업체 이름
   private String user_phone;   //개인업체 연락처
   
   public Scheduler() {}

   public Scheduler(int book_no, int pro_no, String book_date, String com_id, String user_id, String com_name,
         String com_phone, int deposit, int rent, String build_type, String con_type, String user_name,
         String user_phone) {
      super();
      this.book_no = book_no;
      this.pro_no = pro_no;
      this.book_date = book_date;
      this.com_id = com_id;
      this.user_id = user_id;
      this.com_name = com_name;
      this.com_phone = com_phone;
      this.deposit = deposit;
      this.rent = rent;
      this.build_type = build_type;
      this.con_type = con_type;
      this.user_name = user_name;
      this.user_phone = user_phone;
   }

   public int getBook_no() {
      return book_no;
   }

   public void setBook_no(int book_no) {
      this.book_no = book_no;
   }

   public int getPro_no() {
      return pro_no;
   }

   public void setPro_no(int pro_no) {
      this.pro_no = pro_no;
   }

   public String getBook_date() {
      return book_date;
   }

   public void setBook_date(String book_date) {
      this.book_date = book_date;
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

   public String getCom_name() {
      return com_name;
   }

   public void setCom_name(String com_name) {
      this.com_name = com_name;
   }

   public String getCom_phone() {
      return com_phone;
   }

   public void setCom_phone(String com_phone) {
      this.com_phone = com_phone;
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

   public String getUser_name() {
      return user_name;
   }

   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }

   public String getUser_phone() {
      return user_phone;
   }

   public void setUser_phone(String user_phone) {
      this.user_phone = user_phone;
   }

   @Override
   public String toString() {
      return "Scheduler [book_no=" + book_no + ", pro_no=" + pro_no + ", book_date=" + book_date + ", com_id="
            + com_id + ", user_id=" + user_id + ", com_name=" + com_name + ", com_phone=" + com_phone + ", deposit="
            + deposit + ", rent=" + rent + ", build_type=" + build_type + ", con_type=" + con_type + ", user_name="
            + user_name + ", user_phone=" + user_phone + "]";
   }

   
   
   
}