package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.UserDTO;
import com.movie.dto.ReservationDTO;

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

	public List selectRoom(String theater) {
		return sqlSession.selectList("boardMapper.selectRoom",theater);
	}
	
	public List selectMovie(int room_idx){
		return sqlSession.selectList("boardMapper.selectMovie",room_idx);
	}

	public Object selectSeat(int viewing_id) {
		return sqlSession.selectList("boardMapper.selectAreadySeat",viewing_id);
	}
	
}
