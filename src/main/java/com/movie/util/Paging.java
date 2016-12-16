package com.movie.util;

import com.movie.dto.PagingDTO;

public class Paging {
	public static Paging pageInstance = null;
	int allCount;
	int allPage;
	int newsPerPage=5;
	int maxPage=5;
	int firstPage;
	int endPage;
	int nowPage;
	boolean leftOn;
	boolean rightOn;
	

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

	public static Paging getInstance() {
		if (pageInstance == null) {
			pageInstance = new Paging();
		}
		return pageInstance;
	}

	public PagingDTO getPaging(int allCount, int page) {
		PagingDTO dto = new PagingDTO();
		this.allCount = allCount;
		allPage = (allCount-1) / (newsPerPage) + 1;
		nowPage = page;
		firstPage = ((nowPage-1)/ maxPage) * maxPage + 1;
		if (allPage > firstPage + maxPage - 1) {
			endPage = firstPage + maxPage - 1;
			rightOn = true;
		} else {
			endPage = allPage;
			rightOn = false;
		}
		if (firstPage > 1) {
			leftOn = true;
		} else {
			leftOn = false;
		}
		dto.setAllCount(allCount);
		dto.setAllPage(allPage);
		dto.setEndPage(endPage);
		dto.setFirstPage(firstPage);
		dto.setMaxPage(maxPage);
		dto.setNewsPerPage(newsPerPage);
		dto.setNowPage(nowPage);
		dto.setRightOn(rightOn);
		dto.setLeftOn(leftOn);
		System.out.println("test:"+dto.getNowPage());
		return dto;
	}
}
