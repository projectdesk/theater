package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.movie.dao.HelpCenterService;
import com.movie.dto.PagingDTO;
import com.movie.dto.Qeustion_answerDTO;
import com.movie.dto.QuestionDTO;
import com.movie.util.Paging;

@Controller
public class HelpCenterController {
	@Autowired
	HelpCenterService BoardService;

	// =====================================질문=====================================
	// 리스트
	@RequestMapping(value = "/helpcenter.do", method = RequestMethod.GET)
	public String List(Model model, HttpServletRequest request, HttpSession session) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int allCount = 0;
		Paging paging = Paging.getInstance();
		PagingDTO dto = null;
		List list = null;
		String id = (String) session.getAttribute("id");
		list = BoardService.selectQuestion(page, id);
		allCount = BoardService.countQuestion(id);
		dto = paging.getPaging(allCount, page);
		model.addAttribute("list",list);
		model.addAttribute("paging", dto);
		model.addAttribute("page", page);
		return "helpCenter/List";

	}// end insert

	// 입력
	@RequestMapping(value = "/question.do", method = RequestMethod.GET)
	public String insertgo(HttpSession session) {
		if (session.getAttribute("id") != null)
			return "helpCenter/question";
		else
			return "redirect:helpcenter.do";
	}// end insertgo

	@RequestMapping(value = "/question.do", method = RequestMethod.POST)
	public String insert(QuestionDTO questdto, Model model, HttpServletRequest request, String kinds) {
		BoardService.insertQuestion(questdto);
		return "redirect:helpcenter.do";
	}// end insert

	// 질문글 확인
	@RequestMapping(value = "/question_view.do", method = RequestMethod.GET)
	public String LIstok(QuestionDTO questdto, @Param("no") int no, Model model, Qeustion_answerDTO quest_answerdto,
			@Param("question_no") int question_no) {
		QuestionDTO dto = BoardService.selectQuestionok(no);
		Qeustion_answerDTO sdto = BoardService.selectAnswerok(question_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("dto", dto);
		return "helpCenter/question_view";
	}// end Listok

	// 삭제
	@RequestMapping(value = "/question_delete.do", method = RequestMethod.GET)
	public String deleteForm(@RequestParam("no")String s_no, Model model) throws IOException {
		int no=Integer.parseInt(s_no);
		int result = BoardService.deleteQuestion(no);
		if(result>0)
			System.out.println("삭제완료");
		return "redirect:helpcenter.do";
	}


	// =====================================답변=====================================

	// 답변입력
	@RequestMapping(value = "/answer.do", method = RequestMethod.GET)
	public String insert_answergo() {
		// ResultSet re;

		return "helpCenter/answer";

	}// end insert_answergo

	@RequestMapping(value = "/answer.do", method = RequestMethod.POST)
	public void insert_answer(Qeustion_answerDTO answerDTO, HttpServletResponse response,
			@Param("question_no") int question_no, Model model) throws IOException {

		int result = BoardService.insertAnswer(answerDTO);
		if (result > 0) {
			BoardService.updateQuestion(question_no);
			System.out.println("update success");
		} else {
			System.out.println("update failed");
		}
		response.sendRedirect("helpcenter.do");
	}// end insert_answer

	// 답변 수정
	@RequestMapping(value = "/UpdateAnswer.do", method = RequestMethod.GET)
	public String modForm(Qeustion_answerDTO adto, @Param("question_no") Model model, int question_no) {

		model.addAttribute("question_no", adto.getQuestion_no());

		return "helpCenter/UpdateAnswer";
	}// end of answerupdate

	@RequestMapping(value = "/UpdateAnswer.do", method = RequestMethod.POST)
	public void modify(Qeustion_answerDTO adto, HttpServletResponse response) throws IOException {
		int result = BoardService.updateAnswer(adto);
		if (result > 0)
			System.out.println("update success");
		else
			System.out.println("update failed");
		response.sendRedirect("helpcenter.do");
	}// end of update

	// =====================================자주찾는글=====================================

	// 자주찾는글 쓰기
	@RequestMapping(value = "/ListBest_insert.do", method = RequestMethod.GET)
	public String insertFrequencyQuestiongo() {
		// ResultSet re;

		return "helpCenter/ListBest_insert";

	}// end inserfrequency_question_insertgotgo

	@RequestMapping(value = "/ListBest_insert.do", method = RequestMethod.POST)
	public String insertFrequencyQuestion(QuestionDTO questdto, Model model, HttpServletRequest request, String kinds) {
		BoardService.insertFrequencyQuestion(questdto);
		return "redirect:ListBest.do";
	}// end frequency_question_insert

	// 자주찾는글 리스트
	@RequestMapping(value = "/ListBest.do", method = RequestMethod.GET)
	public String ListBest(Model model, HttpServletRequest request,
			@RequestParam(value = "kinds", defaultValue = "null") String kinds,
			@RequestParam(value = "keyword", defaultValue = "null") String keyword) {
		int page = 1;
		List klist = null;
		List flist = null;
		Paging paging = Paging.getInstance();
		PagingDTO dto = null;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if (!kinds.equals("null")) {// 분류있을때
			klist = BoardService.selectFrequencyQuestionSerch(kinds,page);
			flist = BoardService.pageFrequencyQuestionSerch(kinds,page);
			int allCount = BoardService.countFrequencyQuestionSerch(kinds);
			System.out.println(allCount);
			dto = paging.getPaging(allCount, page);
			model.addAttribute("klist", klist);
		} else {// 분류없을때
			if (!keyword.equals("null")) {
				klist = BoardService.selectFrequencyList(keyword);
				int allCount = BoardService.selectFrequencyCount(keyword);
				dto = paging.getPaging(allCount, page);
				model.addAttribute("klist", klist);
			} else {
				flist = BoardService.selectFrequencyQuestion(page);
				int allCount = BoardService.countFrequencyQuestion();
				dto = paging.getPaging(allCount, page);
			}
			model.addAttribute("flist", flist);
		}
		model.addAttribute("paging", dto);
		model.addAttribute("page", page);
		return "helpCenter/ListBest";
	}// end ListBest
}// end of class
