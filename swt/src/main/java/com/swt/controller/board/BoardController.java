package com.swt.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
//		Model: 데이터 보내는 것 View: 페이지 이동
		ModelAndView mav = new ModelAndView(); // 화면 갈 때 보내는 거 
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);	// mapper에서 sql문 실행결과를 담은 list를 map에 넣음 
		map.put("count", count); // Pager에서 계산한 count (Pager클래스에 전역변수로 선언된 count는 없음. 매개변수로 메서드로 가져가서 지역변수로 계산되고 돌아옴)
		map.put("pager", pager); // Pager 클래스가 가지고 있는 변수들을 가지고 감 (선언된 전역변수)
		map.put("sort_option", sort_option); 
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		mav.setViewName("board/qna");	// 페이지 이동경로 
		mav.addObject("map", map);		// 데이터 전송
		return mav;

//		ModelAndView안쓰면 이렇게 함 
//		model.addAttribute("map", map);
//		return "board/qna";
	}
	
	// 게시글 1건(상세게시글) 출력 / bno받고 상세게시글 출력이라고 log찍기 
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(int bno, Model model,HttpSession session) {
		log.info(">>>>>>> 상세 게시글 출력"+bno);
		// 조회수 증가 처리 
		service.increaseViewCnt(bno, session);
		
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one",bDto);
		
		return "board/view";
	}
}
