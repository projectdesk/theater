package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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

	public void insertSeat(String seat) {
		sqlSession.insert("boardMapper.insertSeat",seat);
		
	}

	public List selectRoom(String theater) {
		return sqlSession.selectList("boardMapper.selectRoom",theater);
	}
	
}
