package com.movie.dto;

import org.springframework.web.multipart.MultipartFile;

public class MoviePageDTO {

	private int no;
	private String title;
	private String content;
	private String play_date;
	private String genre;
	private String director;
	private String limit;
	private String actor;
	private int hit;

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
	}

	private int movie_no;
	private String poster;
	private MultipartFile file;

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
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

	public String getPlay_date() {
		return play_date;
	}

	public void setPlay_date(String play_date) {
		this.play_date = play_date;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}


	
	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "MoviePageDTO [no=" + no + ", title=" + title + ", content=" + content + ", play_date="
				+ play_date + ", genre=" + genre + ", director=" + director + ", limit=" + limit + "]";
	}
	
	

}
