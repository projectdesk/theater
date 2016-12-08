package com.movie.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.movie.dto.UserDTO;
public class UserService {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insertUser(UserDTO dto) {
		return sqlSession.insert("UserMapper.insertUser",dto);
	}
//	
	public int selectId(String id) {
		return sqlSession.selectOne("UserMapper.selectId",id);
	}
//	
//	public String select(UserDTO dto) {
//		return sqlSession.selectOne("UserMapper.selectpassword",dto);
//	}
//	public int update(UserDTO dto) {
//		return sqlSession.update("UserMapper.updateUserMapper",dto);
//	}
//	
//	public int delete(UserDTO dto) {
//		return sqlSession.update("UserMapper.deleteUserMapper",dto);
//	}

	public int selectLoginInfo(HashMap map) {
		return sqlSession.selectOne("UserMapper.selectLoginInfo",map);
	}

	public List selectReservations(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("UserMapper.selecReservations",id);
	}
}
