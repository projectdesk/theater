package com.movie.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.BoardService;
import com.movie.dto.ReservationDTO;
import com.movie.dto.ViewingTimeDTO;

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
	public String reservationGet(Locale locale, Model model) {
		return "reservation";
	}
	
	@RequestMapping(value = "/reservation.do", method = RequestMethod.POST)
	public String resservationPost(ReservationDTO dto, Model model) {
		String[] array=dto.getSeat().split(",");
		for(int i=0;i<array.length;i++){
			System.out.println(array[i]);
			dto.setSeat(array[i]);
			BoardService.insertSeat(dto);
		}
		
		return "reservation";
	}
	@ResponseBody
	@RequestMapping(value = "/getroom.do", method = RequestMethod.GET)
	public  Object getRoom(@Param("theater")String theater , Model model) {
		System.out.println(theater);
		List room=BoardService.selectRoom(theater);
		System.out.println(room);
		return room;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getmovie.do", method = RequestMethod.GET)
	public  Object getMovie(@Param("room_idx")String room_idx,HttpServletResponse response , Model model) throws UnsupportedEncodingException {
		System.out.println("test");
		System.out.println(room_idx);
		List movie=BoardService.selectMovie(Integer.parseInt(room_idx));
		System.out.println(((ViewingTimeDTO)movie.get(0)).getMovie_name());
		return movie;
	}
	@ResponseBody
	@RequestMapping(value = "/getseat.do", method = RequestMethod.GET)
	public  Object getSeat(@Param("viewing_id")String viewing_id,HttpServletResponse response , Model model) throws UnsupportedEncodingException {
		System.out.println("test");
		System.out.println(viewing_id);
		Object movie=BoardService.selectSeat(Integer.parseInt(viewing_id));
		return movie;
	}

}
