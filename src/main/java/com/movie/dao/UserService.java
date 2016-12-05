package com.movie.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.dto.UserDTO;
public class UserService {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(UserDTO dto) {
		return sqlSession.insert("Board.insertBoard",dto);
	}
	public String select(UserDTO dto) {
		return sqlSession.selectOne("Board.selectpassword",dto);
	}
	public int update(UserDTO dto) {
		return sqlSession.update("Board.updateBoard",dto);
	}
	
	public int delete(UserDTO dto) {
		return sqlSession.update("Board.deleteBoard",dto);
	}
}
