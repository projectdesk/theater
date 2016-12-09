package com.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.movie.util.HelpCenterPaging;

@Controller
public class HelpCenterController {
	private static final Logger logger = LoggerFactory.getLogger(HelpCenterController.class);

	@Autowired
	HelpCenterService BoardService;

	// =====================================질문=====================================

	// 입력
	@RequestMapping(value = "/question.do", method = RequestMethod.GET)
	public String insertgo() {
		// ResultSet re;

		return "helpCenter/question";

	}// end insertgo

	@RequestMapping(value = "/question.do", method = RequestMethod.POST)
	public String insert(QuestionDTO questdto, Model model, HttpServletRequest request) {
		BoardService.insertQuestion(questdto);
		return List(model, request);

	}// end insert

	// 리스트
	@RequestMapping(value = "/helpcenter.do", method = RequestMethod.GET)
	public String List(Model model, HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List list = BoardService.selectQuestion(page);
		int allCount = BoardService.countQuestion();
		HelpCenterPaging helpCenterPaging = HelpCenterPaging.getInstance();
		PagingDTO dto = helpCenterPaging.getPaging(allCount, page);
		model.addAttribute("paging", dto);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "helpCenter/List";

	}// end insert

	// 질문글 확인
	@RequestMapping(value = "/questionok.do", method = RequestMethod.GET)
	public String LIstok(QuestionDTO questdto, @Param("no") int no, Model model, Qeustion_answerDTO quest_answerdto,
			@Param("question_no") int question_no) {
		QuestionDTO dto = BoardService.selectQuestionok(no);
		Qeustion_answerDTO sdto = BoardService.selectAnswerok(question_no);
		model.addAttribute("sdto", sdto);
		model.addAttribute("dto", dto);
		System.out.println("sdto코노오오온트롤 :" + sdto);
		System.out.println("dto코노오오온트롤 :" + dto);

		return "helpCenter/questionok";
	}// end Listok

	// 글검색
	@RequestMapping(value = "/ListSearch.do", method = RequestMethod.POST)
	public String ListSearchgo(HttpServletRequest request, QuestionDTO qdto, @RequestParam("kinds") String kinds,
			Model model) {
		return ListSearch(request, qdto, kinds, model);
	}// end of ListSearchgo

	// 검색글 리스트
	@RequestMapping(value = "/ListSearch.do", method = RequestMethod.GET)
	public String ListSearch(HttpServletRequest request, QuestionDTO qdto, @RequestParam("kinds") String kinds,
			Model model) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		List<QuestionDTO> slist = BoardService.selectQuestionSerch2(page);
		List<QuestionDTO> plist = BoardService.selectQuestionSerch(kinds);
		int SCount = BoardService.countQuestionSerch();
		System.out.println("slist : " + slist);
		System.out.println("plist : " + plist);
		HelpCenterPaging helpCenterPaging = HelpCenterPaging.getInstance();
		PagingDTO qgto = helpCenterPaging.getPaging(SCount, page);
		model.addAttribute("paging", qgto);
		model.addAttribute("slist", slist);
		model.addAttribute("plist", plist);
		model.addAttribute("page", page);
		return "helpCenter/ListSearch";
	}// end of ListSearch

	// 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public String deleteForm(QuestionDTO dto, Model model) throws IOException {
		model.addAttribute("no", dto.getNo());
		return "helpCenter/deleteQuestion";
	}

	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public void delete(QuestionDTO dto, HttpServletResponse response) throws IOException {
		int result = BoardService.deleteQuestion(dto);
		if (result > 0)
			System.out.println("delete success");
		else
			System.out.println("delete failed");
		response.sendRedirect("helpcenter.do");
	}// end of delete

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
		response.sendRedirect("List.do");
	}// end insert_answer

	// 답변보기
	@RequestMapping(value = "/answerok.do", method = RequestMethod.GET)
	public String answerok(Qeustion_answerDTO quest_answerdto, QuestionDTO questdto,
			@Param("question_no") int question_no, Model model) {
		Qeustion_answerDTO sdto = BoardService.selectAnswerok(question_no);
		System.out.println(question_no + "question_no");
		System.out.println("dto코노오오온트롤 :" + sdto);
		model.addAttribute("sdto", sdto);
		return "helpCenter/answerok";
	}// end answerok
		// 답변보기


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
		response.sendRedirect("List.do");
	}// end of update

	// =====================================자주찾는글=====================================

	// 자주찾는글 쓰기
	@RequestMapping(value = "/ListBest_insert.do", method = RequestMethod.GET)
	public String insertFrequencyQuestiongo() {
		// ResultSet re;

		return "helpCenter/ListBest_insert";

	}// end inserfrequency_question_insertgotgo

	@RequestMapping(value = "/ListBest_insert.do", method = RequestMethod.POST)
	public String insertFrequencyQuestion(QuestionDTO questdto, Model model, HttpServletRequest request) {
		BoardService.insertFrequencyQuestion(questdto);
		System.out.println("프리퀀시이이이이" + questdto);
		return ListBest(model, request);
	}// end frequency_question_insert

	// 자주찾는글 리스트
	@RequestMapping(value = "/ListBest.do", method = RequestMethod.GET)
	public String ListBest(Model model, HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));

		}
		List flist = BoardService.selectFrequencyQuestion(page);
		int allCount = BoardService.countFrequencyQuestion();
		HelpCenterPaging helpCenterPaging = HelpCenterPaging.getInstance();
		PagingDTO dto = helpCenterPaging.getPaging(allCount, page);
		model.addAttribute("paging", dto);
		model.addAttribute("flist", flist);
		model.addAttribute("page", page);
		return "helpCenter/ListBest";
	}// end ListBest

}// end of class
