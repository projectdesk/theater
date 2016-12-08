package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

public class TheaterService {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List selectTheater(){
		return sqlSession.selectList("TheaterMapper.selectTheater");
	}
}
