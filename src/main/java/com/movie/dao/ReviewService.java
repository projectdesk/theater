package com.movie.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.movie.dto.ReviewDTO;

public class ReviewService {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//����
	
	//�۾���
	public void audienceReviewWrite(ReviewDTO dto){
		sqlSession.insert("reviewMapper.audienceWrite",dto);
	}
	//����Ʈ,����¡
	public List<ReviewDTO> audienceReviewList(int page){
		page=(page-1)*5;
		System.out.println(page);
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.audienceList",page);
		return list;
	}
	public ReviewDTO audienceReviewContent(int review_no){
		ReviewDTO dto=sqlSession.selectOne("reviewMapper.audienceContent",review_no);
		sqlSession.update("reviewMapper.audenceHit",review_no);
		return dto;
	}
	//�˻�
	public List<ReviewDTO> audienceReviewSearch(int movie_no){
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.audienceSearch",movie_no);
		return list;
	}
	public List<ReviewDTO> audienceReviewSearchPage(int page){
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.audienceSearch",page);
		return list;
	}
	public int audienceReviewCount(){
		return sqlSession.selectOne("reviewMapper.audienceCount");
	}
	public int audienceReviewCountSearch(){
		return sqlSession.selectOne("reviewMapper.audienceCountSearch");
	}
	public int audienceReviewDelete(ReviewDTO ddto){
		return sqlSession.delete("reviewMapper.audienceDelete",ddto);
	}
	
	
	//������
	public void expertReviewWrite(ReviewDTO dto){
		sqlSession.insert("reviewMapper.expertWrite",dto);
	}
	public List<ReviewDTO> expertReviewList(int page){
		page=(page-1)*5;
		System.out.println(page);
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.expertList",page);
		return list;
	}
	public ReviewDTO expertReviewContent(int review_no){
		ReviewDTO dto=sqlSession.selectOne("reviewMapper.expertContent",review_no);
		sqlSession.update("reviewMapper.expertHit",review_no);
		return dto;
	}
	public List<ReviewDTO> expertReviewSearch(int movie_no){
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.expertSearch",movie_no);
		return list;
	}
	public List<ReviewDTO> expertReviewSearchPage(int page){
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.expertSearch",page);
		return list;
	}
	public int expertReviewCount(){
		return sqlSession.selectOne("reviewMapper.expertCount");
	}
	public int expertReviewCountSearch(){
		return sqlSession.selectOne("reviewMapper.expertCountSearch");
	}
	public int expertReviewDelete(ReviewDTO ddto){
		return sqlSession.delete("reviewMapper.expertDelete",ddto);
	}
	
}
