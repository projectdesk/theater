package com.movie.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.dao.UserService;
import com.movie.dto.UserDTO;
@Controller
public class UserController {
	@Autowired
	UserService BoardService;
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String inputForm1(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "register";
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String inputForm2(UserDTO dto, Model model) {
		int resert = BoardService.insert(dto);
		if (resert>0){
			System.out.println("�꽦怨듯븯���뒿�땲�떎.");
		}else{
			System.out.println("�떎�뙣�븯���뒿�땲�떎.");
	}
		/*model.addAttribute("serverTime", formattedDate );*/
		
		return "home";
	}
}
