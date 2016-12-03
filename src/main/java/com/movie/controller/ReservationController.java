package com.movie.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.BoardService;
import com.movie.dto.DateDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReservationController {
	/**
	 
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	BoardService BoardService;
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public String reservationGet(Model model) {
		List theater=BoardService.selectFirstTheater();
		List movie=BoardService.selectFirstMovie();
		model.addAttribute("theaters",theater);
		model.addAttribute("movies",movie);
		return "reservation";
	}
	
//	@RequestMapping(value = "/reservation.do", method = RequestMethod.POST)
//	public String resservationPost(ReservationDTO dto, Model model) {
//		String[] array=dto.getSeat().split(",");
//		for(int i=0;i<array.length;i++){
//			System.out.println(array[i]);
//			dto.setSeat(array[i]);
//			BoardService.insertSeat(dto);
//		}
//		
//		return "reservation";
//	}
	@ResponseBody
	@RequestMapping(value = "/getmovie.do", method = RequestMethod.GET)
	public  Object getRoom(@Param("theater")String theater , Model model) {
		System.out.println(theater);
		List movie=BoardService.selectMovie(theater);
		System.out.println(movie);
		return movie;
	}
	
	@ResponseBody
	@RequestMapping(value = "/gettheater.do", method = RequestMethod.GET)
	public  Object getMovie(@Param("movie")String movie , Model model) throws UnsupportedEncodingException {
		System.out.println("test");
		System.out.println(movie);
		List theater=BoardService.selectTheater(movie);
		return theater;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getdate.do", method = RequestMethod.GET)
	public  Object getDate(DateDTO dto, Model model) throws UnsupportedEncodingException {
		List date=BoardService.selectDate(dto);
		System.out.println(date);
		return date;
	}
	
	@ResponseBody
	@RequestMapping(value = "/gettime.do", method = RequestMethod.GET)
	public  Object getTime(@Param("no")int no , Model model) throws UnsupportedEncodingException {
		System.out.println(no);
		List time=BoardService.selectTime(no);
		return time;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getseat.do", method = RequestMethod.GET)
	public  Object getSeat(@Param("no") int no,HttpServletResponse response , Model model) throws UnsupportedEncodingException {
		System.out.println(no);
		List seat=BoardService.selectSeat(no);
		return seat;
	}

}
