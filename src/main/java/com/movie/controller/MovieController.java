package com.movie.controller;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.movie.dto.PagingDTO;
import com.movie.util.Paging;

@Controller
public class MovieController {

	@Autowired
	MovieService movieservice;
	@RequestMapping(value = "/movieList.do", method = RequestMethod.GET)
	public String movieList(@RequestParam(value="page",defaultValue="1")int page,@RequestParam(value="sort",defaultValue="")String sort,HttpServletRequest request, Model model) {
		int allCount = 0;
		Paging paging = Paging.getInstance();
		paging.setNewsPerPage(15);//한페이지당 글수
		paging.setMaxPage(5);//페이지바 최대 페이지 수
		PagingDTO dto = null;
		Calendar cal=Calendar.getInstance();
		List list=null;
		String today=cal.get(cal.YEAR)+"-"+(cal.get(cal.MONTH)+1)+"-"+cal.get(cal.DATE);
		System.out.println(today);
		if(sort.equals("")){//전체영화
			System.out.println("전체");
			list = movieservice.moviePageInfoByDate(page,today,sort);
			allCount=movieservice.movieCountAll(today);
			dto=paging.getPaging(allCount, page);
		}
		else if(sort.equals("now")){//개봉작
			System.out.println("개봉작");
			list = movieservice.moviePageInfoByDate(page,today,sort);
			allCount=movieservice.movieCountNow(today);
			dto=paging.getPaging(allCount, page);
		}
		else if(sort.equals("comming")){//예정작
			System.out.println("예정작");
			list = movieservice.moviePageInfoByDate(page,today,sort);
			allCount=movieservice.movieCountComming(today);
			dto=paging.getPaging(allCount, page);
		}
		List bestList = movieservice.selectBestMovie();
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("bestList", bestList);
		model.addAttribute("paging",dto);
		return "movieList";
	}

	// ��ȭ��������
	@RequestMapping(value = "/moviePage.do", method = RequestMethod.GET)
	public String movieView(Model model, MoviePageDTO dto, @Param("no") String no) throws Exception {
		int serial = Integer.parseInt(no);
		dto = movieservice.movieInfoSelect(serial);
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
