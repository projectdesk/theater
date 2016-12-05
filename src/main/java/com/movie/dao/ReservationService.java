package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.DateDTO;
import com.movie.dto.SelectMovieDTO;
import com.movie.dto.UserDTO;

public class ReservationService {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertUser(UserDTO dto){
		sqlSession.insert("ReservationMapper.insertUser",dto);
		return 1;
	}

//	public void insertSeat(ReservationDTO dto) {
//		int no=sqlSession.selectOne("boardMapper.selectSeat",dto);
//		System.out.println(no+":no");
//		if(no==0)
//		sqlSession.insert("boardMapper.insertSeat",dto);
//	}

	public List selectTheater(String movie) {
		return sqlSession.selectList("ReservationMapper.selectTheater",movie);
	}
	
	public List selectMovie(SelectMovieDTO dto){
		return sqlSession.selectList("ReservationMapper.selectMovie",dto);
	}

	public List selectDate(DateDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReservationMapper.selectDate",dto);
	}
	
	public List selectSeat(int no) {
		return sqlSession.selectList("ReservationMapper.selectAreadySeat",no);
	}

	public List selectTime(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReservationMapper.selectTime",no);
	}

	public List selectFirstTheater() {
		return sqlSession.selectList("ReservationMapper.selectFirstTheater");
	}
	public List selectFirstMovie() {
		return sqlSession.selectList("ReservationMapper.selectFirstMovie");
	}

	

	
	
}
