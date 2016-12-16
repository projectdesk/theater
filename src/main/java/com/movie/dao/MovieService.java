package com.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.MoviePageDTO;

public class MovieService {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	/*
	 *  ��ȭ������������
	 */

	
	/*
	 *  ��ȭ������������
	 */

	public MoviePageDTO movieInfoSelect(int no) {
		MoviePageDTO dto=sqlSession.selectOne("movieMapper.movieDetailPage", no);
		if(dto!=null){
			sqlSession.selectOne("movieMapper.updateMovieHit", no);
		}
		return dto;
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


	public List selectBestMovie() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("movieMapper.selectBestMovie");
	}


	public List moviePageInfoByDate(int page, String today,String sort) {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		page = (page - 1) * 15;
		map.put("page", page);
		map.put("today", today);
		if(sort.equals(""))//전체영화
		return sqlSession.selectList("movieMapper.moviePageList", page);
		else if(sort.equals("now")){//개봉작
			return sqlSession.selectList("movieMapper.selectMovieListNow",map);
		}
		else{//개봉예정작
		return sqlSession.selectList("movieMapper.selectMovieListComming",map);
		}
	}


	public int movieCountAll(String today) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.movieCountAll", today);
	}


	public int movieCountNow(String today) {
		// TODO Auto-generated method stub
		return  sqlSession.selectOne("movieMapper.movieCountNow", today);
	}


	public int movieCountComming(String today) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("movieMapper.movieCountComming", today);
	}
}
