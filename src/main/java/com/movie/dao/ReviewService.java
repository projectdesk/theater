package com.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.MoviePageDTO;
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
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.audienceList",page);
		return list;
	}
	public ReviewDTO audienceReviewContent(int review_no){
		ReviewDTO dto=sqlSession.selectOne("reviewMapper.audienceContent",review_no);
		sqlSession.update("reviewMapper.audenceHit",review_no);
		return dto;
	}
	//�˻�
	public List<ReviewDTO> audienceReviewSearch(String title,int page){
		title = "%"+title+"%";
		page=(page-1)*5;
		ReviewDTO dto =new ReviewDTO();
		dto.setMovie_no(page);
		dto.setTitle(title);
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.audienceSearch",dto);
		return list;
	}
	public int audienceReviewCount(){
		return sqlSession.selectOne("reviewMapper.audienceCount");
	}
	public int audienceReviewCountSearch(String title){
		title = "%"+title+"%";
		return sqlSession.selectOne("reviewMapper.audienceCountSearch",title);
	}
	public int audienceReviewDelete(int review_no){
		return sqlSession.delete("reviewMapper.audienceDelete",review_no);
	}
	public List<MoviePageDTO> areviewMovieSelectSearch(String title){
		title = "%"+title+"%";
		List<MoviePageDTO> list = sqlSession.selectList("reviewMapper.audience_movieSelectSearch",title);
		return list;
	}
	
	
	//������
	public void expertReviewWrite(ReviewDTO dto){
		sqlSession.insert("reviewMapper.expertWrite",dto);
	}
	public List<ReviewDTO> expertReviewList(int page){
		page=(page-1)*5;
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.expertList",page);
		return list;
	}
	public ReviewDTO expertReviewContent(int review_no){
		ReviewDTO dto=sqlSession.selectOne("reviewMapper.expertContent",review_no);
		sqlSession.update("reviewMapper.expertHit",review_no);
		return dto;
	}
	public List<ReviewDTO> expertReviewSearch(String title,int page){
		title = "%"+title+"%";
		page=(page-1)*5;
		ReviewDTO dto =new ReviewDTO();
		dto.setMovie_no(page);
		dto.setTitle(title);
		List<ReviewDTO> list = sqlSession.selectList("reviewMapper.expertSearch",dto);
		return list;
	}
	//////////////////<------- ���⼭���� �պ���
	public int expertReviewCount(){
		return sqlSession.selectOne("reviewMapper.expertCount");
	}
	public int expertReviewCountSearch(String title){
		title = "%"+title+"%";
		return sqlSession.selectOne("reviewMapper.expertCountSearch",title);
	}
	public int expertReviewDelete(int review_no){
		return sqlSession.delete("reviewMapper.expertDelete",review_no);
	}
	
	//��ȭ ã��
	public List<MoviePageDTO> reviewMovieSelectSearch(String title){
		title = "%"+title+"%";
		List<MoviePageDTO> list = sqlSession.selectList("reviewMapper.expert_movieSelectSearch",title);
		return list;
	}
}
