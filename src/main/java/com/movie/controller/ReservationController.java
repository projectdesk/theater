package com.movie.controller;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.ReservationService;
import com.movie.dao.UserService;
import com.movie.dto.DateDTO;
import com.movie.dto.ReservationDTO;
import com.movie.dto.SelectMovieDTO;
import com.movie.util.GetToday;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReservationController {
	/**
	 
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	ReservationService reservationService;
	@Autowired
	UserService userService;
	@RequestMapping(value = "/reservation.do", method = RequestMethod.GET)
	public String reservationGet(Model model) {
		Calendar cal=Calendar.getInstance();
		String today=GetToday.getToday(cal);
		List theater=reservationService.selectFirstTheater();
		List movie=reservationService.selectFirstMovie(today);
		model.addAttribute("theaters",theater);
		model.addAttribute("movies",movie);
		return "reservation";
	}
	@RequestMapping(value = "/reservation.do", method = RequestMethod.POST)
	public String resservationPost(ReservationDTO dto,HttpSession session, Model model) {
		if(session.getAttribute("id")!=null)
		dto.setUser((String)session.getAttribute("id"));
		else 
		return "redirect:reservation.do";
		String[] array=dto.getSeat().split(",");
		for(int i=0;i<array.length;i++){
			System.out.println(array[i]);
			dto.setSeat(array[i]);
			reservationService.insertSeat(dto);
		}
		return "redirect:reservation.do?successed=true";
	}
	@ResponseBody
	@RequestMapping(value = "/getmovie.do", method = RequestMethod.GET)
	public  Object getRoom(SelectMovieDTO dto , Model model) {
		Calendar cal=Calendar.getInstance();
		String today=GetToday.getToday(cal);
		dto.setToday(today);
		dto.setToday(today);
		List movie=reservationService.selectMovie(dto);
		System.out.println(movie);
		return movie;
	}
	
	@ResponseBody
	@RequestMapping(value = "/gettheater.do", method = RequestMethod.GET)
	public  Object getMovie(@Param("movie")String movie , Model model) throws UnsupportedEncodingException {
		System.out.println("test");
		System.out.println(movie);
		List theater=reservationService.selectTheater(movie);
		return theater;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getdate.do", method = RequestMethod.GET)
	public  Object getDate(DateDTO dto, Model model) throws UnsupportedEncodingException {
		Calendar cal=Calendar.getInstance();
		String today=GetToday.getToday(cal);
		dto.setToday(today);
		System.out.println(today);
		List date=reservationService.selectDate(dto);
		System.out.println(date);
		return date;
	}
	
	@ResponseBody
	@RequestMapping(value = "/gettime.do", method = RequestMethod.GET)
	public  Object getTime(@Param("no")int no , Model model) throws UnsupportedEncodingException {
		System.out.println(no);
		List time=reservationService.selectTime(no);
		return time;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getseat.do", method = RequestMethod.GET)
	public  Object getSeat(@Param("no") int no,HttpServletResponse response , Model model) throws UnsupportedEncodingException {
		System.out.println(no);
		List seat=reservationService.selectSeat(no);
		return seat;
	}
	
	@RequestMapping(value = "/cancel_reserv.do", method = RequestMethod.GET)
	public  String cancel(@Param("no") int no,HttpServletResponse response , Model model) throws UnsupportedEncodingException {
		System.out.println(no);
		model.addAttribute("no",no);
		return "cancelCheck";
	}
	@RequestMapping(value = "/cancel_check.do", method = RequestMethod.POST)
	public  String cancelCheck(@RequestParam("no")String num,
		@Param("password") String password,
		HttpSession session , Model model) throws UnsupportedEncodingException {
		String id=(String)session.getAttribute("id");
		System.out.println("num: "+num);
		int no=Integer.parseInt(num);
		int result;
		String db_pass=userService.selectUserPass(id);
		if(db_pass.equals(password)){
			result=reservationService.deleteReservation(no);
			if(result>0){
				System.out.println("예약취소");
				result=reservationService.updateSeatNum(no,result);
				if(result>0)
					System.out.println("인원업데이트");;
				}
			else
					System.out.println("취소실패");
		}
		return "redirect:mypage.do";
	}
	
}
