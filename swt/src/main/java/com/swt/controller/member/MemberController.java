package com.swt.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.swt.domain.member.MemberDTO;
import com.swt.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value="member/*")
public class MemberController {
	
	@Inject
	private MemberService service;
	
	@ResponseBody	
	@RequestMapping(value="/login", method = RequestMethod.POST)	// 메서드 실행하라고 할때 타고오는 url 사용자가 url칠때 이걸 보고 찾음 controller단을
	public String login(MemberDTO mDto, HttpSession session) {// 로그인한 정보를 session에 담아야함
								//이때는 세션 사용하려고 만들기만 함 service다녀와야 세션에 로그인정보가 담김
		// 서비스는 순수 비즈니스 로직 동작하는 부분만 만드는 곳. controller에서 필요한 데이터 다 받아서 보내줌. 더 데이터가 필요하면 DAO에서 보내줌  
		log.info(">>>>>>> AJAX:로그인");	
		boolean result = service.login(mDto, session);	// 어떤 서비스사용할건지 필요한 data를 controller가 service에 주입. 
		String flag = "-1";
		if(result) {// result=true일때만 탐
			flag="1";
		}
		return flag;	
	}
	
	@ResponseBody	
	@RequestMapping(value="/logout", method = RequestMethod.POST)	
	public void logout(HttpSession session) {
		log.info(">>>>> 로그아웃");
		service.logout(session);
	}
	
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
	// 회원가입 페이지 출력
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public String createView() {
		log.info(">>>>>>> 회원가입 페이지 출력");	// 출력만하는 곳이니까 따로 service없음 servlet에선 action만들어야했음. viewresolver 화면단 어디있는지 pullname을 만들어서 알려줌. 
		return "member/member_join";
	}
	// DB를 통한 회원가입 액션
	// url이 같아도 method가 다르면 다르게 탐	// 메소드이름) 페이지출력: createView 동작: createPlay 
	@RequestMapping(value="/create", method = RequestMethod.POST)
	public String createPlay(MemberDTO mDto, RedirectAttributes rttr) { // 매개변수 안에 쓴게 화면단 form태그안의 input애들을 싹 받는 거. input태그의 name값이 DTO의 변수이름과 동일해야함 
		log.info(">>>>>>> DB를 통한 회원가입 액션");	// 출력만하는 곳이니까 따로 service없음 servlet에선 action만들어야했음. viewresolver 화면단 어디있는지 pullname을 만들어서 알려줌. 
		log.info(mDto.toString());
		
		// sql의 실행결과인 0또는1이 담김
		int result = service.create(mDto);	// service가 action같은 곳 실제 비즈니스로직 동작하는 부분 
		// servlet에서도 엄밀히 따지면 controller에서 데이터 받아서 action으로 request로 넘겨주는 것이었음 
		if(result>0) {
			log.info("가입성공");
//			rttr.addFlashAttribute("message","Welcome! 1회성 데이터"); // 단발성으로 한번만 보낼 수 있음
			return "redirect:/"; // 회원가입하면 데이터 바뀌니까 redirect
		} else {
			log.info("가입실패");
			return "/member/constract";
		}
		
	}

	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateView(HttpSession session, Model model) {
		log.info(">>>>>>> 회원수정 페이지 출력");
		MemberDTO mDto = service.viewMember(session);
		model.addAttribute("one", mDto);
		return "member/info_update";
	}
	// 세션이 안됨!!!!
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updatePlay(MemberDTO mDto, HttpSession session) {
		log.info(">>>>>>> 회원수정 액션");
		log.info(mDto.toString());
		service.memUpdate(mDto, session);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/pwupdate", method = RequestMethod.GET)
	public String pwUpdateView() {
		log.info(">>>>>>> 비밀번호 수정 페이지 출력");
		// 데이터 띄울 거 없음 값이 미리 들어올게 없음 
		return "member/pw_update";
	}
	
	@RequestMapping(value="/pwupdate", method = RequestMethod.POST)
	public String pwUpdatePlay(MemberDTO mDto) {
		log.info(">>>>>>> 비밀번호 수정 액션");
		// 데이터 띄울 거 없음 값이 미리 들어올게 없음 
		
		service.pwUpdate(mDto);
		return "redirect:/";	// 비밀번호수정위해 DB타고 데이터값 바뀌고 index로 이동하니까 redirect
	}
	
	@ResponseBody
	@RequestMapping(value="/pwcheck", method = RequestMethod.POST)
	public String pwCheck(MemberDTO mDto) { // 화면단에서 온 데이터를 넣어줌. validation.js에서 쿼리스트링으로 보내 준 값.
		log.info(">>>>>>> AJAX: 현재 비밀번호 체크");
		// id => 현재 로그인한 유저의 ID
		// pw => 사용자가 입력한 현재비밀번호 값
		// DB에 등록되어있는 비밀번호 값이 필요 
		// 이런 일련의 비즈니스 로직을 service에서 처리함
		String result = service.pwCheck(mDto);
		return result;
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.GET)
	public String deleteView() {// session은 공용이라 어디서든 받아올수있음. ㅇㅇㅇ님하고 화면단에서 하는건 화면단에서 session쓰면 됨 
		log.info(">>>>>>> 회원탈퇴 페이지 출력");
		return "member/delete_mem";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String deletePlay(String id, HttpSession session) {
		log.info(">>>>>>> 회원탈퇴 액션");
		service.delete(id, session);
		return "redirect:/";
	}
	
}
