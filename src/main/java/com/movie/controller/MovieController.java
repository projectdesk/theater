package com.movie.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.movie.dao.MovieService;
import com.movie.dto.MoviePageDTO;

@Controller
public class MovieController {

	@Autowired
	MovieService movieservice;


	// ��ȭ����Ʈ ������
	@RequestMapping(value = "/movieList.do", method = RequestMethod.GET)
	public String movieList(HttpServletRequest request, Model model) {


		int page = 1;
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		List list = movieservice.moviePageInfo(page);
//		int allCount = boardService.audienceReviewCount();
//		Paging paging = Paging.getInstance();
//		dto = paging.getPaging(allCount, page);
		System.out.println(list);
		model.addAttribute("list", list);
		return "movieList";
	}

	// ��ȭ��������
	@RequestMapping(value = "/moviePage.do", method = RequestMethod.GET)
	public String movieView(Model model, MoviePageDTO dto, @Param("no") String no) throws Exception {
		int serial = Integer.parseInt(no);
		dto = movieservice.movieInfoSelect(serial);
		System.out.println(dto.getActor());
		System.out.println(dto);
		model.addAttribute("dto", dto);

		return "moviePage";
	}

	// ��ȭ���� �۾��� ��
	@RequestMapping(value = "/movieWrite.do", method = RequestMethod.GET)
	public String movieWrite() {

		return "movieWrite";
	}

	@RequestMapping(value = "/movieWrite.do", method = RequestMethod.POST)
	public String movieUpload(@RequestParam("file") MultipartFile multipartFile, MoviePageDTO dto)
			throws Exception {

		System.out.println(dto.toString());
		movieservice.insertMovieInfo(dto);

		System.out.println("���ϸ�" + multipartFile.getOriginalFilename());
		System.out.println("���ϻ�����" + multipartFile.getSize());

		MultipartFile f = dto.getFile();
		if (!f.isEmpty()) {
			String poster = f.getOriginalFilename();
			String path = "C:\\Users\\HANKYUNGAE\\Desktop\\mywork_web\\theater\\src\\main\\webapp\\resources\\image\\";
			System.out.println("path :" + path);
			File file = new File(path + File.separator + poster);
			dto.setPoster(poster);
			f.transferTo(file);

		}

		movieservice.moviePosterInsert(dto);

		return "redirect:/movieWrite.do";
	}

}
