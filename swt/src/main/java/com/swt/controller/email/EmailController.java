package com.swt.controller.email;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.swt.domain.email.EmailDTO;
import com.swt.service.email.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("email/*")
public class EmailController {
	@Inject
	EmailService eService;
	
	@RequestMapping("write")
	public String write() {
		return "/email/write";
	}
	
	@RequestMapping("send")
	public String send(@ModelAttribute EmailDTO eDto, Model model) {
		try {
			log.info(eDto.toString());
			eDto.setMessage(eDto.getMessage()+"//발신자 메일: "+eDto.getSenderMail());
			eService.sendMail(eDto);
			model.addAttribute("message","이메일이 발송되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message","이메일 발송 실패...");
		}
		return "email/write";
	}
}
