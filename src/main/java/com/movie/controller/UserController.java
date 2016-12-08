package com.movie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.UserService;
import com.movie.dto.UserDTO;
@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/register.do", method = RequestMethod.GET)
	public String inputForm1(Model model) {
		return "register";
	}
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String inputForm2(UserDTO dto, Model model) {
		System.out.println(dto.getZipcode());
		System.out.println(dto.getAddress1());
		System.out.println(dto.getAddress2());
		int resert = userService.insertUser(dto);
		if (resert>0){
			System.out.println("register success");
		}else{
			System.out.println("register failed");
	}
		/*model.addAttribute("serverTime", formattedDate );*/
		
		return "home";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.GET)
	public boolean idcheck(@Param("id") String id, Model model) {
		int result=userService.selectId(id);
		if(result==0)//id no searched
			return true;
		else//id searched
			return false;
	
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login( Model model) {
	return "login";
	}
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login1(@Param("id")String id,@Param("password")String password,HttpSession session, HttpServletRequest request) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		int result=userService.selectLoginInfo(map);
		if(result>0){
			System.out.println("로그인성공");
			session.setAttribute("id", id);
			return "redirect:" + request.getHeader("Referer");
		}
		else{
			System.out.println("로그인실패");
			return "redirect:" + request.getHeader("Referer");
		}
		
	}
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session,Model model) {
		session.invalidate();
		return "home";
	}
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(HttpSession session,Model model) {
		String id=(String)session.getAttribute("id");
		List reservations=userService.selectReservations(id);
		System.out.println(reservations);
		model.addAttribute("reservations",reservations);
		return "myPage";
	}
	
}
