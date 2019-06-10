package com.swt.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.swt.domain.board.BoardDTO;
import com.swt.service.board.BoardService;
import com.swt.service.board.Pager;
import com.swt.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("board/*")
public class BoardController {
	// 필요할때마다 의존성주입해서 쓰는게 @Inject하는 의미가 있기 때문에 접근제한자는 private
	@Inject
	private BoardService service;	
	// 게시글 전체리스트 출력
	@RequestMapping(value="list", method=RequestMethod.GET)
	public ModelAndView list(// ModelAndView: 데이터보내는거랑 담는 거 같이 씀
			// @RequestParam 받는부분 생략가능하지만 defaultValue쓰려면 반드시 써야함. defaultValue는 sql의 DEFAULT SYSDATE와 비슷. 
			@RequestParam(defaultValue="new") String sort_option,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage) {
		log.info(">>>>>> 게시글목록 출력");
		// 레코드 갯수 계산
		int count = service.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록 
		List<BoardDTO> list = service.listAll(sort_option, search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView(); // 화면 갈 때 보내는 거 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/qna");
		mav.addObject("map", map);
		return mav;

//		ModelAndView안쓰면 이렇게 함 
//		model.addAttribute("map", map);
//		return "board/qna";
	}
}
