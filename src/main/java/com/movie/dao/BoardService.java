package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.DateDTO;
import com.movie.dto.SelectMovieDTO;
import com.movie.dto.UserDTO;

public class BoardService {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertUser(UserDTO dto){
		sqlSession.insert("boardMapper.insertUser",dto);
		return 1;
	}

//	public void insertSeat(ReservationDTO dto) {
//		int no=sqlSession.selectOne("boardMapper.selectSeat",dto);
//		System.out.println(no+":no");
//		if(no==0)
//		sqlSession.insert("boardMapper.insertSeat",dto);
//	}

	public List selectTheater(String movie) {
		return sqlSession.selectList("boardMapper.selectTheater",movie);
	}
	
	public List selectMovie(SelectMovieDTO dto){
		return sqlSession.selectList("boardMapper.selectMovie",dto);
	}

	public List selectDate(DateDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectDate",dto);
	}
	
	public List selectSeat(int no) {
		return sqlSession.selectList("boardMapper.selectAreadySeat",no);
	}

	public List selectTime(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectTime",no);
	}

	public List selectFirstTheater() {
		return sqlSession.selectList("boardMapper.selectFirstTheater");
	}
	public List selectFirstMovie() {
		return sqlSession.selectList("boardMapper.selectFirstMovie");
	}

	

	
	
}
