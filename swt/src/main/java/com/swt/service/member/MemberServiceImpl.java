package com.swt.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.swt.domain.member.MemberDTO;
import com.swt.persistence.member.MemberDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		// DAO한테 id 줘야함 
		return mDao.idCheck(id);
	}

	@Override
	public int create(MemberDTO mDto) {
		// 여기서 실질적으로 서비스 동작이 이뤄짐. 실질적인 비즈니스로직 처리.
		// 비즈니스로직: 회원가입
		// 회원가입을 하기위해서는 DB를 사용해야함 
		// Spring와서는 try~catch안함 다 setting돼있음
		return mDao.create(mDto);	
	}

	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
		// 비즈니스 로직
		// 1) DB에 ID와 PW가 매칭되는 지 Check
		// 2) Check가 맞으면(로그인 성공)
		//		=> session에 담음
		// 3) Check가 틀리면(로그인 실패)
		//		=> 원페이지(로그인모달창)에 돌아가서 경고메시지 출력
		
		// session에 안 담아줘야 함 Why? 1)때문에 DB탐. 2,3)때문에 타는 거 아님. 1)의 결과에 따라 2)할지 3)할지 결정 service에서 session을 쓰는거고
		// DB에선 1)만해서 id,pw체크 DB에선 session안씀
		String name = mDao.login(mDto);
		boolean result = false;
		if(name!=null) { // 로그인 성공 
			// session에 회원정보를 담아야 함 
			// id, name만 담음 필요할때마다 꺼내옴 
			// 이때 세션에 실제 데이터가 들어감 
			session.removeAttribute("userid");
			session.removeAttribute("name");
			session.setAttribute("userid", mDto.getId());	// id는 DTO에서 꺼내옴 
			session.setAttribute("name", name); // name은 sql 실행한 결과 꺼내옴. select로 name만 출력했으니까 
			result = true;
			log.info("session>>>>>>>"+session.getAttribute("name"));
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		// 세션 전체 값 초기화
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(HttpSession session) {
		String id = (String)session.getAttribute("userid");	// session에 들어가면 type이 없어지고 Object가 돼서 형변환 필요 
		MemberDTO mDto = mDao.viewMember(id);
		return mDto;
	}

}
