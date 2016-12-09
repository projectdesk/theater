package com.movie.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.movie.dto.MoviePageDTO;

public class MovieService {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	/*
	 *  ��ȭ������������
	 */

	public List<MoviePageDTO> moviePageInfo(int page) {
		page = (page - 1) * 12;
		System.out.println(page);
		List<MoviePageDTO> list = sqlSession.selectList("movieMapper.moviePageList", page);
		return list;
	}
	
	
	/*
	 *  ��ȭ������������
	 */

	public MoviePageDTO movieInfoSelect(int no) {

		return sqlSession.selectOne("movieMapper.movieDetailPage", no);
	}


	/*
	 *  ��ȭ�����Է�����
	 */

	public void insertMovieInfo(MoviePageDTO dto) {

		sqlSession.insert("movieMapper.movieWrite", dto);
	}

	public void moviePosterInsert(MoviePageDTO dto) {

		sqlSession.insert("movieMapper.moviePosterInsert", dto);
	}
}
