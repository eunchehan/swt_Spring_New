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
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		// 비즈니스로직 
		// 1) 회원정보수정 
		int result = mDao.memUpdate(mDto);
		
		// 2) 회원정보 수정 성공하면
		//    - session의 name값을 수정한 이름으로 변경 
		if(result>0) {
			session.removeAttribute("name");	// 기존에 있는 값 지워서 session 초기화 
			session.setAttribute("name", mDto.getName());	// DTO에 있는 name 값 꺼내서 변경된 name으로 바꿔줌
		}
		
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

	@Override
	public String pwCheck(MemberDTO mDto) {
		// id => 현재 로그인한 유저의 ID
		// pw => 사용자가 입력한 현재비밀번호 값
		// DB에 등록되어있는 비밀번호 값이 필요 
		// 여기서 비즈니스 로직 처리
		// DB에서 가져온 현재비밀번호와 사용자가 입력한 비밀번호가 같은지 체크해서
		// 같으면 1, 틀리면 -1을 view단으로 전송 
		String name = mDao.login(mDto); // sql문 결과 조회되면 맞는거고 안되면 틀린거임 login할때 sql문과 동일하니까 login메서드 재사용 
		String result = "-1";
		if(name!=null) {
			result="1";
		}
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		// DB에 있는 비밀번호를 수정
		// data: id, pw => mDto
		
		mDao.pwUpdate(mDto);
	}

	@Override
	public void delete(String id, HttpSession session) {
		// 비즈니스 로직
		// 1) 회원삭제 
		//    - ID필요 -> session 
		int result = mDao.delete(id);
		// 2) 회원삭제 성공 시 => 세션 전체 값 초기화
		if(result>0) {
			session.invalidate();
		}
	}

	

}
