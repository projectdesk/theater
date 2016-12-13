package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.Qeustion_answerDTO;
import com.movie.dto.QuestionDTO;

public class HelpCenterService {
	SqlSession sqlSession;

	// =================================질문===================================

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 질문글쓰기
	public void insertQuestion(QuestionDTO qdto) {
		sqlSession.insert("helpCenterMapper.insertQuestion", qdto);
	}// end of insertquestion

	// 질문글 확인

	public QuestionDTO selectQuestionok(int no) {
		QuestionDTO dto = sqlSession.selectOne("helpCenterMapper.selectQuestionok", no);
		return dto;
	}// end of selectquestionok

	// 페이징 리스트
	public List selectQuestion(int page) {
		// TODO Auto-generated method stub
		page = (page - 1) * 5;
		System.out.println(page);
		return sqlSession.selectList("helpCenterMapper.selectQuestion", page);
	}// end of selectNewsList

	// 리스트 페이지 수
	public int countQuestion() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("helpCenterMapper.countQuestion");
	}// end of selectAllCount
		// 유형별 검색 리스트

	public List<QuestionDTO> selectQuestionSerch(String kinds) {
		List<QuestionDTO> list = sqlSession.selectList("helpCenterMapper.selectQuestionSerch", kinds);
		return list;
	}// end of QuestionSearch
		// 유형별 검색 리스트

	public List<QuestionDTO> selectQuestionpage(int page) {
		page = (page - 1) * 5;
		System.out.println(page);
		List<QuestionDTO> list = sqlSession.selectList("helpCenterMapper.selectQuestion", page);
		return list;
	}// end of QuestionSearch
		// 검색 페이지 총 수

	public int countQuestionSerch() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("helpCenterMapper.countQuestionSerch");
	}// end of selectAllCount

	// 삭제
	public int deleteQuestion(QuestionDTO qdto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("helpCenterMapper.deleteQuestion", qdto);
	}

	// 답변여부 변경
	public int updateQuestion(int no) {
		return sqlSession.update("helpCenterMapper.updateQuestion", no);
	}// end of update

	// =================================답글===================================

	// 답글쓰기

	public int insertAnswer(Qeustion_answerDTO sdto) {
		return sqlSession.insert("helpCenterMapper.insertAnswer", sdto);
	}// end of insertanswer

	// 답글확인
	public Qeustion_answerDTO selectAnswerok(int question_no) {
		Qeustion_answerDTO sdto = sqlSession.selectOne("helpCenterMapper.selectAnswerok", question_no);
		return sdto;
	}// end of selectanswerok

	// 답글 수정
	public int updateAnswer(Qeustion_answerDTO adto) {
		// TODO Auto-generated method stub
		return sqlSession.update("helpCenterMapper.updateAnswer", adto);
	}

	// =================================자주찾는글===================================

	// 자주찾는글 쓰기
	public void insertFrequencyQuestion(QuestionDTO fdto) {
		sqlSession.insert("helpCenterMapper.insertFrequencyQuestion", fdto);
	}// end of frequency_question_insert
		// 자주찾는 글 리스트

	public List selectFrequencyQuestion(int page) {
		// TODO Auto-generated method stub
		page = (page - 1) * 5;
		System.out.println(page);
		return sqlSession.selectList("helpCenterMapper.selectFrequencyQuestion", page);
	}// end of frequency_question_List

	// 자주찾는글 갯수

	public int countFrequencyQuestion() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("helpCenterMapper.countFrequencyQuestion");
	}// end of countFrequencyQuestion

	// 자주찾는글 검색 리스트

	public List<QuestionDTO> selectFrequencyQuestionSerch(String kinds) {
		List<QuestionDTO> listserch = sqlSession.selectList("helpCenterMapper.serchFrequencyQuestion", kinds);
		return listserch;
	}// end of QuestionSearch

	// 검색 페이지 총 수

	public int countFrequencyQuestionSerch() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("helpCenterMapper.serchCountFrequencyQuestion");
	}// end of selectAllCount

	// 자주찾는글 페이징  
	public List<QuestionDTO> pageFrequencyQuestionSerch(int page) {
		page = (page - 1) * 5;
		System.out.println(page);
		List<QuestionDTO> list = sqlSession.selectList("helpCenterMapper.serchPagFrequencyQuestion", page);
		return list;
	}// end of QuestionSearch

}// end of class
