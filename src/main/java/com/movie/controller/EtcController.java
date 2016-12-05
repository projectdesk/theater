package com.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.dao.EtcService;
import com.movie.dto.MovieInsertDTO;
@Controller
public class EtcController {
	@Autowired
	EtcService etcService;
	
	@RequestMapping(value = "/insertmovie.do", method = RequestMethod.GET)
	public String insertMovieForm(Model model) {
		return "movieInsert";
	}
	
	@RequestMapping(value = "/insertmovie.do", method = RequestMethod.POST)
	public String insertMovie(MovieInsertDTO dto,Model model) {
		etcService.insertMovieAll(dto);
//		model.addAttribute("theaters",theater);
		return "movieInsert";
	}
}
