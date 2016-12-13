package com.movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.movie.dto.DateDTO;
import com.movie.dto.ReservationDTO;
import com.movie.dto.SelectMovieDTO;

public class ReservationService {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	public void insertSeat(ReservationDTO dto) {
		//2차검사 seat이 의 중족검사
		System.out.println("1: "+dto.getSeat());
		System.out.println("2: "+dto.getTime_no());
		System.out.println("3: "+dto.getUser());
		int no=sqlSession.selectOne("ReservationMapper.selectSeat",dto);
			System.out.println(no+":no");
		if(no==0){
			sqlSession.insert("ReservationMapper.insertSeat",dto);
			sqlSession.update("ReservationMapper.updateRemain",dto.getTime_no());
		}
	}

	public List selectTheater(String movie) {
		return sqlSession.selectList("ReservationMapper.selectTheater",movie);
	}
	
	public List selectMovie(SelectMovieDTO dto){
		return sqlSession.selectList("ReservationMapper.selectMovie",dto);
	}

	public List selectDate(DateDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReservationMapper.selectDate",dto);
	}
	
	public List selectSeat(int no) {
		return sqlSession.selectList("ReservationMapper.selectAreadySeat",no);
	}

	public List selectTime(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ReservationMapper.selectTime",no);
	}

	public List selectFirstTheater() {
		return sqlSession.selectList("ReservationMapper.selectFirstTheater");
	}
	public List selectFirstMovie(String today) {
		return sqlSession.selectList("ReservationMapper.selectFirstMovie",today);
	}


	public int deleteReservation(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("ReservationMapper.deleteReservation",no);
	}


	public int updateSeatNum(int no, int result) {
		// TODO Auto-generated method stub
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("no", no);
		map.put("result", result);
		return sqlSession.update("ReservationMapper.updateSeatNum",map);
	}
	
	
}
