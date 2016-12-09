package com.movie.util;

import javax.servlet.http.HttpServletRequest;

import com.movie.dto.PagingDTO;

public class HelpCenterPaging {
	public static HelpCenterPaging pageInstance = null;
	int allCount;
	int allPage;
	int newsPerPage = 5;
	int maxPage = 10;
	int firstPage;
	int endPage;
	int nowPage;
	boolean leftOn;
	boolean rightOn;

	public static HelpCenterPaging getInstance() {
		if (pageInstance == null) {
			pageInstance = new HelpCenterPaging();
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
		return dto;
	}
}
