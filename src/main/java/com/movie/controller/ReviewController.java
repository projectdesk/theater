package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dao.ReviewService;
/**
 * Handles requests for the application home page.
 */
import com.movie.dto.ReviewDTO;
import com.movie.dto.ReviewPagingDTO;
import com.movie.util.Paging;

@Controller
public class ReviewController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	ReviewService reviewService;
	
	//����
	@RequestMapping(value = "/audience_ReviewWrite.do", method = RequestMethod.GET)
	public String Insertgo(){
		return "review/audience_ReviewWrite";
	}
	
	@RequestMapping(value = "/audience_ReviewWrite.do", method = RequestMethod.POST)
	public String Insert(HttpServletRequest request,ReviewDTO dto,Model model ){
		reviewService.audienceReviewWrite(dto);
		return List(request, model);
	}
	
	@RequestMapping(value = "/audience_ReviewList.do", method = RequestMethod.GET)
	public String List(HttpServletRequest request,Model model){
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<ReviewDTO> list = reviewService.audienceReviewList(page);
		int allCount = reviewService.audienceReviewCount();
		Paging paging = Paging.getInstance();
		ReviewPagingDTO dto = paging.getPaging(allCount, page);
		model.addAttribute("paging",dto);
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		return "review/audience_ReviewList";
	}
	@RequestMapping(value = "/audience_ReviewContent.do", method = RequestMethod.GET)
	public String ListContent(ReviewDTO reviewdto,@Param("review_no") int review_no,Model model){
		ReviewDTO dto = reviewService.audienceReviewContent(review_no);
		System.out.println("dto:"+dto);
		model.addAttribute("dto",dto);
		return "review/audience_ReviewContent";	
	}
	//�˻�,����¡
	@RequestMapping(value = "/audience_ReviewSearch.do", method = RequestMethod.POST)
	public String SearchListgo(HttpServletRequest request,ReviewDTO reviewdto,@RequestParam("movie_no") 
	int movie_no,Model model){
		return SearchList(request,reviewdto, movie_no, model);
	}
	@RequestMapping(value = "/audience_ReviewSearch.do", method = RequestMethod.GET)
	public String SearchList(HttpServletRequest request,ReviewDTO reviewdto,@RequestParam("movie_no") 
	int movie_no,Model model){
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<ReviewDTO> slist = reviewService.audienceReviewSearch(movie_no);
		List<ReviewDTO> plist = reviewService.audienceReviewSearchPage(page);
		int SCount = reviewService.audienceReviewCountSearch();
		System.out.println("slist : "+slist);
		System.out.println("plist : "+plist);
		Paging paging = Paging.getInstance();
		ReviewPagingDTO dto = paging.getPaging(SCount, page);
		model.addAttribute("paging",dto);
		model.addAttribute("slist",slist);
		model.addAttribute("plist",plist);
		model.addAttribute("page",page);
		return "review/audience_ReviewSearch";
	}
	@RequestMapping(value="audience_ReviewDelete.do",method =RequestMethod.GET)
	public String Deletego(ReviewDTO dto,Model model){
		model.addAttribute("review_no",dto.getReview_no());
		return "review/audience_ReviewDelete";
	}
	@RequestMapping(value="audience_ReviewDelete.do",method =RequestMethod.POST)
	public String Delete(ReviewDTO dto){
		int result = reviewService.audienceReviewDelete(dto);
		return "winclose";
		
	}
	//������
	
	@RequestMapping(value = "/expert_ReviewWrite.do", method = RequestMethod.GET)
	public String eInsertgo(){
		return "review/expert_ReviewWrite";
	}
	
	@RequestMapping(value = "/expert_ReviewWrite.do", method = RequestMethod.POST)
	public String eInsert(HttpServletRequest request,ReviewDTO dto,Model model ){
		reviewService.expertReviewWrite(dto);
		return eList(request,model);
	}
	
	@RequestMapping(value = "/expert_ReviewList.do", method = RequestMethod.GET)
	public String eList(HttpServletRequest request,Model model){
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<ReviewDTO> list = reviewService.expertReviewList(page);
		int allCount = reviewService.expertReviewCount();
		Paging paging = Paging.getInstance();
		ReviewPagingDTO dto = paging.getPaging(allCount, page);
		model.addAttribute("paging",dto);
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		return "review/expert_ReviewList";
		
	}
	@RequestMapping(value = "/expert_ReviewContent.do", method = RequestMethod.GET)
	public String eListContent(ReviewDTO reviewdto,@Param("review_no") int review_no,Model model){
		ReviewDTO dto = reviewService.expertReviewContent(review_no);
		System.out.println("dto:"+dto);
		model.addAttribute("dto",dto);
		return "review/expert_ReviewContent";	
	}
	
	@RequestMapping(value = "/expert_ReviewSearch.do", method = RequestMethod.GET)
	public String eSearchList(HttpServletRequest request,ReviewDTO reviewdto,
	@RequestParam("movie_no") int movie_no,Model model){
		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<ReviewDTO> slist = reviewService.expertReviewSearch(movie_no);
		List<ReviewDTO> plist = reviewService.expertReviewSearchPage(page);
		int SCount = reviewService.expertReviewCountSearch();
		Paging paging = Paging.getInstance();
		ReviewPagingDTO dto = paging.getPaging(SCount, page);
		model.addAttribute("paging",dto);
		model.addAttribute("slist",slist);
		model.addAttribute("plist",plist);
		model.addAttribute("page",page);
		return "review/expert_ReviewSearch";
	}
	
	@RequestMapping(value="expert_ReviewDelete.do",method =RequestMethod.GET)
	public String eDeletego(ReviewDTO dto,Model model){
		model.addAttribute("review_no",dto.getReview_no());
		return "review/expert_ReviewDelete";
	}
	
	@RequestMapping(value = "/expert_ReviewSearch.do", method = RequestMethod.POST)
	public String eSearchListgo(HttpServletRequest request,ReviewDTO reviewdto,
	@RequestParam("movie_no") int movie_no,Model model){
		return eSearchList(request,reviewdto, movie_no, model);
	}
	

	@RequestMapping(value="expert_ReviewDelete.do",method =RequestMethod.POST)
	public String eDelete(ReviewDTO dto){
		int result = reviewService.expertReviewDelete(dto);
		return "review/winclosewE";
		
	}
	
	
}







