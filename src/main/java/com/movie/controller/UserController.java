package com.movie.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.dao.UserService;
import com.movie.dto.FindPwDTO;
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
		if (resert > 0) {
			System.out.println("register success");
		} else {
			System.out.println("register failed");
		}
		/* model.addAttribute("serverTime", formattedDate ); */

		return "home";
	}

	@ResponseBody
	@RequestMapping(value = "/idcheck.do", method = RequestMethod.GET)
	public boolean idcheck(@Param("id") String id, Model model) {
		int result = userService.selectId(id);
		if (result == 0)// id no searched
			return true;
		else// id searched
			return false;

	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login1(@Param("id") String id, @Param("password") String password, HttpSession session,
			HttpServletRequest request,Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		int result = userService.selectLoginInfo(map);
		if (result > 0) {
			System.out.println("로그인성공");
			session.setAttribute("id", id);
			model.addAttribute("refresh","true");
			return "redirect:" + request.getHeader("Referer");
		} else {
			System.out.println("로그인실패");
			return "redirect:" + request.getHeader("Referer");
		}

	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		return "home";
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		List list = userService.selectReservations(id);
		Long no = 0L, preno = 0L;
		int val = 0;
		int j=0;
		int k=0;
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			no = (Long) map.get("no");
			System.out.println(i+":no : " + no + "preno:" + preno);
			// 한번에 예약한 좌석 묶어서 출력
			if (preno == no) {
				System.out.println("test");
				val = (Integer) map.get("seat");
				((Map) list.get(j)).put("seat", ((Map) list.get(j)).get("seat").toString() + "," + val);
				list.remove(i);
				--i;
				System.out.println("removed");
			}
			else{
				j=i;
			}
			preno = (Long) map.get("no");
		}
		System.out.println(list);
		model.addAttribute("reservations", list);
		return "myPage";
	}

	@RequestMapping(value = "/mod_userpass.do", method = RequestMethod.POST)
	public String modUser(@Param("nowPassword") String nowPassword, @Param("newPassword") String newPassword,
			@Param("confirmPassword") String confirmPassword, Map<String, String> map, HttpSession session,
			Model model) {
		map.put("id", (String) session.getAttribute("id"));
		map.put("newPassword", newPassword);
		int result = userService.selectUserPass((String) session.getAttribute("id"), nowPassword);
		if (result > 0 && newPassword.equals(confirmPassword))
			userService.updateUserPass(map);
		return "modUser";
	}

	@RequestMapping(value = "/mod_user.do", method = RequestMethod.POST)
	public String modUserPass(@Param("password") String password, UserDTO dto, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		int result = userService.selectUserPass(id, password);
		if (result > 0) {
			model.addAttribute("passwordCheck", true);
			dto = userService.selectUserInfo(id);
			model.addAttribute("user", dto);
		}
		return "modUser";
	}

	@RequestMapping(value = "/moduser.do", method = RequestMethod.GET)
	public String modUser(HttpSession session, Model model) {
		return "modUser";
	}

	@RequestMapping(value = "/update_user.do", method = RequestMethod.POST)
	public String update_user(UserDTO dto, HttpSession session, Model model) {
		System.out.println(dto);
		dto.setId((String) session.getAttribute("id"));
		int result = userService.updateUserInfo(dto);
		if (result > 0) {
			System.out.println("업데이트완료");
		}
		return "modUser";
	}

	@RequestMapping(value = "/modpass.do", method = RequestMethod.GET)
	public String modPass(HttpSession session, Model model) {
		return "modPass";
	}
	@RequestMapping(value = "/findidpw.do", method = RequestMethod.GET)
	public String findIdPw(HttpSession session, Model model) {
		return "findIdPw";
	}
	@RequestMapping(value = "/findid.do", method = RequestMethod.POST)
	public String findidpw(@RequestParam("id")String id,
			@RequestParam("email")String email,Map map,
			Model model) {
		map.put("id", id);
		map.put("email", email);
		String result = userService.selectUserId(map);
		if(result!=null){
			System.out.println("아이디찾기성공");
			int size=result.length();
			result=result.substring(0, 2);
			for (int i = 2; i < size; i++) {
				result+="*";
			}
			model.addAttribute("id",result);
		}else{
			model.addAttribute("id","false");
		}
		return "findIdPw";
	}
		
		@RequestMapping(value = "/findpw.do", method = RequestMethod.POST)
	public String findidpw(FindPwDTO dto,Model model) {
		String result = userService.selectUserPw(dto);
		if(result!=null){
			System.out.println("비밀번호찾기 성공");
			int size=result.length();
			result=result.substring(0, 2);
			for (int i = 2; i < size; i++) {
				result+="*";
			}
			model.addAttribute("password",result);
		}else{
			model.addAttribute("password","false");
		}
		return "findIdPw";
	}

}
