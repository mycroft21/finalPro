package com.kosta.finalproject.vo;

/*
codeNum int, 글번호
category varchar, 카테고리
title varchar, 제목
startDate date not null, 시작일 
endDate date not null, 끝일
contents varchar,  내용
bill int,  대여비
deposit int, 보증금
img varchar, 이미지
packageStatus varchar 상태 
reaquestId varchar
company varchar
*/

public class RequestBoardVO {
	private int codeNum, bill, deposit;
	private String category, title, contents, img, packageStatus, reaquestId, company, startDate, endDate;
	
	public int getCodeNum() {
		return codeNum;
	}
	public void setCodeNum(int codeNum) {
		this.codeNum = codeNum;
	}
	public int getBill() {
		return bill;
	}
	public void setBill(int bill) {
		this.bill = bill;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getPackageStatus() {
		return packageStatus;
	}
	public void setPackageStatus(String packageStatus) {
		this.packageStatus = packageStatus;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getReaquestId() {
		return reaquestId;
	}
	public void setReaquestId(String reaquestId) {
		this.reaquestId = reaquestId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
}
