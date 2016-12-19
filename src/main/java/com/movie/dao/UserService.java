package com.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.FindPwDTO;
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

	public String selectUserPass(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.selectUserPass",id);
	}

	public int updateUserPass(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("UserMapper.updateUserPass",map);
	}

	public UserDTO selectUserInfo(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.selectUserInfo",id);
	}

	public int updateUserInfo(UserDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("UserMapper.updateUserInfo",dto);
	}

	public String selectUserId(Map map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.selectUserId",map);
	}

	public String selectUserPw(FindPwDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.selectUserPw",dto);
	}

	
}
