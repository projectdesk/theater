package com.movie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dao.ReviewService;
import com.movie.dto.MoviePageDTO;
import com.movie.dto.PagingDTO;
/**
 * Handles requests for the application home page.
 */
import com.movie.dto.ReviewDTO;
import com.movie.util.Paging;

@Controller
public class ReviewController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	ReviewService reviewService;

	//
	@RequestMapping(value = "/ReviewWrite.do", method = RequestMethod.GET)
	public String Insertgo(Model model, @RequestParam(value = "sort", defaultValue = "null") String sort) {
		if (sort.equals("audience")) {
			model.addAttribute(sort);
			return "review/ReviewWrite";
		} else {
			model.addAttribute(sort);
			return "review/ReviewWrite";
		}
	}

	// 
	@RequestMapping(value = "/ReviewWrite.do", method = RequestMethod.POST)
	public String Insert(HttpSession session,HttpServletRequest request, ReviewDTO dto, Model model,
			@RequestParam(value = "sort", defaultValue = "null") String sort,
			@RequestParam(value = "movie_no") int movie_no) {
		dto.setMovie_no(movie_no);
		dto.setWriter(session.getAttribute("id").toString());
		if (sort.equals("audience")) {
			reviewService.audienceReviewWrite(dto);
			model.addAttribute(sort);
			return List(request, model, sort);
		} else {
			reviewService.expertReviewWrite(dto);
			model.addAttribute(sort);
			return List(request, model, sort);
		}
	}

	@RequestMapping(value = "/ReviewList.do", method = RequestMethod.GET)
	public String List(HttpServletRequest request, Model model,
	@RequestParam(value = "sort", defaultValue = "null") String sort) {
		int page=1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			}
		List<ReviewDTO> list=null;
		Paging paging = Paging.getInstance();
		PagingDTO dto = null;
		if (sort.equals("audience")) {
			list = reviewService.audienceReviewList(page);
			int allCount = reviewService.audienceReviewCount();
			dto = paging.getPaging(allCount, page);
			model.addAttribute("paging", dto);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "review/ReviewList";
		} else {
			list = reviewService.expertReviewList(page);
			int allCount = reviewService.expertReviewCount();
			dto = paging.getPaging(allCount, page);
			model.addAttribute("paging", dto);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			return "review/ReviewList";
		}
	}

	// 
	@RequestMapping(value = "/review_MovieSelect.do", method = RequestMethod.POST)
	public String aSearchListgo(HttpServletRequest request, MoviePageDTO moviepagedto,
			@RequestParam("title") String title, Model model,
			@RequestParam(value = "sort", defaultValue = "null") String sort) {

		if (sort.equals("audience")) {
			List<MoviePageDTO> list = reviewService.areviewMovieSelectSearch(title);
			model.addAttribute(sort);
			model.addAttribute("list", list);
			return "review/review_MovieSelect";
		} else {
			List<MoviePageDTO> list = reviewService.reviewMovieSelectSearch(title);
			model.addAttribute(sort);
			model.addAttribute("list", list);
			return "review/review_MovieSelect";
		}
	}

	@RequestMapping(value = "/review_MovieSelect.do", method = RequestMethod.GET)
	public String aSearchList(HttpServletRequest request, Model model,
			@RequestParam(value = "sort", defaultValue = "null") String sort) {
		if (sort.equals("audience")) {
			model.addAttribute(sort);
			return "review/review_MovieSelect";
		} else {
			model.addAttribute(sort);
			return "review/review_MovieSelect";
		}
	}

	// �
	@RequestMapping(value = "/ReviewContent.do", method = RequestMethod.GET)
	public String ListContent(ReviewDTO reviewdto, @Param("review_no") int review_no, Model model,
			@RequestParam(value = "sort", defaultValue = "null") String sort) {
		if (sort.equals("audience")) {
			ReviewDTO dto = reviewService.audienceReviewContent(review_no);
			System.out.println("dto:" + dto);
			model.addAttribute("dto", dto);
			return "review/ReviewContent";
		} else {
			ReviewDTO dto = reviewService.expertReviewContent(review_no);
			System.out.println("dto:" + dto);
			model.addAttribute("dto", dto);
			return "review/ReviewContent";
		}
	}

	// 
/*	@RequestMapping(value = "/ReviewSearch.do", method = RequestMethod.POST)
	public String SearchListgo(HttpServletRequest request, ReviewDTO reviewdto, @RequestParam("title") String title,
			Model model, @RequestParam(value = "sort", defaultValue = "null") String sort,
			@RequestParam("movie_no") int movie_no) 
	{
		if (sort.equals("audience")) {
			return SearchList(request, reviewdto, title, model, sort,movie_no);
		} else {
			return SearchList(request, reviewdto, title, model, sort,movie_no);
		}
	}*/

	@RequestMapping(value = "/ReviewSearch.do", method = RequestMethod.GET)
	public String SearchList(HttpServletRequest request, ReviewDTO reviewdto, @RequestParam(value="title") String title,
			Model model, @RequestParam(value = "sort", defaultValue = "null") String sort) 
	{	
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			}
		List<ReviewDTO> list=null;
		List<ReviewDTO> plist=null;
		Paging paging = Paging.getInstance();
		PagingDTO dto = null;
		if (sort.equals("audience")) {
			list = reviewService.audienceReviewSearch(title,page);
			int SCount = reviewService.audienceReviewCountSearch(title);
			paging = Paging.getInstance();
			dto = paging.getPaging(SCount, page);
			model.addAttribute("paging", dto);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute(sort);
			return "review/ReviewList";
		} else {
			list = reviewService.expertReviewSearch(title,page);
			int SCount = reviewService.expertReviewCountSearch(title);
			paging = Paging.getInstance();
			dto = paging.getPaging(SCount, page);
			model.addAttribute("paging", dto);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute(sort);
			return "review/ReviewList";
		}
	}
	// 
	@RequestMapping(value="ReviewList.do",method =RequestMethod.POST)
	public String Delete(int review_no,Model model,
	@RequestParam(value = "review_no") int reveiw_no,
	@RequestParam(value = "sort", defaultValue = "null") String sort)
	{	
		if(sort.equals("audience")){
			System.out.println(review_no);
			int result = reviewService.audienceReviewDelete(review_no);
			model.addAttribute(sort);
			return "redirect:ReviewList.do?sort=audience";
		}
		else{
			System.out.println(review_no);
			int result = reviewService.expertReviewDelete(review_no);
			return "redirect:ReviewList.do";
		}
	}
}
