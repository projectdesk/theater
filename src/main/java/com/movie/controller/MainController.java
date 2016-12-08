package com.movie.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.dao.TheaterService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	@Autowired
	TheaterService theaterService;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@RequestMapping(value = "/theater.do", method = RequestMethod.GET)
	public String selectTheater(Model model) {
		List list=theaterService.selectTheater();
		System.out.println(list);
		model.addAttribute("theaters",list);
		return "theater";
	}
	@RequestMapping(value = "/helpCenter", method = RequestMethod.GET)
	public String helpCenter(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "helpCenter";
	}
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public String review(Locale locale, Model model) {
		return "redirect:expert_ReviewList.do";
	}
	
}
