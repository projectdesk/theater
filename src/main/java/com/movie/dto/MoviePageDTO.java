package com.movie.dto;

import org.springframework.web.multipart.MultipartFile;

public class MoviePageDTO {

	private int no;
	private String title;
	private String content;
	private String play_date;
	private String genre;
	private String director;
	private String limit_play;
	private String actor;

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

	public int getno() {
		return no;
	}

	public void setno(int no) {
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

	public String getLimit_play() {
		return limit_play;
	}

	public void setLimit_play(String limit_play) {
		this.limit_play = limit_play;
	}

	@Override
	public String toString() {
		return "MoviePageDTO [no=" + no + ", title=" + title + ", content=" + content + ", play_date="
				+ play_date + ", genre=" + genre + ", director=" + director + ", limit_play=" + limit_play + "]";
	}

}
