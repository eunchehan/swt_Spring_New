package com.swt.controller.member;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swt.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/constract", method = RequestMethod.GET)	// 메서드 실행하라고 할때 타고오는 url 사용자가 url칠때 이걸 보고 찾음 controller단을
	public String constract() {
		log.info(">>>>>>> 회원가입 동의");
		return "member/constract";	// 나가는 경로. RequestMapping이랑은 상관x. 이건 사용자에게 화면단 띄워줄때 
	}
	@ResponseBody	// return을 데이터를 해주니까.. 이걸 붙여주면 return값을 돌아갈 페이지로 인식하는게 아니고 데이터로 보낸다. AJAX쓸때는 거의 이걸 붙여줌  
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idCheck(String id) {
		log.info("AJAX: ID 중복 체크");
		return service.idCheck(id);	// 돌아갈화면이 있는 게 아니고 원복. 순수데이터가 들어가야함. 
	}
	
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String create() {
		log.info(">>>>>>> 회원가입 페이지 출력");	// 출력만하는 곳이니까 따로 service없음 servlet에선 action만들어야했음. viewresolver 화면단 어디있는지 pullname을 만들어서 알려줌. 
		return "member/member_join";
	}

	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String update() {
		log.info(">>>>>>> 회원수정");
		return "";
	}

	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String delete() {
		log.info(">>>>>>> 회원삭제");
		return "";
	}
	
}
