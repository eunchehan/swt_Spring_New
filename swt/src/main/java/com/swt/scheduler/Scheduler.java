package com.swt.scheduler;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.swt.domain.member.MemberDTO;
import com.swt.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class Scheduler {
	
	@Inject
	private MemberService service;
	
	@Transactional
	@Scheduled(cron = "0 10 * * * *")
	public void cronTest() throws IOException{
		List<MemberDTO> list = service.memberList();
		
		for (MemberDTO memberDTO : list) {
			log.info("===============회원 목록 출력===============");
			log.info("회원 ID: "+memberDTO.getId()+", 회원 이름: "+memberDTO.getName());
		}
		
	}
		
}
