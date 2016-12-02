package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.MovieName;
import com.movie.dto.ReservationDTO;
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

	public void insertSeat(ReservationDTO dto) {
		int no=sqlSession.selectOne("boardMapper.selectSeat",dto);
		System.out.println(no+":no");
		if(no==0)
		sqlSession.insert("boardMapper.insertSeat",dto);
	}

	public List selectRoom(MovieName dto) {
		return sqlSession.selectList("boardMapper.selectRoom",dto);
	}
	
	public List selectMovie(String theater){
		return sqlSession.selectList("boardMapper.selectMovie",theater);
	}

	public Object selectSeat(int viewing_id) {
		return sqlSession.selectList("boardMapper.selectAreadySeat",viewing_id);
	}
	
}
