package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNo; //	USER_NO	NUMBER
	private String userId; //	USER_ID	VARCHAR2(30 BYTE)
	private String userPwd; //	USER_PWD	VARCHAR2(50 BYTE)
	private String userName; //	USER_NAME	VARCHAR2(15 BYTE)
	private String gender; //	GENDER	VARCHAR2(10 BYTE)
	private String phone; //	PHONE	VARCHAR2(13 BYTE)
	private String email; //	EMAIL	VARCHAR2(100 BYTE)
	private String address; //	ADDRESS	 VARCHAR2(150 BYTE)
	private String foodInter; //	FOOD_INTEREST	VARCHAR2(100 BYTE)
	private String cleanInter; //	CLEAN_INTEREST	VARCHAR2(100 BYTE)
	private Date enrollDate;  //	CREATE_DATE	DATE
	private String status; //	STATUS	CHAR(1 BYTE)
	
	public Member() {
		super();
	}

	
	




	public Member(String userName, String phone ) {
		super();
		this.userName = userName;
		this.phone = phone;
	}







	public Member(String userId, String userPwd, String userName, String gender, String phone, String email,
			String address, String foodInter, String cleanInter) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.foodInter = foodInter;
		this.cleanInter = cleanInter;
	}



	public Member(int userNo, String userId, String userPwd, String userName, String gender, String phone, String email,
			String address, String foodInter, String cleanInter, Date enrollDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.foodInter = foodInter;
		this.cleanInter = cleanInter;
		this.enrollDate = enrollDate;
		this.status = status;
	}








	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFoodInter() {
		return foodInter;
	}

	public void setFoodInter(String foodInter) {
		this.foodInter = foodInter;
	}

	public String getCleanInter() {
		return cleanInter;
	}

	public void setCleanInter(String cleanInter) {
		this.cleanInter = cleanInter;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	



	@Override
	public String toString() {
		return "Member [회원번호 : " + userNo + ", 아이디 : " + userId + ", 비밀번호 : " + userPwd + ", 이름 : " + userName
				+ ", 성별 : " + gender + ", 전화번호 : " + phone + ", 이메일 : " + email + ", 주소 : " + address
				+ ", 음식관심분야 : " + foodInter + ", 목욕관심분야 : " + cleanInter + ", 회원가입일 : " + enrollDate + ", 상태값 : "
				+ status + "]";
	}

	
	

}
