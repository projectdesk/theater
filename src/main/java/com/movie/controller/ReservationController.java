package com.movie.controller;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.BoardService;
import com.movie.dto.reservationDTO;

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
	public String resservationPost(reservationDTO dto, Model model) {
		String[] array=dto.getSeat().split(",");
		for(int i=0;i<array.length;i++){
			System.out.println(array[i]);
			BoardService.insertSeat(array[i]);
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
	

}
