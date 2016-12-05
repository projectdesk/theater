package com.movie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.dto.MovieInsertDTO;
public class EtcService {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public void insertMovieAll(MovieInsertDTO dto){
		int result;
		result=insertMovie(dto.getMovie());
		System.out.println("영화등록성공");
		int no=selectMovieNo(dto.getMovie());
		System.out.println("movie_no"+no);
		dto.setNo(no);
		result=insertAvailTheater(dto);
		if(result>0)
		System.out.println("상영가능영화관 등록성공");
		if(result>0)
		result=insertDate(dto);
		System.out.println("날짜지정성공");
		int date_no=selectDateNo(dto.getNo());
		if(date_no>0)
		System.out.println("date_no 겟");
		dto.setDate_no(date_no);
		result=insertTime(dto);
		if(result>0)
		System.out.println("시간지정송공");
		
	}
	public int insertMovie(String name){
		return sqlSession.insert("EtcMapper.insertMovie",name);
	}
	public int selectMovieNo(String name){
		return sqlSession.selectOne("EtcMapper.selectMovieNo",name);
	}	
	public int insertAvailTheater(MovieInsertDTO dto){
		return sqlSession.insert("EtcMapper.insertAvailTheater",dto);
	}	
	public int insertDate(MovieInsertDTO dto){
		return sqlSession.insert("EtcMapper.insertDate",dto);
	}	
	public int selectDateNo(int no){
		return sqlSession.selectOne("EtcMapper.selectDateNo",no);
	}	
	public int insertTime(MovieInsertDTO dto){
		return sqlSession.insert("EtcMapper.insertTime",dto);
	}	
}
