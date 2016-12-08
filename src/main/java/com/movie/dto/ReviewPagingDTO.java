package com.movie.dto;

public class ReviewPagingDTO {
	private int allCount;
	private int allPage;
	private int newsPerPage = 5;
	private int maxPage = 5;
	private int firstPage;
	private int endPage;
	private int nowPage;
	private boolean leftOn;
	private boolean rightOn;
	
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	public int getAllPage() {
		return allPage;
	}
	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}
	public int getNewsPerPage() {
		return newsPerPage;
	}
	public void setNewsPerPage(int newsPerPage) {
		this.newsPerPage = newsPerPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public boolean isLeftOn() {
		return leftOn;
	}
	public void setLeftOn(boolean leftOn) {
		this.leftOn = leftOn;
	}
	public boolean isRightOn() {
		return rightOn;
	}
	public void setRightOn(boolean rightOn) {
		this.rightOn = rightOn;
	}
	
}
