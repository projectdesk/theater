package com.movie.dto;

public class QuestionDTO {
    
	int no;
	String title;
	String content;
	String writer;
	String wdate;
	String check_answer;
	String kinds;
	
	
	public String getKinds() {
		return kinds;
	}
	public void setKinds(String kinds) {
		this.kinds = kinds;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getCheck_answer() {
		return check_answer;
	}
	public void setCheck_answer(String check_answer) {
		this.check_answer = check_answer;
	}

	
}//end of class
